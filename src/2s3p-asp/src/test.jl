
using DataFrames
using PrettyTables
using CSV

include("./prosumer.jl")
include("./maker.jl")
include("./func.jl")


"Test the quote function of makers."
function test_quote()
    maker = init_maker(num_unit = 100, num_forward = 10)

    quote_init!(maker)

    ## Start Simulation
    for i = 2: (maker.num_unit - maker.num_forward)
        ## The maker quotes the forward prices for this current unit
        vec_price = quote!(maker, i)
    end

    CSV.write("../results/mat_p.csv", DataFrame(maker.mat_p),
        writeheader = false)
end


test_quote()
