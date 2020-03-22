---
date: Mar 8, 2020
author: Edward J. Xu
---

Return to [table of contents for Rex-Heating](../README.md).

## 1. Why do we need balancing market?

> it is difficult to conceive a mechanism where enough generators and consumers would have the ability and the inclination to process this information sufficiently fast to enter into trades that would restore the balance between load and generation in a reliable manner. [_kirschen2018fundamentals_]

Because the power industries are obliged to supply enough electricity for consumers.

```
Essentially, the mechanism of the balancing market is continuous double auction:

- limit orders come from capacity market and forward markets.
- market orders come from the requirements from participants.

Participants cannot modify their limit orders after the gate closure.

There are complex conditions associated with limit orders.
```

## 2. Why not intra-day market and continuous double auction?

The data in the fifth column in table 1 shows that the trading volumes of intra-day market is very low.

![](../../images/8-1.png)

_Table 1. Intraday markets in the countries considered. [_weber2010adequate_]_

> Another kind of problem occurs in Denmark and the other Scandinavian countries, where the liquidity of the intraday market is also low. This is at least partly related to the fact, that producers can submit bids in unlimited quantities for the so-called balancing power market. Those bids do not receive a capacity price, yet they are included in the short-term merit order list of the grid operators and activated if economically attractive. However this system is not as problematic as it may seem: given the high share of hydro, flexible power capacity usually is not scarce in the Nordic power system. Consequently differences between day- ahead (or intraday) power prices and the balancing power prices are low. This implies that wind operators (provided they see a uniform balancing price) do not incur large losses, if their deviations are settled using balancing energy instead of intraday trade. More problematic is here that all Scandinavian countries except Norway use two-price models when it comes to charging the balancing energy. [_weber2010adequate_]

## 3. Unit Commitment

> These constraints and this startup cost would make it rather risky for large thermal generators to participate in such an hour-by-hour market. Most centralized markets therefore operate on a day-ahead basis, which means that the market does not clear for each trading period separately but instead simultaneously for all of the trading periods of the next day while respecting the constraints on the operation of the generating units. [_kirschen2018fundamentals_]

It's too complicated. Startup cost is ignored for now.

`The biggest challenge`

> However, this reduction in risk requires the implementation of more complex market rules. Such rules reduce the transparency of the price setting process and increase opportunities for price manipulations. [_kirschen2018fundamentals_]

## 4. Why not incumbent electricity market families? And why not demand response?

The flexibility from demand response programs is not enough.

> Most small and medium electricity consumers have very little incentive to take an active part in an electricity market. Even when they are aggregated, the retailer that represents them has only a limited ability to adjust consumption in responses to changes in prices. The transaction costs are therefore reduced significantly if demand is deemed to be passive and is represented by a load forecast as is the case in many centralized markets. [_kirschen2018fundamentals_]

## 5. What is the solution in developing countries?

## 6. Do we need the concept `stochastic service networks` ?

For service industries like supermarket chain, banking, energy industry, supply chain, etc, there are two ways, queueing or standby, to match the supply and demand when they are imbalanced. By queueing, service providers let customers wait to be served. For example, there are queues in front of bank counters all the time, because by doing so, service providers can avoid standby servers, which are the consequences of the second method. Idle servers are necessary in some industries. For instance, there are doctors ready all the time in emergency rooms, because the on-time treatment is critical for emergency patients. In some service sectors, these two ways have been utilized together to meet the different needs of customers and lower the overall cost. For example, if the condition is not emergent, patients have to make appointments to see a doctor. For the airline industry, there are leisure customers who book the tickets to save money and business customers catching the last seats because they have tight schedules. Nevertheless, there are some special systems cannot be balanced simply by these methods.

In this project, a concept called __stochastic service system__ has been proposed to describe a special kind of service systems with stochasticity from both supply and demand side. The stochasticity refers to the uncertainty about their future state. When there is no spot market, buyers and sellers have to make decision considering their future corresponding states. Distributed energy networks and markets, food supply chains, the banking, Internet streaming services, etc are prototypical examples. Note that "system" is used to include the all the markets and delivery networks in this industry. Market is the institution where services are traded, and services are delivered through networks, like power grids transmitting electricity and on-site barber shops.

Different stochastic service systems have different features. 

---

[_weber2010adequate_]: https://github.com/edxu96/symposium/tree/master/src
[_kirschen2018fundamentals_]: https://github.com/edxu96/symposium/tree/master/src
