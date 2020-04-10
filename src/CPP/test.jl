## cd ~/GitHub/RexNet/src/CPP

function test_cpp()
  cpp = ConProPlant(0.004178, vcat(hcat([5.269, 0.9958])'), 1.0, vcat(hcat([0.0, 0.0])'), kp = 60,
      q = 10, r = 5, n_u = 2, n_w = 1, n_v = 1, v_min = 0.0, v_max = 100.0,
      u_min = 0.0, u_max = 100.0, u_delta = 20.0)
  model = model_mtm(cpp, l = 1.0, b_p = repeat([1.0], 60),
    a_p = repeat([1.5], 60), y = repeat([1.5], 60))
  optimize!(model)
  @show objective_value(model)
  # @show shadow_price(model[:con_h][2])

  # y_new = repeat([1.5], 60)
  # y_new[2] += 1
  # model_1 = model_mtm(cpp, l = 1.0, b_p = repeat([1.0], 60),
  #   a_p = repeat([1.5], 60), y = y_new)
  # optimize!(model_1)
  # @show objective_value(model_1)
  # @show shadow_price(model_1[:con_h][2])

  dual_model = dualize(model)
  optimize!(dual_model)
  @show objective_value(dual_model)
  return dual_model
end


include("./cpp.jl")
dual_model = test_cpp()
