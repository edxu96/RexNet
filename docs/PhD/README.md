---
for: GitHub/edxu96/RexNet/docs/PhD
author: Edward J. Xu
date: April 18, 2020
---

# `PhD Proposal` Intermediated Forward Exchange to Match Stochastic Prosumptions: Reservation-Based Limit Order Market and its Intermediary-Like Participants

## Keywords

reservation-realization-settlement, two-sided market, dynamic equilibrium discovery, agent-based models, stochastic simulation, model predictive control, forward market, discrete event simulation

## 1. What is RexNet

Small-scale producers/consumers (__prosumer__) prefer selling/purchasing on a tariff to fluctuating prices in the wholesale market, so their participation is mediated by retailers, who take risks and profit from premiums. This strategy is widely applied in industries with durable goods, while is impractical for fresh foods and electricity because of their continuous generation/consumption, reliance on __delivery networks__, and perishability. These features further prevent the application of unorganized markets and most of organized markets. Disposal of food inventory and backup electricity generations increase average costs.

For the power industry, with more penetration of intermittent renewable generations and promotion of power systems in rural area, to have responsive prosumers is necessary, because it is cheaper for flexible consumers to mitigate mismatches caused by renewables. In addition, centralized command-and-control is inefficient in such settings because of the conflict between better market clearings and the information protection. __Small-scale-friendly two-sided markets__ are the only solution.

In this project, at least one market satisfying previous requirements is designed. Some settings have been introduced to convert electricity into tradable assets and differentiate them temporally and spatially. [_varian2014intermediate_] For now, there is one candidate, whose mechanism is __continuous double auction__ with __3-dimensional limit order books__, where prosumers can bid/offer continuously and get transacted once matched with another order. It allows immediate transactions and standby orders at the same time. More specific settings vary according to different features in different industries. Because of the constraints in delivery networks, the transactions are not allowed to happen in the spot market, so it is a __forward market__ in essence. There is gate closure at the beginning of any time units. The behavior of trading can be referred to as reservation, therefore the market is named __reservation exchange (Rex)__. With delivery networks having huge impact, the whole system is named __RexNet__. For power industries, RexNet can be used to replace the market families for power systems including the day-ahead market, the intra-day market, the balancing market, the capacity market and other ancillary markets, so prosumers can focus on just one market.

For example, to liberalize the electricity generation market, the periodic double auction has been used in day-ahead market to find the equilibrium, and other facilitating markets are needed. However, small-scale prosumers, which refer to the participants who can be either supply or consume in low power rate, cannot participate directly due to three requirements. First of all, it is hard to anticipate and express the demand and supply curves for future units. Even if they manage to provide, the periodic clearings require them to present in the market at the same time. Also, transactions are not instantaneous. Additionally, the complexity from the existence of market families is another challenge for home-own generation business. The flexibility in demand side can be the solution to many problems. Many kinds of demand response programs have been designed to invite small-scale prosumers to participate, but the resulted flexibility is not enough.

The most important function of Rex is the __quantity discovery__, which is similar the concept of price discovery in limit order markets for financial assets. The fundamental values of financial assets can be discovered as transaction prices because the market incentive participants to reveal their private information. The process creates knowledge by incorporating dispersed information. [_maloney2003complexity_] Likewise, prosumers are encouraged to take advantage of their information about the global condition in RexNet. That way, deviations from power balance can be eliminated in high speed without necessity for centralized monitoring.

The main difference of Rex is the lack of responsible party for satisfying uninformed demand. For example, utility companies are not obliged to satisfy demand in peak hours. If someone does not have the reservation to consume or supply, he/she has to be responsible himself/herself.

## 2. What is RHPO

Take energy systems, including power systems, for example, they can be represented by figure `a`, showing the supply chain from extractions to end-uses. The key stage is the distribution of energy from the supply side to the demand side. Alternatively, the system can be restructured using figure `b` by introducing RexNet. Prosumers can be modeled as three parts. __Clients__ are used to simulate the ultimate need of the prosumer, which can be expressed by stochastic processes. For example, the temperature of the room. __Continuous provision plants (CPPs)__ are underlying physical and economical systems with inputs being energy mainly and output to meet	the	needs	of clients. For example, a electricity-driven heat pump and pipes to supply heat to the room. It is __coordinators__ who control CPPs and participate in Rex whose objectives are to make more profit (or lower costs), satisfy needs and respect constraints at the same time. The direct participation of small-scale prosumers is a critical premise for this structure, so that there is no friction between these three parts because they refer to the same prosumer. The distribution of assets must rely on __delivery networks__.

![](../../images/1-3.png)

In this project we are interested in both the market and prosumers, which therefore have to be modeled as a __multi-agent system__, because prosumers have diverging information and interests. [_shoham2009multiagent_] There is no centralized manager knowing all the variable outcomes and controlling everything, so the market clearing process needs to be optimized in a distributed manner, so prosumers coordinate with each other through RexNet. __Agent-based models__ are used to represent heterogeneous prosumers, and their interactions through RexNet are demonstrated by __discrete event simulations__. [_lebaron2001builder_], [_iori2012agent_]

Clients are endowed with prosumptions, the quantity of which are simulated with similar patterns to historical data. Because they don't know the precise quantity in advance, they will forecast based on the current information, the processes of which are simulated as well. Once their forecasts update, they will convey differences to coordinators, who are obliged to react to it before the gate closure. High-resolution models of CPPs are known to corresponding coordinators only, in order to protect the privacy. Future outputs can be predicted from CPP models and planned inputs. Then, coordinators modify plans, participate in Rex and respond to clients. The decisions can be optimized by the program called __receding horizon plan & order management (RHPO)__, which has similar structures to model predictive control problems. [_rawlings2019model_]. Coordinators can be seen as intermediaries between clients and the market, which resembles the intermediation theory of firms. [_spulber1996market_] Overall, the states of RexNet are changed instantaneously at separate time points when some coordinator submits order according to its RHPO instructions.

Specifically, there are many stochastic simulation programs used in this project. For example:

* To simulate wind power output at new locations according to historical data as needs of some clients to sell electricity. Statistical in frequency domain can be introduced to exhibit the spatial diversity and utilize available information as much as possible. [_woods2013simulation_]
* Martingale model of forecast evolution (MMFE) to simulate requests sent to coordinators because of arrival of new information. [_heath1994modeling_] Cumulative adjustments can managed using methods from inventory management. [_wang2012multiordering_]
* Multi-input multi-output state space stochastic control systems as models of CPPs. [_siroky2011experimental_] Grey-box modelling techniques, which combines statistical methods and physical knowledge, can be used to calibrate the models. [_bacher2011identifying_]

There are some problems need to be solved:

* The effect of reservation on future requests of responsive clients. Responsive clients will adapt their needs to current states. It may be modeled by an intra-personal game where a decision-maker is summarized by a succession of selves. [_brocas2009dynamic_]
* When optimization problems in RHPO are formulated nonlinearly, it is hard to obtain shadow prices, which helps indicate costs of flexibility and responsiveness.
* Agent-based models should be able to learn and adapt to evolving situations.
* The determination of weight matrices is the challenge faced by MPC researchers as well. [_rawlings2019model_]

## 3. How to Prove RexNet Practical and RHPO Representative

It is hard to obtain analytical solutions directly.

Related literature is dispersed in a wide range of research areas. For example, dynamic procurement of perishable products has been seen as a typical newsvendor problem in supply chain management. [_wang2012multiordering_] However, trading periods are isolated with each other. The wellfare of participants is never considered in discrete event simulation and market micro-structure.

However, different disciplines do provided powerful tools. For example, cost allocation

validate simulation programs based on measured data. For example, simulated forecast evolution should be analyzed according to standard statistical tools for forecasting. [_madsen2005standardizing_]

## 4. How RexNet and RHPO Contribute



## 5. Why I am Qualified

there may be other designs satisfying the requirements. the main focus will be CDA and electricity market. Besides the promising potential application in distributed energy systems, this market can be applied in many other industries as well, like food supply chains, the retailing management, and the banking.

## [Appendix: Brief Mathematical Description](./appendix.md)

---

[_wang2012multiordering_]: https://github.com/edxu96/symposium/tree/master/src
[_varian2014intermediate_]: https://github.com/edxu96/symposium/tree/master/src
[_woods2013simulation_]: https://github.com/edxu96/symposium/tree/master/src
[_madsen2005standardizing_]: https://github.com/edxu96/symposium/tree/master/src
[_bacher2011identifying_]: https://github.com/edxu96/symposium/tree/master/src
[_siroky2011experimental_]: https://github.com/edxu96/symposium/tree/master/src
[_brocas2009dynamic_]: https://github.com/edxu96/symposium/tree/master/src
[_heath1994modeling_]: https://github.com/edxu96/symposium/tree/master/src
[_lebaron2001builder_]: https://github.com/edxu96/symposium/tree/master/src
[_iori2012agent_]: https://github.com/edxu96/symposium/tree/master/src
[_spulber1996market_]: https://github.com/edxu96/symposium/tree/master/src
[_shoham2009multiagent_]: https://github.com/edxu96/symposium/tree/master/src
[_rawlings2019model_]: https://github.com/edxu96/symposium/tree/master/src
[_maloney2003complexity_]: https://github.com/edxu96/symposium/tree/master/src


> It is often useful to think of the “same” good available in different locations or circumstances as a different good, since the consumer may value the good differently in those situations. [_varian2014intermediate_] _Chapter 3_.
