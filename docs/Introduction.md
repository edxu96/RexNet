---
description: 5 Minutes Illustration of Stochastic Service Networks and RexNet Framework, with a Prototypical Application in District Heating Networks.
---

## 1, Stochastic Service Network - RexNet

Many real-world systems can be treated as `stochastic service networks`, which is composed of two parts:

- `Two-Sided Reservation Markets`: Supply and demand sides all participating in the market, and are treated as prosumers with positive and negative service rates.
- `Service Delivery Networks`: The facilitating devices, goods, and labors evolve over time and are controlled.

`RexNet` is a framework to model and control stochastic service networks, and it has two parts correspond to the two parts of stochastic service networks:

- `Reservation Exchange`: Reservation-based exchange market.
- `CEEFC`: Conduits-Efforts-Events-Flow-Control models.

The relationships between stochastic service networks and RexNet are summarized in table 1 and illustrated in figure 1. Note that the `passive conduits` is the underlining physical pipes without flowing carriers or goods, and the `SpaceMeterNet` is a tool to model it using measurement data.

|            Object            |         Tool         |
|:----------------------------:|:--------------------:|
|  Stochastic Service Network  |        RexNet        |
| Two-Sided Reservation Market | Reservation Exchange |
|   Service Delivery Network   |        CEEFC         |
|       Passive Conduit        |    SpaceMeterNet     |

_Table 1, Summary of relationships between stochastic service network and RexNet._

![Figure 1, illustration of a RexNet model. The rounded	rectangles represent the participants. The circles filled with crosses represent the addition of flows. Solid directed lines represent the physical flows or control signals, while the dashed non-directed lines represent the interactions.](./images/RexNet_1.png)

## 2, Basic Settings

Stochastic service networks are very special because of the following features:

- Service instead of goods.
- Rate matters more than quantity.
- Markets are two-sided, because they are all stochastic.

There are some key settings in reservation exchange which are different from ordinary markets and other organized markets.

- Discretization of time.
- Only forward market, without spot market.
- If you don't reserve, you can generate or consume.

There are five kinds of participants in the stochastic service networks, and their relationships are summarized in figure 2.

![Figure 2, relationships between participants in RexNet. The two-sided service market involves the Reservex exchanger, prosumers, and external efforts, and the service delivery network in involves the Reservex exchanger and the flow controller. Safety maintainer makes sure that the service process delivered safely using discard or ration.](./images/RexNet_7.png)

## 3, Two-Sided Reservation Market - Reservation Exchange

There are two ways to think about the trading decisions from the perspective of prosumers.

![Figure 3, ways to think about the trading decisions from the perspective of prosumers. One is to consider all the trading time units for a single target time units, and one is to consider all the available target time units at current time unit.](./images/Rex_8.png)

There are some features distinguishing the Reservex from other markets:

- Gate cloture at the beginning of the target time unit.
- Constant volume during the whole time unit.
- Realized service rates are constrained by the traded volume.

From the perspective of the Reservex organizer, the objective is to realize the minimum variance control of the process.

![Figure 4, illustration of Reservex as a stochastic feedback control system. There are two groups of decision makers, the population and the Reservex organizer. The population consists of all the prosumers in the Reservex. From the perspective of the Reservex organizer, the decision function can be modeled from historical data. There are stochastic factors in the decision process because of the update of forecasting information.](./images/Rex_12.png)

## 4, Service Delivery Network - CEEFC

The dynamics of flows in conduits caused by efforts and events is very different from that of drones or cars, and the control is distributed to different agents with their preferences. CEEFC can be used to model can control such systems.

- `Conduits`: the physical pipes in the engineered networks
- `Effort`: the input / output power or goods, which is decided by prosumers
- `Event`: the discrete event, which results in the transformation of modes of dynamical systems
- `Flow`: the flow of power or goods
- `Control`: the controlled facilities, like pumps and joints

Most of the service delivery networks in the energy sector are this kind, like power grids and gas networks, which will be summarized briefly in the following subsections.

![Figure 5, illustration of district heating networks. Note that this is a carrier network because the working fluid, circulating water, is not consumed during the delivery process, while the heat carried by the water is delivered.](./images/SDN_1.png)

## 5, Prototypical Example: District Heating for Multi-Dwelling Buildings

![](./images/SDN_5.png)

## 6, Expectations and Challenges

- The main benefit is to save stand-by efforts by allowing direct participation of small-scale prosumers.
- Couple different engineered systems and industries.
- Help mitigate climate change by reducing waste of stand-by efforts.
- Help develop low-cost low-carbon infrastructure in developing countries.
- Other kinds of models for service delivery networks may be introduced in the future.

## 7, Contact Information

- Edward J. Xu (<edxu96@outlook.com>), MSc in Energy System Analysis, DTU Management
- Website: <https://edxu96.gitbook.io/rexnet-docs/>
- Edward's master thesis proposal: Reservation Exchange Based District Heating for Multi-Dwelling Buildings. [RexNet/Docs/Energy/MSc-Proposal](https://edxu96.gitbook.io/rexnet-docs/application/rexnet-energy/3-multi-dwelling)
