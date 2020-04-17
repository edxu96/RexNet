
# PhD Proposal: Reservation-Based Exchange Market to Match Stochastic Supply and Demand

- keep the main text short
- relate the project to what they have done
- reference letter
- can share a detailed discussion with you if interested

## What is RexNet and Why

Small-scale producers/consumers (__prosumer__) prefer selling/purchasing on a tariff to fluctuating prices in the wholesale market, so their participation is mediated by retailers, who take risks and earn profits when the wholesale price is low. This strategy is widely applied in industries with durable goods, like canned food, while is impractical for fresh foods and electricity because of their continuous generation/consumption, reliance on __delivery networks__, and perishability. These features further prevent the application of unorganized markets and most of organized markets. Disposal of food inventory and backup electricity generations increase the average cost.

For the power industry, with more penetration of intermittent renewable generations and promotion of power systems in rural area, to shift the demand from peak periods is necessary, because it is cheaper for flexible consumers to mitigate mismatches caused by renewables. In addition, centralized command-and-control is inefficient in such settings because of the conflict between better market clearings and the information protection. __Small-scale-friendly two-sided markets__ are the only solution.

In this project, at least one market satisfying previous requirements is designed. Some settings have been introduced to convert electricity into tradable assets and differentiate them temporally and spatially. [_varian2014intermediate_] For now, there is one candidate, whose mechanism is __continuous double auction__ with __3-dimensional limit order books__, where prosumers can bid/offer continuously and get transacted once matched with another order. It allows immediate transactions and standby orders at the same time. More specific settings vary according to different features in different industries. Because of the constraints in delivery networks, the transactions are not allowed to happen in the spot market, so it is a __forward market__ in essence. The behavior of trading can also be called reservation, therefore the market is named __reservation exchange (Rex)__. For power industries, Rex can be used to replace the market families for power systems including the day-ahead market, the intra-day market, the balancing market, the capacity market and other ancillary markets, so prosumers can focus on just one market.

For example, to liberalize the electricity generation market, the periodic double auction has been used in day-ahead market to find the equilibrium, and other facilitating markets are needed. However, small-scale prosumers, which refer to the participants who can be either supply or consume in low power rate, cannot participate directly due to three requirements. First of all, it is hard to anticipate and express the demand and supply curves for future units. Even if they manage to provide, the periodic clearings require them to present in the market at the same time. Also, transactions are not instantaneous. Additionally, the complexity from the existence of market families is another challenge for home-own generation business. The flexibility in demand side can be the solution to many problems. Many kinds of demand response programs have been designed to invite small-scale prosumers to participate, but the resulted flexibility is not enough.

The main difference of Rex is the lack of responsible party for satisfying uninformed demand. For example, utility companies are not obliged to satisfy demand in peak hours. If someone does not have the reservation to consume or supply, he/she has to be responsible himself/herself.

## How to Justify RexNet

To illustrate the market operations and explore the effect of randomness on the market performance, agent-based models are used to represent heterogeneous prosumers, and their interactions through Rex are demonstrated by discrete event simulations. The continuous operation of the market will be demonstrated by discrete event simulation, with prosumers represented by different agent-based models. Each model corresponds to one kind of event routines, which are series of actions executed when the event is triggered. There is another event routine representing the simultaneous realizations of all pro- sumers and the opening auction for the new unit. All these event updates the states describing the market. Heterogeneous agents make decisions according to local information and the market condition. It is hard to obtain analytical solutions directly.

The simulation of RexNet for energy systems can be illustrated by the following two figures. Figure `a` models the supply chain of energy from its extraction to end-use. The key stage is the distribution of energy from the supply side to the demand side. Alternatively, the chain can be model using figure `b`, with both suppliers and consumers being prosumers. Prosumers can be modeled as three parts, __continuous provision plants (CPP)__, clients and coordinators. CPP is the underlying physical and economical system to satisfy the requests of clients. Coordinators control their CPPs and trade in Rex.

![](../../images/1-3.png)

Prosumers are simulated and endowed with supply or demand if they are uncontrollable. Because they don't know the precise quantity in advance, they will forecast based on the current information, the process of which will be simulated as well. The forcasting process depends on lots of external factors, which are hard to simulate. Specifically, there are at least five novel programs in this project:

* different RNGs, wind power output
* auxiliary activities, forecast
* continuous provision plant
* decision making process, make-take management
* coordination with clients

Related literature is dispersed in a wide range of research areas. For example, dynamic procurement of perishable products has been seen as a typical newsvendor problem in supply chain management. [_wang2012multiordering_] However, trading periods are isolated with each other. The wellfare of participants is never considered in discrete event simulation and market micro-structure.

However, different disciplines do provided powerful tools. For example, cost allocation

## Why I am Qualified

there may be other designs satisfying the requirements. the main focus will be CDA and electricity market. Besides the promising potential application in distributed energy systems, this market can be applied in many other industries as well, like food supply chains, the retailing management, and the banking.

---

[_wang2012multiordering_]: https://github.com/edxu96/symposium/tree/master/src
[_varian2014intermediate_]: https://github.com/edxu96/symposium/tree/master/src
