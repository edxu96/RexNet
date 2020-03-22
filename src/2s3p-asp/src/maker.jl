## Script for Maker in "2s2p-awp" Simulation Program
## Edward J. Xu
## Jan 3rd, 2020


"Market Maker is responsible for quoting forward prices"
struct Maker
    uu  # Number of prosumers
    ll  # Number of simulated units
    kk  # Number of forward units
    tpm_p  # Trans prob mat of furthest forward prices
    dt  # Dict to store the values
    mat_p  # Matrix to store the forward prices
    mat_q  # Matrix to store the sum of reservations
    vec_x  # Matrix to store the sum of realizations

    function Maker(uu, ll, kk, prob_trans, dt)
        tpm_p = [1 - prob_trans prob_trans; prob_trans 1 - prob_trans]
        mat_p = Array{Int64}(undef, ll, kk)
        mat_p .= -1
        mat_q = Array{Int64}(undef, ll, kk)
        mat_q .= 0
        vec_x = Array{Int64}(undef, ll)
        vec_x .= 0
        new(uu, ll, kk, tpm_p, dt, mat_p, mat_q, vec_x)
    end
end


"""
Update the other forward prices using the same Markov chain. It can only be
used in function "quote!" and "init_maker".
"""
function update_price!(maker, j_fur)
    for n = 1: (maker.kk - 1)
        p_i1 = maker.mat_p[j_fur - n, end - n + 1]
        maker.mat_p[j_fur - n, end - n] = sample_vec_prob(
            maker.tpm_p[p_i1, :])
    end
end


"Set the parameters for simulation by modelling a market maker."
function model_maker(; ll, kk, uu, prob_trans)
    dt = Dict("x" => [0, 1], "p" => [5, 10])
    maker = Maker(uu, ll, kk, prob_trans, dt)

    ## Initiate the forward prices for first current unit.
    ## The forward prices at current unit 1 are all the same and sampled.
    j_fur = 1 + maker.kk
    maker.mat_p[j_fur, end] = sample_vec_prob([0.5, 0.5])
    for n = 1: (maker.kk - 1)
        maker.mat_p[j_fur - n, end - n] = maker.mat_p[j_fur - n + 1,
            end - n + 1]
    end

    return maker
end


"""
Maker generates the new forward price, update other prices and quote.
Furthest forward price is generated using Markov chain with previous value
being the furthest forward price of last current unit. Then, update the
other forward prices using Markov chain with previous value being the
previous forward price for this target unit at last current unit.
"""
function quote!(maker, i)
    j_fur = i + maker.kk

    ## Generate the furthest forward price using Markov chain.
    p_i1 = maker.mat_p[j_fur - 1, end]
    maker.mat_p[j_fur, end] = sample_vec_prob(maker.tpm_p[p_i1, :])

    ## Update the forward price using the same Markov chain.
    update_price!(maker, j_fur)

    ## Return the all the forward prices at the same current unit.
    vec_price = [maker.mat_p[i+n, n] for n = 1:maker.kk]
    return vec_price
end
