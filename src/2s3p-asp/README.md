---
id: 2s2p-asp
author: Edward J. Xu
date: Jan 6th, 2020
---

# Prototype: "2-State-2-Price" Rex with Anticipated Switch Probability

This experiment simulate the one-sided reservation market for the presence of prosumers at home. The cost to meet requirements of prosumers is higher when they present. For example, during winter, the temperature of the rooms has to be maintained above a set point, and the negative effect of low  temperature on present prosumers is significant. So prosumers will reserve their state as "presence" if they anticipate that they will be at home that time.

The rest part of this section is organized as follows. The settings regarding reservation exchange, especially the formation of furthest forward prices, will be discussed in subsection 1. The ways in which prosumers perceive their future states, reserve accordingly, and realize their states will be discussed in subsection 2.

## 1, Settings in Reservation Exchange

For the evolution of forward prices in the reservation market, we make the following assumptions:

- The prices are given randomly according to a time-invariant model.
- There are only two values for all the forward prices.
- The formation of furthest forward prices are simulated using a time invariant Markov chain.
- If the furthest forward price switches the value, the effect will transmit backward to other forward prices.

### Formation of Furthest Forward Price

There are <img src="/src/2s3p-asp/tex/d6328eaebbcd5c358f426dbea4bdbf70.svg?invert_in_darkmode&sanitize=true" align=middle width=15.13700594999999pt height=22.465723500000017pt/> forward units. The formation of the furthest forward price (<img src="/src/2s3p-asp/tex/c15fbe7edf1d4f9ece8bae32aa284851.svg?invert_in_darkmode&sanitize=true" align=middle width=42.71177459999999pt height=14.15524440000002pt/> for current unit <img src="/src/2s3p-asp/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/>) is described by a discrete-time Markov chain with the following one-step stationary transition probability matrix:

<p align="center"><img src="/src/2s3p-asp/tex/93883d8b16ca12f4a6e8fe82235dc576.svg?invert_in_darkmode&sanitize=true" align=middle width=160.27397595pt height=39.452455349999994pt/></p>

where the state space and label are <img src="/src/2s3p-asp/tex/8fe9f12908f7ab39ae1d1546d0cdb740.svg?invert_in_darkmode&sanitize=true" align=middle width=48.401929949999996pt height=24.65753399999998pt/> and <img src="/src/2s3p-asp/tex/8c4fcb0c32829d499c9994a0ac948752.svg?invert_in_darkmode&sanitize=true" align=middle width=40.18272059999999pt height=24.65753399999998pt/> respectively. It means <img src="/src/2s3p-asp/tex/09b3123846c9ba5fc5593b8a18cdda6e.svg?invert_in_darkmode&sanitize=true" align=middle width=265.28610734999995pt height=24.65753399999998pt/>.

### Update of the other Forward Prices

The other forward prices of the same current unit are updated using a discrete-time Markov chain with <img src="/src/2s3p-asp/tex/12c399b7ee7dcaa4d2f17ae34e23735f.svg?invert_in_darkmode&sanitize=true" align=middle width=40.73068394999999pt height=22.55708729999998pt/> with the previous value being the ASP at last current unit for this target unit. That is, if we are going to update <img src="/src/2s3p-asp/tex/9ffd44eb33deb633d15534c5aae77689.svg?invert_in_darkmode&sanitize=true" align=middle width=38.833901699999984pt height=14.15524440000002pt/>, <img src="/src/2s3p-asp/tex/e1a71c202d5a4c1f25c62f4ff0a030bc.svg?invert_in_darkmode&sanitize=true" align=middle width=55.660469699999986pt height=14.15524440000002pt/> is the previous value.

## 2, Agent-Based Model and Simulation of Prosumers

When the realized states are discrete, it is hard to distinguish the effect from controllable factors and that from uncontrollable factors. For example, in this experiment, the state of any prosumer is either presence at home or absence from home, so the outcome of the state cannot be the combination of two factors representing controllable and uncontrollable effects respectively. So the anticipated switching probability will be introduced as the way to express the their perception of future states, which will be discussed in subsubsection 2.2. Furthermore, for the population in Rex, we assume:

- All prosumers are price takers.
- The formations of different anticipations of prosumers are uncorrelated, and they are uncorrelated with the formation of furthest forward prices.
- Prosumers don't forecast to form belief about future forward prices, so they don't arbitrage. Their decisions are based solely on their ASP and current forward prices.

### Realization State and Reservation

For any target unit <img src="/src/2s3p-asp/tex/36b5afebdba34564d884d347484ac0c7.svg?invert_in_darkmode&sanitize=true" align=middle width=7.710416999999989pt height=21.68300969999999pt/>, prosumers can reserve in any of its corresponding <img src="/src/2s3p-asp/tex/d6328eaebbcd5c358f426dbea4bdbf70.svg?invert_in_darkmode&sanitize=true" align=middle width=15.13700594999999pt height=22.465723500000017pt/> forward trading units and realize in target unit sequentially. The conditions are different and correlated, so the decisions have mutual impacts. We can treat the same prosumer in different units as different players in a multi-stage extensive-form game with imperfect information. That is, <img src="/src/2s3p-asp/tex/13ad028012a330194a33397c3b15ff72.svg?invert_in_darkmode&sanitize=true" align=middle width=43.44740069999999pt height=22.465723500000017pt/> players are used to describe the reservation and realization behaviors of one prosumer for one target unit. Players are labeled with <img src="/src/2s3p-asp/tex/29632a9bf827ce0200454dd32fc3be82.svg?invert_in_darkmode&sanitize=true" align=middle width=8.219209349999991pt height=21.18721440000001pt/> representing the realization, <img src="/src/2s3p-asp/tex/034d0a6be0424bffe9a6e7ac9236c0f5.svg?invert_in_darkmode&sanitize=true" align=middle width=8.219209349999991pt height=21.18721440000001pt/> being 1-step backward reservation, <img src="/src/2s3p-asp/tex/76c5792347bb90ef71cfbace628572cf.svg?invert_in_darkmode&sanitize=true" align=middle width=8.219209349999991pt height=21.18721440000001pt/> being 2-step backward reservation, etc., so the finite set of players, <img src="/src/2s3p-asp/tex/f9c4988898e7f532b9f826a75014ed3c.svg?invert_in_darkmode&sanitize=true" align=middle width=14.99998994999999pt height=22.465723500000017pt/>, is <img src="/src/2s3p-asp/tex/925eb1945e0958d4338d50f0ecbdc4d0.svg?invert_in_darkmode&sanitize=true" align=middle width=136.54105244999997pt height=24.65753399999998pt/>. They play sequentially in a reversed order of their labels. That is, player <img src="/src/2s3p-asp/tex/d6328eaebbcd5c358f426dbea4bdbf70.svg?invert_in_darkmode&sanitize=true" align=middle width=15.13700594999999pt height=22.465723500000017pt/> plays first, and player 0 is the last one to play.

The available actions for prosumer <img src="/src/2s3p-asp/tex/6dbb78540bd76da3f1625782d42d6d16.svg?invert_in_darkmode&sanitize=true" align=middle width=9.41027339999999pt height=14.15524440000002pt/> in trading unit <img src="/src/2s3p-asp/tex/5f99377836e557097b92cc08e5fdf2f2.svg?invert_in_darkmode&sanitize=true" align=middle width=32.55171644999999pt height=24.65753399999998pt/>, which means for target unit <img src="/src/2s3p-asp/tex/36b5afebdba34564d884d347484ac0c7.svg?invert_in_darkmode&sanitize=true" align=middle width=7.710416999999989pt height=21.68300969999999pt/> at current unit <img src="/src/2s3p-asp/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/>, are whether to reserve the presence state, so <img src="/src/2s3p-asp/tex/bc903dad3c599a0555a4ee1620afdea7.svg?invert_in_darkmode&sanitize=true" align=middle width=82.00342094999999pt height=24.65753399999998pt/> and the decisions are represented in <img src="/src/2s3p-asp/tex/67aec1ef4d3bc2165183ee77dc4b9262.svg?invert_in_darkmode&sanitize=true" align=middle width=21.596407799999987pt height=21.839370299999988pt/>. The available actions in realization are whether to present, so <img src="/src/2s3p-asp/tex/d9148ca2059b6cc5811b028b2dc37bc2.svg?invert_in_darkmode&sanitize=true" align=middle width=82.70541674999998pt height=24.65753399999998pt/> and the outcomes are stored in <img src="/src/2s3p-asp/tex/12f3343a2ef157421646e0a4774857fd.svg?invert_in_darkmode&sanitize=true" align=middle width=17.16713954999999pt height=21.839370299999988pt/>.

### Sub-Game and Anticipation

The sub-game involving players 0 and 1 can be visualized by the decision tree in figure 1. Because of the existence of stochasticity, the player 0 does not adopt any pure strategies. The decision by player 1 is known to player 0, so the realization is affected by the reservation, so player 0 adopts a behavioral strategy instead of a mixed strategy. For example, in figure 1, <img src="/src/2s3p-asp/tex/c0eb580776140240c3560618c1f2668c.svg?invert_in_darkmode&sanitize=true" align=middle width=197.39241389999998pt height=24.65753399999998pt/>, while <img src="/src/2s3p-asp/tex/3c6cc894f1e5ffb5a169869779af988d.svg?invert_in_darkmode&sanitize=true" align=middle width=197.39241389999998pt height=24.65753399999998pt/>. However, it is assumed that the exact conditional probabilities are not known to player 1, because the anticipation is based on other external factors, and the effect from reservation varies a lot. So the action by player 1 is based on its belief of unaffected behavior of player 0, which is expressed by the __anticipated switching probability (ASP)__ in this case. For prosumer <img src="/src/2s3p-asp/tex/6dbb78540bd76da3f1625782d42d6d16.svg?invert_in_darkmode&sanitize=true" align=middle width=9.41027339999999pt height=14.15524440000002pt/> at current unit <img src="/src/2s3p-asp/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/>, the belief of itself switching the state of last target unit <img src="/src/2s3p-asp/tex/4c9eb550b2a8135c709dfbdc83d3848f.svg?invert_in_darkmode&sanitize=true" align=middle width=48.80625089999999pt height=24.65753399999998pt/> is <img src="/src/2s3p-asp/tex/0b961b3df67af65bdde2e2e03c82bf26.svg?invert_in_darkmode&sanitize=true" align=middle width=22.011184799999988pt height=21.839370299999988pt/>. That is, the anticipated realization of states can be described by a Markov chain with the following time-variant transition probability matrix:

<p align="center"><img src="/src/2s3p-asp/tex/793aa5e1351333308475cdf8fb25d450.svg?invert_in_darkmode&sanitize=true" align=middle width=261.11113545pt height=40.0506051pt/></p>

where the state space and label are <img src="/src/2s3p-asp/tex/842a3ba6459f9c7d0b7724742b431bc1.svg?invert_in_darkmode&sanitize=true" align=middle width=40.18272059999999pt height=24.65753399999998pt/> and <img src="/src/2s3p-asp/tex/8c4fcb0c32829d499c9994a0ac948752.svg?invert_in_darkmode&sanitize=true" align=middle width=40.18272059999999pt height=24.65753399999998pt/> respectively. It means <img src="/src/2s3p-asp/tex/adde4bfaa5c1557ea71060c3faf1295e.svg?invert_in_darkmode&sanitize=true" align=middle width=212.4181785pt height=27.94539330000001pt/>. Note that <img src="/src/2s3p-asp/tex/240948e1ff127fdb47986067819ab12f.svg?invert_in_darkmode&sanitize=true" align=middle width=17.16713954999999pt height=22.831056599999986pt/> is used because <img src="/src/2s3p-asp/tex/8c19e518bebbfb587dc4bf56c51bbeda.svg?invert_in_darkmode&sanitize=true" align=middle width=32.32604264999999pt height=22.831056599999986pt/> is not determined as well if <img src="/src/2s3p-asp/tex/d3986c2d8bce43f9863abbd9f2a0576c.svg?invert_in_darkmode&sanitize=true" align=middle width=63.601675499999985pt height=21.68300969999999pt/>. To get <img src="/src/2s3p-asp/tex/441be0aa04f6061f2ce16df80a12abb3.svg?invert_in_darkmode&sanitize=true" align=middle width=153.3305565pt height=27.94539330000001pt/>, we need the <img src="/src/2s3p-asp/tex/464e84eabcd9dc95ca83395352d69e70.svg?invert_in_darkmode&sanitize=true" align=middle width=46.250268899999995pt height=24.65753399999998pt/>-step transition probability matrix:

<p align="center"><img src="/src/2s3p-asp/tex/58416d3a2be11135681bd2f3bfdd4e65.svg?invert_in_darkmode&sanitize=true" align=middle width=428.99581229999995pt height=80.66664044999999pt/></p>

Then, knowing <img src="/src/2s3p-asp/tex/dc80c8df8d6a3120a158fb62653b1321.svg?invert_in_darkmode&sanitize=true" align=middle width=14.045887349999989pt height=14.15524440000002pt/>, we can calculate the conditional probability of presence in unit <img src="/src/2s3p-asp/tex/36b5afebdba34564d884d347484ac0c7.svg?invert_in_darkmode&sanitize=true" align=middle width=7.710416999999989pt height=21.68300969999999pt/>, <img src="/src/2s3p-asp/tex/911b2210d3238e2e989fd6d1d290b485.svg?invert_in_darkmode&sanitize=true" align=middle width=112.01204519999999pt height=24.65753399999998pt/>.

![](./images/1.png)

_Figure 1, decision tree of sub-game involving players 0 and 1 in extensive-form game._

It is assumed that there is no inter-temporal forecast and arbitrage. The most significant feature of reservation exchange is to allow prosumers to do real-time cost-benefit analysis, so they don't need to forecast. As a result, player <img src="/src/2s3p-asp/tex/63bb9849783d01d91403bc9a5fea12a2.svg?invert_in_darkmode&sanitize=true" align=middle width=9.075367949999992pt height=22.831056599999986pt/> sees preceding players except player 0 as dummy players, and this sub-game can be described by the above model as well.

### Formation of New ASP

For prosumer <img src="/src/2s3p-asp/tex/6dbb78540bd76da3f1625782d42d6d16.svg?invert_in_darkmode&sanitize=true" align=middle width=9.41027339999999pt height=14.15524440000002pt/> at current unit <img src="/src/2s3p-asp/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/>, the formation of new ASP, <img src="/src/2s3p-asp/tex/40383bf1c24df7009f2b7981612f72bb.svg?invert_in_darkmode&sanitize=true" align=middle width=42.50063894999999pt height=21.839370299999988pt/>, is described by a discrete-time Markov chain with the following one-step stationary transition probability matrix:

<p align="center"><img src="/src/2s3p-asp/tex/3b2d23fa459ae80b88d6b37651ca9990.svg?invert_in_darkmode&sanitize=true" align=middle width=158.26483199999998pt height=39.452455349999994pt/></p>

where the state space and label are <img src="/src/2s3p-asp/tex/8fcd1dc7f2c2a571de3ded20b3651a66.svg?invert_in_darkmode&sanitize=true" align=middle width=65.75358734999999pt height=24.65753399999998pt/> and <img src="/src/2s3p-asp/tex/8c4fcb0c32829d499c9994a0ac948752.svg?invert_in_darkmode&sanitize=true" align=middle width=40.18272059999999pt height=24.65753399999998pt/> respectively. It means <img src="/src/2s3p-asp/tex/b7fd540e580131684132bd06d2607819.svg?invert_in_darkmode&sanitize=true" align=middle width=251.96350245pt height=27.94539330000001pt/>. That is, it is hard for ASP to be 0.9, which is a reasonable setting, because prosumers don't switch their states too often.

### Update ASP

The newly generated ASP will have an effect on the ASP for preceding target units. For target unit <img src="/src/2s3p-asp/tex/36b5afebdba34564d884d347484ac0c7.svg?invert_in_darkmode&sanitize=true" align=middle width=7.710416999999989pt height=21.68300969999999pt/>, the anticipations <img src="/src/2s3p-asp/tex/77fb18a460cf4809c40d1bb045be49e3.svg?invert_in_darkmode&sanitize=true" align=middle width=41.71258904999999pt height=21.839370299999988pt/> of prosumer <img src="/src/2s3p-asp/tex/6dbb78540bd76da3f1625782d42d6d16.svg?invert_in_darkmode&sanitize=true" align=middle width=9.41027339999999pt height=14.15524440000002pt/> are updated using the following equation:

<p align="center"><img src="/src/2s3p-asp/tex/787d403e9509f508cce6854ae898e99b.svg?invert_in_darkmode&sanitize=true" align=middle width=465.24003405pt height=19.09118145pt/></p>

which means the new anticipation has backward effect on the anticipations. Because if there is a behavior change in the future, the anticipation about the units around that unit is less determined.

On the other hand, the realization of state switching will lower ASPs for following target units, because prosumers usually do not switch the state too frequently. So if the state is switched, the following equations is used to update the ASPs:

<p align="center"><img src="/src/2s3p-asp/tex/85194806e54dd55c8da901124fd6400e.svg?invert_in_darkmode&sanitize=true" align=middle width=278.18877734999995pt height=19.09118145pt/></p>

where <img src="/src/2s3p-asp/tex/16b26241d5e3ad9c3750d39c4b28a52f.svg?invert_in_darkmode&sanitize=true" align=middle width=47.911264499999994pt height=21.839370299999988pt/> is the default ASP value of prosumer <img src="/src/2s3p-asp/tex/6dbb78540bd76da3f1625782d42d6d16.svg?invert_in_darkmode&sanitize=true" align=middle width=9.41027339999999pt height=14.15524440000002pt/>.

### Reservation Strategy

The best response functions of player <img src="/src/2s3p-asp/tex/d6328eaebbcd5c358f426dbea4bdbf70.svg?invert_in_darkmode&sanitize=true" align=middle width=15.13700594999999pt height=22.465723500000017pt/> to <img src="/src/2s3p-asp/tex/034d0a6be0424bffe9a6e7ac9236c0f5.svg?invert_in_darkmode&sanitize=true" align=middle width=8.219209349999991pt height=21.18721440000001pt/> given their ASPs are their reservation strategy, which is assumed to be homogeneous among players and prosumers for now. The 8 pure strategies are summarized in table 1.

| Pre-Re | Reserve | Real | Utility            | Total U         |
| ------ | ------- | ---- | ------------------ | --------------- |
| 1      | 0       | 1    | (sink, 0)          | sink            |
| 1      | 0       | 0    | (sink, 0)          | sink            |
| 1      | -1      | 1    | (sink + p, - loss) | sink + p - loss |
| 1      | -1      | 0    | (sink + p, 0)      | sink + p        |
| 0      | 1       | 1    | (sink - p, 0)      | sink - p        |
| 0      | 1       | 0    | (sink - p, 0)      | sink - p        |
| 0      | 0       | 1    | (sink, - loss)     | sink - loss     |
| 0      | 0       | 0    | (sink, 0)          | sink            |

_Table 1, illustration of actions and payoffs._

At current unit <img src="/src/2s3p-asp/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/>, prosumer <img src="/src/2s3p-asp/tex/6dbb78540bd76da3f1625782d42d6d16.svg?invert_in_darkmode&sanitize=true" align=middle width=9.41027339999999pt height=14.15524440000002pt/> will make decisions about whether to reserve for target unit <img src="/src/2s3p-asp/tex/36b5afebdba34564d884d347484ac0c7.svg?invert_in_darkmode&sanitize=true" align=middle width=7.710416999999989pt height=21.68300969999999pt/>. If the previous reservation state is 0 and <img src="/src/2s3p-asp/tex/55735a00c0914dd7c7e5d10863e5236e.svg?invert_in_darkmode&sanitize=true" align=middle width=218.65220354999997pt height=27.94539330000001pt/> is smaller than <img src="/src/2s3p-asp/tex/b6293406f4a2fb4220c70b6f928b015c.svg?invert_in_darkmode&sanitize=true" align=middle width=96.91793099999998pt height=27.94539330000001pt/>, the prosumer will reserve, that is <img src="/src/2s3p-asp/tex/a19696e30f74cbd0bf77eb6df66c927d.svg?invert_in_darkmode&sanitize=true" align=middle width=52.55512019999998pt height=21.839370299999988pt/>, or <img src="/src/2s3p-asp/tex/e45411ed42d0a215b808a1196aba3b1d.svg?invert_in_darkmode&sanitize=true" align=middle width=52.55512019999998pt height=21.839370299999988pt/>. If the previous reservation state is 1 and <img src="/src/2s3p-asp/tex/5a6e9821815ef0257fc426b24746447d.svg?invert_in_darkmode&sanitize=true" align=middle width=261.78758759999994pt height=27.94539330000001pt/> is smaller than <img src="/src/2s3p-asp/tex/5be00efbaf8249d69a2e70708e677636.svg?invert_in_darkmode&sanitize=true" align=middle width=37.89212624999999pt height=21.839370299999988pt/>, the prosumer will keep the reserve, that is <img src="/src/2s3p-asp/tex/a19696e30f74cbd0bf77eb6df66c927d.svg?invert_in_darkmode&sanitize=true" align=middle width=52.55512019999998pt height=21.839370299999988pt/>, or <img src="/src/2s3p-asp/tex/e45411ed42d0a215b808a1196aba3b1d.svg?invert_in_darkmode&sanitize=true" align=middle width=52.55512019999998pt height=21.839370299999988pt/>. All in all, the best response function for player <img src="/src/2s3p-asp/tex/d5c37fedc957694c02f048227889191c.svg?invert_in_darkmode&sanitize=true" align=middle width=46.250268899999995pt height=24.65753399999998pt/> is if <img src="/src/2s3p-asp/tex/b75f84bb2ded481253f8e5849c3b73bf.svg?invert_in_darkmode&sanitize=true" align=middle width=202.9824258pt height=27.94539330000001pt/> is smaller than 0, the prosumer will reserve, that is <img src="/src/2s3p-asp/tex/a19696e30f74cbd0bf77eb6df66c927d.svg?invert_in_darkmode&sanitize=true" align=middle width=52.55512019999998pt height=21.839370299999988pt/>.

### Simulated Realization

The reservation has an effect on the realization process, and the effect differs in different prosumers and units. That is, during simulation, the probability to be present is not necessarily the same as the latest anticipation, because there are new factors after the latest trading unit.

For prosumer <img src="/src/2s3p-asp/tex/6dbb78540bd76da3f1625782d42d6d16.svg?invert_in_darkmode&sanitize=true" align=middle width=9.41027339999999pt height=14.15524440000002pt/>, <img src="/src/2s3p-asp/tex/fd7bbc09ff830c3c181dbb3ba6722f09.svg?invert_in_darkmode&sanitize=true" align=middle width=45.85440419999999pt height=31.780732499999996pt/> will be slightly different from <img src="/src/2s3p-asp/tex/2dd8bde8db627fdefea18f153658f814.svg?invert_in_darkmode&sanitize=true" align=middle width=92.96648789999999pt height=31.27848239999999pt/> because of the unexpected factors after gate closure and reservation.

<p align="center"><img src="/src/2s3p-asp/tex/c77f8cb08f939bcba544afe01a0a9714.svg?invert_in_darkmode&sanitize=true" align=middle width=200.3803791pt height=126.31916054999999pt/></p>

Then we can get the time-variant one-step transition probability of Markov chain for describing the realization of state:

<p align="center"><img src="/src/2s3p-asp/tex/234a26598a518589ea8032ec3e7d26e1.svg?invert_in_darkmode&sanitize=true" align=middle width=214.49574465pt height=40.0506051pt/></p>

where the state space and label are <img src="/src/2s3p-asp/tex/842a3ba6459f9c7d0b7724742b431bc1.svg?invert_in_darkmode&sanitize=true" align=middle width=40.18272059999999pt height=24.65753399999998pt/> and <img src="/src/2s3p-asp/tex/8c4fcb0c32829d499c9994a0ac948752.svg?invert_in_darkmode&sanitize=true" align=middle width=40.18272059999999pt height=24.65753399999998pt/> respectively. The previous realization <img src="/src/2s3p-asp/tex/12f3343a2ef157421646e0a4774857fd.svg?invert_in_darkmode&sanitize=true" align=middle width=17.16713954999999pt height=21.839370299999988pt/> is known.

### Preference and Utility

Prosumers are expected to regulate their transition state. For those units, if the price is low, prosumers should reserve relatively more to make sure they don't bear the losses, while they should take chances to save money when the price is high. The other important feature is to motivate them to report their state.

The expected total utility for target unit <img src="/src/2s3p-asp/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/> of prosumer <img src="/src/2s3p-asp/tex/55a049b8f161ae7cfeb0197d75aff967.svg?invert_in_darkmode&sanitize=true" align=middle width=9.86687624999999pt height=14.15524440000002pt/> at current unit <img src="/src/2s3p-asp/tex/63bb9849783d01d91403bc9a5fea12a2.svg?invert_in_darkmode&sanitize=true" align=middle width=9.075367949999992pt height=22.831056599999986pt/> can be expressed by:

<p align="center"><img src="/src/2s3p-asp/tex/5ab2d1a22f739a4540b7f3611b10be27.svg?invert_in_darkmode&sanitize=true" align=middle width=401.7209097pt height=50.420266049999995pt/></p>

where <img src="/src/2s3p-asp/tex/36b5afebdba34564d884d347484ac0c7.svg?invert_in_darkmode&sanitize=true" align=middle width=7.710416999999989pt height=21.68300969999999pt/> indicates the sequence number of the target unit, and <img src="/src/2s3p-asp/tex/fe5debd28834755081ec8355d04c1587.svg?invert_in_darkmode&sanitize=true" align=middle width=44.28388139999999pt height=24.65753399999998pt/> is the expected bothering function. Notice the forecast of future realization <img src="/src/2s3p-asp/tex/745e39919ee67b6a74cf3867786d9141.svg?invert_in_darkmode&sanitize=true" align=middle width=45.61944584999999pt height=33.333385800000016pt/> and <img src="/src/2s3p-asp/tex/4cbc2904f0317606b2408f3d05ac8c5b.svg?invert_in_darkmode&sanitize=true" align=middle width=62.44598579999999pt height=33.333385800000016pt/> may be different from actual realization <img src="/src/2s3p-asp/tex/bdc5a04ce35438ed78995c12d5088983.svg?invert_in_darkmode&sanitize=true" align=middle width=37.06445654999999pt height=24.65753399999998pt/>. Besides, <img src="/src/2s3p-asp/tex/745e39919ee67b6a74cf3867786d9141.svg?invert_in_darkmode&sanitize=true" align=middle width=45.61944584999999pt height=33.333385800000016pt/> may be different from <img src="/src/2s3p-asp/tex/4cbc2904f0317606b2408f3d05ac8c5b.svg?invert_in_darkmode&sanitize=true" align=middle width=62.44598579999999pt height=33.333385800000016pt/> because of the presence of new constraint <img src="/src/2s3p-asp/tex/06d1471a866d5d6f6b958e3551b3053f.svg?invert_in_darkmode&sanitize=true" align=middle width=48.04250714999999pt height=22.465723500000017pt/>.

## 3, Result

![](./images/3.png)

![](./images/4.png)

![](./images/5.png)
