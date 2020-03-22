---
description: The concept of quantity is quite different in reservation based service market.
---

## 1, Introduction

> Designing an electricity market therefore involves choosing a time interval that serves as a trading period. Power is then translated into tradable energy by integrating it over each time interval. Looking at this the other way, a certain amount of energy traded over a given time period is thus deemed to be delivered at constant (i.e. average) power over that time interval. Because the physical and market conditions are assumed constant over each trading period, the price of energy is also deemed uniform over each trading period. [_kirschen2018fundamentals_]

- generation quantity and consumption quantity
- trading volume

## 2, Incumbent Electricity Market

> In particular, before a generating company brings a large thermal unit on-line, it will want some certainty that this unit will remain synchronized long enough to recover its startup cost and respect its technical operating constraints. To resolve this dilemma, electricity trading is organized as a sequence of forward markets with progressively shorter trading periods and a spot market. Forward markets handle trading in large amounts of energy over long periods of time. They operate slowly and close far in advance of the beginning of the delivery period (also known as “real time”). Markets for smaller amounts of energy to be delivered over shorter time periods operate faster and can therefore operate much closer to real time. The spot market is the market of last resort and thus operates closest to real time. It typically handles only a small fraction of the overall energy needs. This arrangement not only helps market participants manage their risks but also gives the system operator time to identify conditions that might affect the operational reliability of the system. In the next section, we discuss the various types of forward markets for electrical energy. We then discuss the need for a spot market and how it differs from spot markets for other commodities. Subsequent chapters discuss the markets for ancillary services, generation capacity, and transmission capacity that have been put in place to meet the reliability requirements. [_kirschen2018fundamentals_]

## 3, Balancing of Local Information

Forward Constraint Contract

__Forward Constraint Contract (FCC)__ is a standardized futures contract at a specific price with delivery set at a specified time unit in the future. Participants trade the contract and receive rewards with contract makers. Overall, there are two major attributes every contract, target unit and volume. The realization of power must be greater or equal than the final volume for that target unit.

Usually, participant can sign a long-term contracts for many target units, which can be called initial contracts. Then, participants can update their contracts during the trading window for some target unit. There are forward prices corresponding to each time unit in the trading window.

> In any electricity industry supply and demand must be kept in balance (and within the physical limits of the network resources) at all points in time. In a market-based electricity industry the primary mechanism for balancing supply and demand is the market mechanism and the associated price signals. However, for various reasons, the market mechanism is typically not operated very frequently. Some markets set wholesale prices every hour, some every half-hour, or every 10 min. A few set prices every 5 min. However, 5 min remains a long time in an industry in which supply and demand must be maintained on a scale down to milliseconds. In the periods between the operation of the market mechanism (i.e. during the ‘dispatch interval’) the market mechanism cannot be relied on to achieve a balance of supply and demand. All real electricity markets have some mechanism for handling events (known as
contingencies) that occur during the dispatch interval. These mechanisms include mecha­ nisms for procuring and dispatching of balancing services when they are required. The longer the period between the operation of the market process, the more important are these balancing mechanisms. [_biggar2014economics_]

The prosumers themselves are responsible for their realization by balancing or rewarding the balancing. They are responsible for outages or other major failures. There may be a system operator to do emergency curtailment and ration.

They can balance through either complementing or rejecting.

The quantity represents traded volume, which is the different value between floors.

The service is usually delivered in a continuous manner, and the matching of supply and demand is critical. If the servers are not enough, the customers have to wait in queue to be served once the preceding customers left. If the conditions of customers do not allow waiting (like the emergency patients), idle servers have to standby, wasting resources. The market mechanism alone usually do not permit the matching of supply and demand all the time, because the units used in the markets are too long. For example, in electricity market, the minimum length of units is 5 minutes, which is far too long for power grids, whose balance needs to be maintained within milliseconds. That explains the existence of system operators to maintain the system safety with a holistic view. To eliminate the need for another level of complexity, a special constraint is introduced in reservation exchange to share the duty to balance the system within the trading units among prosumers. The constraint is to set a lower bound for the realized power during the unit. That is, if he realization of prosumption by the prosumer $$n$$ at time $$t$$ is $$x_{n}(t)$$, the constraint during unit $$i$$ can be expressed by:

$$
\begin{align}
    x_{n}(t) \geq e_{n, i} \quad \text{for } t^{\text{begin}}_{i} \leq t < t^{\text{end}}_{i}
\end{align}
$$

If all the prosumers are restrained, the system can be balanced solely by the market. There is no need for global monitoring. If there is surplus at some moment, it is likely to be dumped locally, because the uninformed transmission needs effort and the loss is bared by the prosumer itself for lacking balancing ability, or it can simply raise the traded volume to make a profit out of it. If the constraint is violated and some damages happen because of it, the prosumer has to pay for the loss, because it is its duty to balance the system.

From the perspective of economics, at least for power systems, someone may argue that to disperse the stochasticity abatement is inefficient, while the economy of scale can be replied on to balance the system by few balancing companies with globally minimum marginal cost. Nevertheless, that is on the base of widely connected power grids. The cost to construct such infrastructure is high. Besides, the distributed balancing resources from demand side are expected to be much cheaper than traditional spinning reserves like gas turbines, reservoirs, and batteries.
