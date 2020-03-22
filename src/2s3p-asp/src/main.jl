## "2s2p-awp" Simulation Program
## Edward J. Xu
## Jan 3rd, 2020

## cd ~/GitHub/ReservexSim/ReservexSim/2s2p-awp/src
## include("main.jl")
using DataFrames
using PrettyTables
using CSV

include("./prosumer.jl")
include("./maker.jl")
include("./func.jl")
include("./sim.jl")


"Simulate a market once by initating a maker and its population."
function main()
    ## Initiate the maker and prosumers
    maker, li_psr = model_market()

    ## Simulate the market and store the data in the corresponding structs
    simulate!(maker, li_psr)

    ## Export the result
    store_data(maker, li_psr)

    ## Summarize the effect
    mat_p_value, mat_zx, mat_loss, vec_loss_sum, mat_xy_all = extract_result(
        maker, li_psr)

    store_result(mat_p_value = mat_p_value, mat_q = maker.mat_q,
        vec_x = maker.vec_x, mat_zx = mat_zx, mat_loss = mat_loss,
        vec_loss_sum = vec_loss_sum, mat_xy_all = mat_xy_all)

    # return maker, li_psr
end


main()
