---
description: Introduction to agent-based modeling from the perspective of prosumers.
---

## 1, Introduction

Agent-based model (ABM) will be used to simulate the trading behaviors of different prosumers.

> An agent-based model (ABM) is a class of computational models for simulating the actions and interactions of autonomous agents (both individual or collective entities such as organizations or groups) with a view to assessing their effects on the system as a whole. It combines elements of game theory, complex systems, emergence, computational sociology, multi-agent systems, and evolutionary programming. Monte Carlo methods are used to introduce randomness.

We can just think this is kind of game for the prosumers to participate. The behaviors of prosumers can be treated as functions.

The simulation of participant as a computer-human bundle.


It is widely assumed that the short-run price elasticity of demand is very small, so the matching supply and demand requires production facilities capable of following the large and rapid changes in consumption that take place over the course of a day. [2] However, The short-run price elasticity of demand can be explored with suitable market mechanism.

The sequential decision process of prosumer for a single forward time unit can be seen as a Markov decision process. There are four sources of information for them to make decision, current forward prices, price forecasts, previous reservation and their future utilities.

The counterpart to the population is reservation exchanger, whose decision processes will be discussed in [RexNet-Docs/Min-Variance-Control](https://edxu96.gitbook.io/rexnet-docs/model/reservex/3-control).

There are two ways to think about the trading decisions from the perspective of prosumers. One is to consider all the trading time units for a single target time units, and one is to consider all the available target time units at current time unit.

![Figure 1, ways to think about the trading decisions from the perspective of prosumers. One is to consider all the trading time units for a single target time units, and one is to consider all the available target time units at current time unit.](../images/Rex_8.png)

The prosumer has two aspects of behaviour, reservation and realization. While the combination of reservation exchanger and flow controller has pricing and control.

## 2, Models of Prosumers

The model of any prosumer is composed of three parts and two policies.

### Characters and Parameters

Set the distribution and correlation of different characters for the population then generate the set of parameters for individuals randomly.

### Profiles

Profiles for every time unit.


## 3, Inter-Temporal Substitution

The forward prices provide information about future market conditions for small-scale prosumers to make a quick decision and trade, so they don't have to face the uncertainty of prices in the future. Prosumers aiming for profit maximization are encouraged to forecast the fluctuations of forward prices for target units, and optimize the operation of facilities, like energy storages, conversions, or sector couplings.

## 4, Application in Energy Industries

> Strategies to mitigate global climate change should be grounded in a rigorous understanding of energy systems, particularly the factors that drive energy demand. Agent-based modelling (ABM) is a powerful tool for representing the complexities of energy demand, such as social interactions and spatial constraints. Unlike other approaches for modelling energy demand, ABM is not limited to studying perfectly rational agents or to abstracting micro details into system-level equations. Instead, ABM provides the ability to represent behaviors of energy consumers — such as individual households — using a range of theories, and to examine how the interaction of heterogeneous agents at the micro-level produces macro outcomes of importance to the global climate, such as the adoption of low-carbon behaviors and technologies over space and time. [rai2016agent]

## 4, References

1. Wikipedia contributors, "Agent-based model," Wikipedia, The Free Encyclopedia, https://en.wikipedia.org/w/index.php?title=Agent-based_model&oldid=916364454 (accessed October 29, 2019).
2. Kirschen, D.S. and Strbac, G., 2018. Fundamentals of power system economics. John Wiley & Sons.
