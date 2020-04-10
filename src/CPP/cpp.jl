
using DataFrames, JuMP, Gurobi, Dualization


```
  ConProPlant()

Structure for continuous provision plants.

  q: linear penalty for unsatisfied requests
  r: linear costs for inputs
```
struct ConProPlant
  a::Union{Array{Float64,2}, Float64}
  b::Union{Array{Float64,2}, Float64}
  c::Union{Array{Float64,2}, Float64}
  d::Union{Array{Float64,2}, Float64}

  ##
  kp::Int64
  q::Float64
  r::Float64

  ##
  n_u::Int64
  n_w::Int64
  n_v::Int64

  ##
  v_min::Union{Array{Float64,1}, Float64}
  v_max::Union{Array{Float64,1}, Float64}
  u_min::Union{Array{Float64,1}, Float64}
  u_max::Union{Array{Float64,1}, Float64}
  u_delta::Union{Array{Float64,1}, Float64}

  function ConProPlant(a, b, c, d; kp, q, r, n_u, n_w, n_v, v_min, v_max,
      u_min, u_max, u_delta)

    test_a(a, n_w)
    test_b(b, n_w, n_u)
    test_c(c, n_w, n_v)
    test_d(d, n_v, n_u)

    new(a, b, c, d, kp, q, r, n_u, n_w, n_v, v_min, v_max, u_min, u_max,
      u_delta)
  end
end


function model_mtm(cpp::ConProPlant; l::Float64, b_p::Array{Float64,1},
    a_p::Array{Float64,1}, y::Array{Float64,1})
  ## data
  kp = cpp.kp
  q_vec = (kp .- collect(1:kp)) / kp * cpp.q
  r_vec = (kp .- collect(1:kp)) / kp * cpp.r
  # if n_u > 1
  #   r_mat = hcat(r_vec, repeat([0], kp))
  # else
  #   r_mat = r_vec
  # end

  ## decision making model
  model = Model(with_optimizer(Gurobi.Optimizer, Presolve = 0, OutputFlag = 0));

  ## decision variables for dynamics
  @variable(model, u[1:cpp.n_u, 1:kp])
  @variable(model, w[1:cpp.n_w, 1:kp])
  @variable(model, cpp.v_min <= v[1:cpp.n_v, 1:kp] <= cpp.v_max)

  @variable(model, e[1:kp])
  @variable(model, e_minus[1:kp] >= 0)
  @variable(model, e_plus[1:kp] >= 0)
  @variable(model, h[1:kp] >= 0)

  ## obj
  @objective(model, Max, - h' * q_vec - u[1, :]' * r_vec + l * (e_plus' * b_p -
    e_minus' * a_p))

  ## dynamics of CPP
  @constraint(model, [k = 1:(kp-1)], hcat(w[:, k+1]) .== cpp.a * hcat(w[:, k]) +
    cpp.b * hcat(u[:, k]))
  @constraint(model, [k = 1:kp], hcat(v[:, k]) .== cpp.c * hcat(w[:, k]) +
    cpp.d * hcat(u[:, k]))

  ## constraints for inputs and outputs
  @constraint(model, [k = 1:kp], cpp.u_min .<= u[:, k])
  @constraint(model, [k = 1:kp], u[:, k] .<= cpp.u_max)
  @constraint(model, [k = 1:kp], cpp.v_min .<= v[:, k])
  @constraint(model, [k = 1:kp], v[:, k] .<= cpp.v_max)
  @constraint(model, [k = 1:(kp-1)], - cpp.u_delta .<= u[:, k+1] - u[:, k])
  @constraint(model, [k = 1:(kp-1)], u[:, k+1] - u[:, k] .<= cpp.u_delta)

  ## constraints
  @constraint(model, con_h, h .>= y + e - v[1, :])
  @constraint(model, e_plus .>= e)
  @constraint(model, e_minus .>= - e)

  return model
end


function test_a(a, n_w)
  if a isa Float64
    if n_w != 1
      error("Matrix A is wrong!")
    end
  else
    m, n = size(a)
    if m != n_w || n != n_w
      error("Matrix A is wrong!")
    end
  end
end


function test_b(b, n_w, n_u)
  if b isa Float64
    if n_u != 1 || n_w != 1
      error("Matrix B is wrong!")
    end
  else
    m, n = size(b)
    if m != n_w || n != n_u
      error("Matrix B is wrong!")
    end
  end
end


function test_c(c, n_w, n_v)
  if c isa Float64
    if n_v != 1 || n_w != 1
      error("Matrix C is wrong!")
    end
  else
    m, n = size(c)
    if m != n_v || n != n_w
      error("Matrix C is wrong!")
    end
  end
end


function test_d(d, n_v, n_u)
  if d isa Float64
    if n_v != 1 || n_u != 1
      error("Matrix D is wrong!")
    end
  else
    m, n = size(d)
    if m != n_v || n != n_u
      error("Matrix D is wrong!")
    end
  end
end
