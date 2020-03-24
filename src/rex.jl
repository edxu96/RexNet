module Rex
export


```
    NodePrice(price)
```
struct NodePrice
  price::Int64
  sq::MutableLinkedList{Order}  # [seat queue]

  function NodePrice(price)
    new(price, MutableLinkedList{Order}())
  end
end


```
For some seat in some set of limit orders, find the corresponding seat queue
in Rex and push the order into the queue. Taht is, the reference of the order
is add at the end of the seat queue.
```
function push_seat!(sq::MutableLinkedList{Order}, odr::Order)
  push!(sq, odr)
end


```
For a given set of limit orders, push the order into the seat queue one by one.
```
function push_odr!(rex::Rex, odr::Order)
  for seat in odr.seats
    node_target = filter(nt -> nt.target = seat.target, rex.book)
  end
end


```
For a given set of orders, match market orders first and push the limit order.
```
function match_order!(rex::Rex, odr::Order)

end


```
    NodeTarget(target, price_bid, price_ask)

The initial spread is the result of market clearing in the opening auction.
```
mutable struct NodeTarget
  target::Int64  # [index of target unit]
  bid::NodePrice
  ask::NodePrice

  function NodeTarget(target, price_bid, price_ask)
    new(target, price_bid, price_ask)
  end
end


```
    Rex(lot_size, tick_size, num_forward)

Reservation Exchange
```
struct Rex
  ## Three resolution parameters of LOB-3D.
  lot_size::Float64  # [size of lot] the smallest amount of the asset that
  # can be traded within it.
  tick_size::Float64  # [size of tick] the smallest permissible price interval
  # between different orders within it.
  num_forward::Int64  # [number of forward target units]

  book::MutableLinkedList{NodeTarget}

  function Rex(lot_size, tick_size, num_forward)
    ## Initialize the set of LOB3D with dummy target nodes.
    book = MutableLinkedList{NodeTarget}()
    for i = 1: num_forward
      push!(book, NodeTarget(target, 0, 0))
    end

    new(lot_size, tick_size, num_forward, book)
  end
end


function match_trade!(lob, order)

end


function cancel_seat!(l3::L3, odr_cancel::,)

end


function expire!(odr::Order)
  body
end


function dump!(odr::Order)
  body
end


end  # module LOB3D
