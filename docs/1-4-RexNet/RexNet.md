---
description: Since Reservex and service delivery network have been discussed, RexNet can be discussed as a whole in this chapter.
---

##  1, Introduction

`RexNet` is a framework to simulate and control stochastic service networks, among which the most important one is reservation exchange (`Reservex`). It is a centralized reservation mechanism for time-dependent service with stochastic supply and demand, where participants can trade standardized `futures contract` to provide consume `retailing service` at a specific price with delivery set at a specified `time unit` in the future. It assumes the matching of two sides. Besides, SDS is usually more difficult to model, because it is dynamical. For example, the heat flows in district heating networks must be treated as dynamical systems for large thermal inertia. `RexDynNet` has been developed to model dynamic in SDS with presence of Reservex. Finally, `SpaceMeterNet` is needed to establish the SDS from spatial and temporal data, because sometimes the SDS may not be engineered. For example, the space heatings in different homes in multi-dwelling buildings affect each other.

Objectives:

- Match supply and demand
- Respect constraints
- Lower idle power
- Lower risk from price

## 2, Structure of RexNet

The RexNet-based stochastic service network can be modeled as a hybrid system.

RexNet is composed of two parts, which is summarized.

* Reservex-Based Two-Sided Service Market
	- Market Organizer
	- Prosumer
* Service Delivery Network
	- Network Maintainer
	- External Source

The following figure illustrates the structure of RexNet.

![Illustration of Structure of RexNet Mechanism](../images/RexNet_1.png)

## 3, Participants

The objective is to make sure the realizations are satisfied at minimum cost with the help of reservation.

![Figure 2, relationships between participants in RexNet. The two-sided service market involves the Reservex exchanger, prosumers, and external efforts, and the service delivery network in involves the Reservex exchanger and the flow controller. Safety maintainer makes sure that the service process delivered safely using discard or ration.](../images/RexNet_7.png)
