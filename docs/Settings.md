

# 1, Intro to Stochastic Service Network

The stochastic service network (`SSN`) represents a special kind of engineered markets and networks, who are composed of three parts, the stochastic supply, the service delivery system (`SDS`) and the stochastic demand.

Distributed renewable energy system is the most typical one, because the stochasticity comes from both supply and demand sides and the delivery of energy relies on power grids and district heating networks.

## 2, Market Settings

The mechanism divides the time line into a series of `time units`. The time unit in which the reference point lays in is called `current unit`. The successive time units are called `forward units`, while the time unit before is called `backward units`. The first forward unit is the one adjacent and forward to the current unit, the second one is adjacent and forward to the first forward unit, and so on. The same naming method goes for backward time unit.

The service is time-dependent on a time unit, which is called `delivery unit` or `target unit`. There is a `trading window` for participants to trade for the target unit, which opens at beginning of the first trading unit, and closes at the beginning of the target unit. It means trade can only happen in its adjacent backward units, which we call `trading units` for that unit. The number of the trading units is called `span`, which is fixed. It is illustrated in the following figure.

![](../images/Rex_9.png)

There is no exact length of time units, as long as it is fixed during one operation cycle. Although narrower unit allows more smooth change and with higher refresh frequency, it requires more computation power and may prevent human beings from participating directly. It's easier for people to decide how much to consume within 5 minutes than to do in 5 seconds.

It can be seen that if there is some bottle-neck constraints inside the nodal, the nodal can be divided into two components by the bottle-neck. In section 2 to 4, only the market with one node will be analyzed.

To make the process more explicit, we make an assumption that the calculation can be done in infinitesimal time. It also makes a lot of sense because it does not require too much computation power.

## 3, References

1. Kirschen, D.S. and Strbac, G., 2018. Fundamentals of power system economics. John Wiley & Sons.
