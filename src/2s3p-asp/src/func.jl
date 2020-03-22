## Script for additional functions in "2s2p9f" Simulation Program
## Edward J. Xu
## Dec 29th, 2019


"Model the market according to input parameters."
function model_market()
    maker = model_maker(ll = 100, kk = 5, uu = 100, prob_trans = 0.1)
    li_psr = [model_psr(maker.ll, maker.kk, alpha = 0.01, loss = 25.)
        for i = 1: maker.uu]
    return maker, li_psr
end


"Sample using a Vector of Probabilities"
function sample_vec_prob(vec_prob)
    if rand() <= vec_prob[1]
        result = 1
    else
        result = 2
    end
    return result
end


"Extract the results from one time simulation."
function extract_result(maker:: Maker, li_psr:: Array{Prosumer,1})
    ## Get the results
    mat_p_value = Array{Float64}(undef, maker.ll, maker.kk)
    for i = 1: maker.ll
        for n = 1: maker.kk
            if maker.mat_p[i, n] == -1
                mat_p_value[i, n] = 0
            else
                mat_p_value[i, n] = maker.dt["p"][maker.mat_p[i, n]]
            end
        end
    end

    ## Match of reservation and realization
    mat_zx = Array{Float64}(undef, maker.uu * maker.ll, 5)
    index = 1
    for u = 1: maker.uu
        for i = (1 + maker.kk): (maker.ll - maker.kk)
            mat_zx[index, :] = [i, u, li_psr[u].mat_z[i, 1],
                maker.dt["x"][li_psr[u].vec_x[i]], li_psr[u].mat_obj[i, end]]
            index += 1
        end
    end

    ## Gather all the losses and summarize
    mat_loss = Array{Int64}(undef, maker.ll, maker.uu)
    vec_loss_sum = Array{Float64}(undef, maker.ll)
    for u = 1:maker.uu
        mat_loss[:, u] = li_psr[u].mat_obj[:, end]
    end
    for l = 1: maker.ll
        vec_loss_sum[l] = sum(mat_loss[l, :])
    end

    ## Gather all the reservations of the population
    ## Vertically concatenate all the AWP matrix
    mat_xy_all = Array{Float64}(undef, maker.ll * maker.uu, 3 + maker.kk)
    for u = 1: maker.uu
        ## Turn the sensor data about realization to default value 0
        ## Because the value "-1" will mess up the visualization
        for l = 1: maker.ll
            if li_psr[u].vec_x[l] == -1
                li_psr[u].vec_x[l] = 1
            end
            li_psr[u].vec_x[l] = maker.dt["x"][li_psr[u].vec_x[l]]
        end

        mat_xy_all[((u - 1) * maker.ll + 1): (u * maker.ll), :] = hcat(
            repeat([u], maker.ll), collect(1: maker.ll), li_psr[u].vec_x,
            li_psr[u].mat_y)
    end

    return mat_p_value, mat_zx, mat_loss, vec_loss_sum, mat_xy_all
end


"Store the results from one simulation."
function store_result(;mat_p_value, mat_q, vec_x, mat_zx, mat_loss,
        vec_loss_sum, mat_xy_all)
    CSV.write("../results/mat_p.csv", DataFrame(mat_p_value),
        writeheader = false)
    CSV.write("../results/mat_q.csv", DataFrame(maker.mat_q),
        writeheader = false)
    CSV.write("../results/vec_x.csv", DataFrame(x = maker.vec_x),
        writeheader = false)
    CSV.write("../results/mat_zx.csv", DataFrame(mat_zx),
        writeheader = false)
    CSV.write("../results/mat_loss.csv", DataFrame(mat_loss),
        writeheader = false)
    CSV.write("../results/vec_loss_sum.csv", DataFrame(loss = vec_loss_sum),
        writeheader = false)
    CSV.write("../results/mat_xy_all.csv", DataFrame(mat_xy_all),
        writeheader = false)
end
