
## Introduction

### What

Some features prevent the application of unorganized markets and most of organized markets. For example, food and electricity is consumed and produced in a continuous rather than a batch-based manner and is perishable and hard to be stored. Disposal of inventory in food industry increase the average cost.

Small-scale participants prefer purchasing on a tariff when their frequent decisions facing fluctuating prices do not earn enough profit. That way, they are isolated from price fluctuations in the wholesale market by retailers, who take risks and earn profits when the wholesale price is low. This strategy is widely applied when traded assets are durable, like canned food. However, to allow demand adapting to the supply of perishable assets is necessary to shift the demand to times with excess supply, which prevents waste and extra capacities. Because it is cheaper for consumers to provide flexible than flexible generations. In addition, centralized command-and-control is inefficient in such settings because of the conflict between better market clearings and the information protection. Small-scale-friendly two-sided markets are the solution.

In this project, a market satisfying requirements discussed above is designed. Some settings have been introduced to convert the services to tradable assets, differentiate them temporally and spatially, in order to establish a limit order market. The basic mechanism is __continuous double auction__ with __3-dimensional limit order books__, where prosumers can bid continuously and get transacted once matched with another one bid. It allows immediate transactions and standby orders at the same time. More specific settings vary according to different features in different industries. Because of the constraints in delivery networks, the transactions are not allowed to happen in the spot market, so it is a __forward market__ in essence. The behavior of trading can also be called reservation. Thus the market is named __reservation exchange (Rex)__. For power industries, Rex can be used to replace the market families for power systems including the day-ahead market, the intra-day market, the balancing market, the capacity market and other ancillary markets, so prosumers can focus on just one market.

For example, to liberalize the electricity generation market, the periodic double auction has been used in day-ahead market to find the equilibrium, and other facilitating markets are needed. However, small-scale prosumers, which refer to the participants who can be either supply or consume in low power rate, cannot participate directly due to three requirements. First of all, it is hard to anticipate and express the demand and supply curves for future units. Even if they manage to provide, the periodic clearings require them to present in the market at the same time. Also, transactions are not instantaneous. Additionally, the complexity from the existence of market families is another challenge for home-own generation business. The flexibility in demand side can be the solution to many problems. Many kinds of demand response programs have been designed to invite small-scale prosumers to participate, but the resulted flexibility is not enough.

### How

To illustrate the market operations and explore the effect of randomness on the market performance, agent-based models are used to represent heterogeneous prosumers, and their interactions through Rex are demonstrated by discrete event simulations. Heterogeneous agents make decisions according to local information and the market condition. It is hard to obtain analytical solutions directly.

Prosumers are simulated and endowed with supply or demand if they are uncontrollable. Because they don't know the precise quantity in advance, they will forecast based on the current information, the process of which will be simulated as well. The forcasting process depends on lots of external factors, which are hard to simulate. Specifically, there are at least five novel programs in this project:

* different RNGs, wind power output
* auxiliary activities, forecast
* continuous provision plant
* decision making process, make-take management
* coordination with clients

Related literature is dispersed in a wide range of research areas. For example, dynamic procurement of perishable products has been seen as a typical newsvendor problem in supply chain management. [wang2012multiordering] However, trading periods are isolated with each other. The wellfare of participants is never considered in discrete event simulation and market micro-structure.

However, different disciplines do provided powerful tools. For example, cost allocation

###

there may be other designs satisfying the requirements. the main focus will be CDA and electricity market. Besides the promising potential application in distributed energy systems, this market can be applied in many other industries as well, like food supply chains, the retailing management, and the banking.
