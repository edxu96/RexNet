module Order
export OrderLimitSet

function init_oms()
  return DataFrame(
    time = real[],
    client = Int64[],
    size = Int64[],
    if_ask = boolen[],
    )
end


```
  OrderLimitSet(time::real, client::Int64)

Onced defined, time, client and seats are immutable.
```
struct OrderLimitSet
  time::real
  client::Int64
  seats::DataFrame

  function OrderLimitSet(time::real, client::Int64)
    seats = DataFrame(
      target = Int64[],
      price = Int64[],
      sizes = MutableLinkedList{Int64}[]  # history of size changes
      )
    new(time, client, seats)
  end
end

```
    quote_size(seats::DataFrame, target::Int64, price::Int64)

Given seat position, quote the size of the limit order.
```
function quote_size(seats::DataFrame, target::Int64, price::Int64)
  df = filter(row -> (row[:target] == target) & (row[:price] == price), seats)

  if nrow(df) == 0
    println("There is no seat for target $(target) at price $(price).")
  elseif nrow(df) > 1
    println("There is duplicate seats for target $(target) at price $(price).
      Error!")
  else
    mll = df.sizes[1]
    size = sum(collect(mll))
  end

  return size
end

end
