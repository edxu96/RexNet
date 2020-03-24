module Broker


function shrink!(odr::Order, target::Int64, price::Int64, delta::Int64)
  body
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
