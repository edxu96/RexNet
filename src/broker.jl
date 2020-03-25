module Broker


function shrink!(odr::Order, target::Int64, price::Int64, delta::Int64)
  body
end


```
  obs_speads(lob3d::MutableLinkedList{NodeTarget})

Get the lists of bid-ask spreads.
```
function obs_speads(lob3d::MutableLinkedList{NodeTarget})
  speads = DataFrame(
    targets = map(x -> x.target, lob3d),
    prices_bid = map(x -> x.bid, lob3d),
    prices_ask = map(x -> x.ask, lob3d)
    )
  return spreads
end


```
    leave_queue(target::Int64, price::Int64)

Cancel the seat at (`target`, `price`)
```
function leave_queue(target::Int64, price::Int64)
  body
end

```

Request to leave the seat queue.
```
struct QueueLeave
  target::Int64
  price::Int64
end


end  # module Broker
