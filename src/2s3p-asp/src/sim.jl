## Script for additional functions in "2s2p-awp" Simulation Program
## Edward J. Xu
## Jan 3rd, 2020


"Simulate the market once with the maker and its population"
function simulate!(maker, li_psr)
    ## Start Simulation
    for i = 2: (maker.ll - maker.kk)
        ## The maker quotes the forward prices for this current unit
        vec_price = quote!(maker, i)

        ## Prosumers move according to the price
        for psr in li_psr
            behave!(psr, i, vec_price, maker.dt["p"])
        end
    end

    for psr in li_psr
        ## Sum all the reservations
        maker.mat_q[:, :] += psr.mat_z

        ## Sum all the realizations
        for i = 2: (maker.ll - maker.kk)
            maker.vec_x[i] += maker.dt["x"][psr.vec_x[i]]
        end
    end
end
