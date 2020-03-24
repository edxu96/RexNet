
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

- shrink $h_{x, t}$
- expire, by the market $h_{x, t}$
- cancel
- dump $x$

an order is a set of seats in LOB-3D



$$
Z_{u, t} = \{x_{1}, x_{2}, ..., x_{i} \}
$$

$x = (u_x, t_x, Z_x, \Omega_x)$

composition of an order $x$
- clients $u_x$
- time $t_x$
- set of seats $Z_x$
- history of sizes $\Omega_x$

LOB-3D decides the active seats.

`OrderRaw` remains unchanged in the memory until it is dumped and stored in the database.
