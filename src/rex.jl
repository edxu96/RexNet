module Rex
export Rex, match_oms!, push_ols!


```
    Rex(lot_size, tick_size, num_forward)

Reservation Exchange.

Three resolution parameters of LOB-3D:
- lot_size: [size of lot] the smallest amount of the asset that can be traded
  within it.
- tick_size: [size of tick] the smallest permissible price interval between
  different orders within it.
- num_forward: [number of forward target units]

LOB-3D is a mutable linked list for fixed number of `LimitOrderBook`.
```
struct Rex
  lot_size::Float64
  tick_size::Float64
  num_forward::Int64
  lob3d::MutableLinkedList{LimitOrderBook}

  function Rex(lot_size::Float64, tick_size::Float64, num_forward::Int64)
    ## Initialize the set of LOB3D with dummy target nodes.
    lob3d = MutableLinkedList{LimitOrderBook}()
    for i = 1: num_forward
      push!(lob3d, LimitOrderBook(target))
    end

    new(lot_size, tick_size, num_forward, lob3d)
  end
end

```
The initial spread is the result of market clearing in the opening auction.
```
mutable struct LimitOrderBook
  target::Int64  # [index of target unit]
  pd::DataFrame  # [depth profile]

  function LimitOrderBook(target::Int64)
    new(target, init_pd())
  end
end

`Initiate a dataframe for bid/ask-side depth profile (pd)`
function init_pd()
  return DataFrame(
    price = Int64[],
    depth = Int64[],
    sq = MutableLinkedList{OrderLimitSet}[]  # [seat queue]
    )
end


```
  push_ols!(lob3d::MutableLinkedList{LimitOrderBook}, ols::OrderLimitSet)

For some seat in some set of limit orders, find the corresponding seat queue
in Rex and push the order into the queue. Taht is, the reference of the order
is add at the end of the seat queue.
```
function push_ols!(lob3d::MutableLinkedList{LimitOrderBook}, ols::OrderLimitSet)
  map(row -> push_ol!(lob3d, row, ols), ols.seats)
end

`To push a seat for a limit order. Used in `push_ols!`. `
function push_ol!(lob3d::MutableLinkedList{LimitOrderBook}, row::DataFrame,
    ols::OrderLimitSet)
  qs = locate_qs(lob3d, row.target[1], row.price[1])
  push!(qs, ols)
end


```
  match_oms!(lob3d::MutableLinkedList{LimitOrderBook}, oms::DataFrame)

Match the submitted market order set.

When receiving some market order, the program locate the seat queue and
use the first element to match the order. If the size of the market order is
larger than that of the element, the second element is used. The process keeps
going on until the market order is matched completely. Note that if all
elements in the first bid/ask `NodePrice` are used, the seat queue in the
second one will be used following the same procedure, but the price will be
based on the new `NodePrice`.

> By far, the most common priority mechanism currently used is price-time. That
> is, for active buy (respectively, sell) orders, priority is given to the
> active orders with the highest (respectively, lowest) price, and ties are
> broken by selecting the active order with the earliest submission time $t_x$.
> Price-time priority is an effective way to encourage traders to place limit
> orders (Parlour 1998). Without a priority mechanism based on time, there is
> no incentive for traders to show their hand by submitting limit orders
> earlier than is absolutely necessary. [_gould2013limit_]
```
function match_om!(lob3d::MutableLinkedList{LimitOrderBook}, om::DataFrame)
  target = om.target[1]
  price = om.price[1]
  size_om = om.size[1]

  qs = locate_qs(lob3d, target, - price)

  lo_first = first(qs)  # first limit order in the queue
  size_lo_first = quote_size(lo_first.seats, target, price)
  # if the market order cannot be matched by this limit order
  while size_om > size_lo_first
    ## The limit order is offset.
    size_om -= size_lo_first
    psuh!(lo_first.seats[1].sizes, -size_lo_first)  # add the log
    popfirst!(qs)  # pop the first limit order in the seat queue

    ## Next limit order is used to match the remaining market order
    whe_continue = isempty(qs)
    if ~whe_continue
      break
    end
    
    global lo_first = first(qs)
    global size_lo_first = quote_size(lo_first.seats, target, price)
  end



end

function match_oms!(lob3d::MutableLinkedList{LimitOrderBook}, oms::DataFrame)
  map(row -> match_om!(lob3d, row), oms)
end


```
  qs = locate_qs(lob3d::MutableLinkedList{LimitOrderBook}, target::Int64,
    price::Int64)

Locate the seat queue according to `target` and `price`.
- `nt`: target node
- `qs`: seat queue
```
function locate_qs(lob3d::MutableLinkedList{LimitOrderBook},
    target::Int64, price::Int64)

  ## Locate the target node according to `target`
  nts = filter(x -> x.target = target, lob3d)
  if length(nts) == 0
    error("There is no such `LimitOrderBook` with target $(target).")
  elseif length(nts) > 1
    error("There are duplicated `LimitOrderBook` with target $(target).")
  else
    nt = nts[1]
  end

  ## Locate the seat queue according to `price`
  qs_raw = filter(x -> x.price = price, nt)
  if nrow(qs_raw) == 0
    error("There is no such seat queue with target $(target)
      and price $(price).")
  elseif nrow(qs_raw) > 1
    error("There are duplicated `LimitOrderBook` with target $(target)
      and price $(price).")
  else
    qs = qs_raw[1]
  end

  return qs
end



function cancel_seat!(l3::L3, odr_cancel::,)

end


function expire!(odr::Order)
  body
end


function dump!(odr::Order)
  body
end


end  # module Rex
