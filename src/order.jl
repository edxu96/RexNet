module Order

```
Once defined, `OrderRaw` cannot be changed.

the link to `sizes` is established in LOB-3D.
If the seat is expired or cancelled, the `OrderRaw` remains unchanged.
```
struct Order
  time::real
  client::Int64
  seats::DataFrame
  sizes::DataFrame  # history for changes of sizes

  ```
  Initialize the order
  ```
  function Order(args)
    body

    new(time, client, seats, sizes_init)
  end
end

end
