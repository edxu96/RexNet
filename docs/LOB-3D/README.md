
# Program Manual for LOB-3D

## Initialization


## Quick Glimpse

get the mid-, bid, ask price

these three values stored in a data table

## Limit Orders

Two ways to search limit orders

- active LO by units, for execution
- active LO by participants, for modification

###



can only reduce the size in order replacement

possible operations on a given order

- shrink <img src="/docs/LOB-3D/tex/567675b6470858bc2d04c88f54b050d0.svg?invert_in_darkmode&sanitize=true" align=middle width=25.79541194999999pt height=22.831056599999986pt/>
- expire, by the market <img src="/docs/LOB-3D/tex/567675b6470858bc2d04c88f54b050d0.svg?invert_in_darkmode&sanitize=true" align=middle width=25.79541194999999pt height=22.831056599999986pt/>
- cancel
- dump <img src="/docs/LOB-3D/tex/332cc365a4987aacce0ead01b8bdcc0b.svg?invert_in_darkmode&sanitize=true" align=middle width=9.39498779999999pt height=14.15524440000002pt/>

an order is a set of seats in LOB-3D



<p align="center"><img src="/docs/LOB-3D/tex/1a79260b8c093a872128c19c1be71760.svg?invert_in_darkmode&sanitize=true" align=middle width=151.0644795pt height=17.031940199999998pt/></p>

<img src="/docs/LOB-3D/tex/5c0de5b3ca26c81618efb51909e476b6.svg?invert_in_darkmode&sanitize=true" align=middle width=137.56079864999998pt height=24.65753399999998pt/>

composition of an order <img src="/docs/LOB-3D/tex/332cc365a4987aacce0ead01b8bdcc0b.svg?invert_in_darkmode&sanitize=true" align=middle width=9.39498779999999pt height=14.15524440000002pt/>
- clients <img src="/docs/LOB-3D/tex/2329b94074e4d98e1f473d67e62e3b3a.svg?invert_in_darkmode&sanitize=true" align=middle width=16.864645049999993pt height=14.15524440000002pt/>
- time <img src="/docs/LOB-3D/tex/51b427102a0e971f574492d132713240.svg?invert_in_darkmode&sanitize=true" align=middle width=13.390469399999988pt height=20.221802699999984pt/>
- set of seats <img src="/docs/LOB-3D/tex/a16252e197c08dc591d913782b3ca167.svg?invert_in_darkmode&sanitize=true" align=middle width=18.67585334999999pt height=22.465723500000017pt/>
- history of sizes <img src="/docs/LOB-3D/tex/cbf998e0c262d6048b7cfe9c424290e7.svg?invert_in_darkmode&sanitize=true" align=middle width=19.32655229999999pt height=22.465723500000017pt/>

LOB-3D decides the active seats.

`OrderRaw` remains unchanged in the memory until it is dumped and stored in the database.
