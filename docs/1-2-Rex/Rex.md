---
description: Every prosuming is forward contracted with your exchanger! -- Slogan of Reservex
---

## 1, Introduction

Reservation Exchange for Stochastic Service (Reservex) is a centralized reservation mechanism for time-dependent service with stochastic supply and demand, where participants can trade standardized `futures contract` to buy or sell specific quantities of a `retailing asset` at a specific price with delivery set at a specified `time unit` in the future. The market for this kind of trade is special. Usually, the `delivery network` is needed, and supply-demand balance needed to be satisfied all the time. RFM respects all the constraints, and allows small-scale participation in the meantime. The `exchanger` is the centralized agent to organise the market in `primal network`. It is responsible for collecting contracts, setting prices and maintaining the delivery network. Participants have to register with an exchanger, and the exchanger is counterpart to all its registered participants, the group of which forms its `population`. The prices for futures contract, `forward price`, are set by the exchanger and are the same for its population. There may be several exchangers in the market. Exchangers manage the trades among each other, which composes the `secondary network`. Overall, RFM encourages early booking, prediction and flexibility. It can be applied in many areas, among which the most promising two are distributed energy system, Internet streaming and food distribution.

The process in Reservex is like a repeated game with fixed number of intervals between the reservation exchanger and the prosumers. The main perspective of this part belongs to the reservation exchanger. To know more about the behaviors and policies of prosumers, please consult [RexNet-Docs/Agent-Based Modeling](https://edxu96.gitbook.io/rexnet-docs/simulation/abm).

## 2, Classification of the Market

|         -          | Retail | Wholesale |
|:------------------:|:------:|:---------:|
|        Spot        |   x    |     x     |
|    Managed Spot    |        |           |
| Short-Term Futures |  RFM   |           |
| Long-Term Futures  |        |           |
