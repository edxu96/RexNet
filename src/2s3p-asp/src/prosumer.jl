## Script for Prosumer in "2s2p-awp" Simulation Program
## Edward J. Xu
## Jan 3rd, 2020


"Structure for prosumer"
struct Prosumer
    awp_default  # Default AWP, which is supposed to be small
    tpm_awp  # Transition probability matrix to form furthest AWP
    alpha  # Coefficient factor for the effect of reservation on realization
    loss  # Expected loss function if x_t = 1 while x_t1 = 0
    mat_y  # Matrix to store AWPs
    mat_z  # Matrix to store reservations
    vec_x  # Vector to store realizations
    mat_obj
    kk

    function Prosumer(awp_default:: Float64, prob_tran_awp:: Float64,
            alpha:: Float64, loss:: Float64, ll:: Int64, kk:: Int64)
        tpm_awp = [1 - prob_tran_awp prob_tran_awp;
            1 - prob_tran_awp prob_tran_awp]
        mat_y = Array{Float64}(undef, ll, kk)
        mat_y .= 0  # !!!
        mat_z = Array{Int64}(undef, ll, kk)
        mat_z .= 0
        vec_x = Array{Int64}(undef, ll)
        vec_x .= -1
        mat_obj = Array{Float64}(undef, ll, kk + 1)
        mat_obj .= 0
        new(awp_default, tpm_awp, alpha, loss, mat_y, mat_z, vec_x, mat_obj, kk)
    end
end


"Model a prosumer"
function model_psr(ll:: Int64, kk:: Int64; alpha:: Float64, loss:: Float64)
    psr = Prosumer(0.05, 0.05, alpha, loss, ll, kk)

    ## Initiate the realization in first unit
    psr.vec_x[1] = sample_vec_prob([0.5, 0.5])

    ## Initiate the first batch of AWPs
    for k = 1:kk
        psr.mat_y[1 + k, k] = psr.awp_default
    end
    return psr
end


"Prosumer forms its furthest AWP."
function form!(psr; i)
    j = i + psr.kk
    ## Form the new furthest AWP
    awp_j1 = psr.mat_y[j-1, end]  # The previous furthest AWP
    if abs(psr.awp_default - awp_j1) < 1E-6
        # Get the index of the previous furthest AWP
        psr.mat_y[j, end] = sample_vec_prob(psr.tpm_awp[1, :])
    else
        psr.mat_y[j, end] = sample_vec_prob(psr.tpm_awp[2, :])
    end
    ## Get the value according to the sampled index
    if psr.mat_y[j, end] == 1
        psr.mat_y[j, end] = psr.awp_default
    else
        psr.mat_y[j, end] = 1 - psr.awp_default
    end

    ## By default, the reservice is 0
    psr.mat_z[j, end] = 0
end


"""
Prosumer updates its AWP becuase of its furthest AWP.
    j: index of the target unit.
    k: index of backward units relative to the target units
"""
function update_awp!(psr, i)
    for k_inverse = 1: (psr.kk - 1)
        k = psr.kk - k_inverse
        j = i + k
        psr.mat_y[j, k] = 0.5 * psr.mat_y[j+1, k+1] + 0.5 * psr.mat_y[j, k+1]
    end
end


"""
Prosumer updates its AWP because of it realized state switching.
    j: index of the target unit.
    k: index of forward units relative to the current unit.
"""
function update_real!(psr, i)
    # ## Weak forward effect of realization switching
    # ## 1-step for next current unit is updated using default awp
    # j = i + 1
    # psr.mat_y[j, 1] = 0.5 * psr.awp_default + 0.5 * psr.mat_y[j, 2]
    # ## Update the rest
    # for k = 2: (psr.kk - 1)
    #     j = i + k
    #     psr.mat_y[j, k] = 0.5 * psr.mat_y[j-1, k-1] + 0.5 * psr.mat_y[j, k+1]
    # end

    ## Strong forward effect of realization switching
    for k = 2: (psr.kk - 1)
        j = i + k
        psr.mat_y[j, k] = psr.awp_default
    end
end


"Update the rest of AWPs"
function update!(psr; i, whe_switch)
    if whe_switch
        # If the realization is switched, the effect from realization will be
        # used in the update.
        update_real!(psr, i)
    else
        update_awp!(psr, i)
    end

    ## Update the AWPs without forward effect of realized switching
    # update_awp!(psr, i)
end


"""
Prosumer trade according to its expectation, loss and forward price.
    j: index of the target unit.
    i: index of the current unit.
    p_value: value of forward price for target unit j at current unit (j-k).
"""
function trade!(psr; j, i, p_value)
    k = j - i
    x_i = psr.vec_x[i]

    ## Get all the transition probability matrices
    li_tpm = [Array{Float64}(undef, 2, 2) for l = 1:k]
    # list of transition probability matrix
    for v = 1:k
        y = psr.mat_y[i + v, v]
        li_tpm[v] = [1 - y y; y 1 - y]
    end

    ## Get the k-step transition probability matrix
    tpm_k = li_tpm[1]
    if k > 1
        for v = 2:k
            tpm_k = tpm_k * li_tpm[v]
        end
    end

    ## Get the conditional probability of x_j = 1 given x_i
    if x_i == 1
        ## If x_i = 1, then there should not be transition
        prob_1 = 1 - tpm_k[1]
    else
        prob_1 = tpm_k[1]
    end

    ## According to the probability, make the decision
    if prob_1 * psr.loss <= p_value
        ## will not reserve, and get refund if reserved before
        psr.mat_z[j, k] = 0
        if psr.mat_z[j, k+1] == 1
            psr.mat_obj[j, k] = p_value
        end
    else
        ## will reserve, and pay if not reserved before
        psr.mat_z[j, k] = 1
        if psr.mat_z[j, k + 1] == 0
            psr.mat_obj[j, k] = - p_value
        end
    end
end


"""
Prosumer realize its current state according their reservation and sampling.
    i: index of current unit
"""
function realize!(psr; i)
    ## Depending on the previous state, the effect of reservation differs.
    if psr.vec_x[i-1] == 1
        # The previous state is absence, then it is likely to change the state
        z_i = 1
    else
        z_i = -1
    end

    ## Simulate the affected 1-step AWP.
    ## If the value is beyond [0, 1], 0 or 1 will be used.
    y_i_raw = psr.mat_y[i, 1] + psr.alpha * z_i
    if y_i_raw < 0
        y_i = 0
    elseif y_i_raw > 1
        y_i = 1
    else
        y_i = y_i_raw
    end

    ## Sample the state according to 1-step AWP.
    if rand() > y_i
        # Do not switch the state
        psr.vec_x[i] = psr.vec_x[i-1]
        whe_switch = false
    elseif psr.vec_x[i-1] == 1
        psr.vec_x[i] = 2
        whe_switch = true
    elseif psr.vec_x[i-1] == 2
        psr.vec_x[i] = 1
        whe_switch = true
    end

    ## If the temperature is not high enough when the prosumer is present,
    ##     the prosumer will bare the loss.
    if (psr.mat_z[i, 1] == 0) & (psr.vec_x[i] == 2)
        psr.mat_obj[i, end] = - psr.loss
    else
        psr.mat_obj[i, end] = 0
    end

    return whe_switch
end


"""
Prosumer make series of moves.
    i: index of current unit
    kk: number of forward trading units
"""
function behave!(psr, i, vec_p, vec_value_p)
    form!(psr, i = i)

    ## Assume to always realize before updating and trading
    whe_switch = realize!(psr, i = i)

    ## Update the rest of the AWPs
    update!(psr, i = i, whe_switch = whe_switch)

    ## Trade for (i+1) to (i+K-1) forward units
    for k = 1: (psr.kk - 1)
        trade!(psr, j = i + k, i = i, p_value = vec_value_p[vec_p[k]])
    end
end
