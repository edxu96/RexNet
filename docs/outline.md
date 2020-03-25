
## 4. Discrete Event Simulation of Multi-Agent Systems (DES-MAS)

- basic settings
	* next-event time-advance approach
	* realization happens simutaneouly at fixed-interval time points
	* discrete states

- Simulation program
	* system states: the market and the population
	* simulation clock
	* event list
	* statistical counters

### 4-1. Introduction

- system states in a distributed way
	* the market state and states of brokers are of concern
	* states are unknown to each other
	* number of agents, types of agents and parameters of agents
	* the market's transparency is set

- market-mediated communication only
- agents' identities are not revealed in the market pool

- number of agents, types of agents and parameters of agents don't evolve for now

- two types of events in the market
	* order events associated with agents or scheduled 
	* realizations and opening auctions

- Models are event routine
	* uncontrollable generations: executions of limit orders
	* controllable generaions: submissions of market orders
	* mixed consumptions: submissions of market orders


### 4-2. Correlation of Heterogeneous Factors

- what is the simulation results
	* how the matching is distributed
	* the surden effect from external factors, the intermittency of renewable resources
	* the impacts of different features of agents on the market and their profits from the market

### 4-3. System Evolution without Market

- passive load to be satisfied
- cost distributed accoding to quantity
- automatic generation control
- benchmark

### 4-4. System Evolution with Market



## 5. ABM of Prosumers

_Discussion about general questions about ABM._

- what is ABM

- why ABM
	* it is hard by analytical methods
	* how the initially mismatched supply and demand are balanced through the market, unaffected consumption and uncontrollable generation
	* no need to replicate empirical findings like market micro-structure literature
	* decision making frameworks
	* there is no centralized coordinator, interaction between agents through the market
  * external factors affect agents

### 4-1. Clients and Brokers

- assumptions about ABM
  * agents interact with each other only through the market.
  * hypothesis of independence
  * two major sources of external factors: intermittency of renewable sources and daily activity cycles
	* no learning ability
	* components

- any prosumer can be represented by a set of agent models
	* have no effect on each other
	* summation

- agents
	* homogeneous structure
	* external inputs
	* non-homogeneous parameters and functions

- correlation in the population

- stochasticity
	* anticipated stochasticity
	* arrival of new information: how the new info will affect realization and the market

### 4-2. Three Kinds of Clients

#### 4-2-1. Simulated Stochastic Uncontrollable Generations



#### 4-2-2. Realization of Mixed Consumption when the Market is Lacking

- reservation-realization and realization without the market
	* decision making process

- external factors affect the market through agents
  * typical life schedule, time and date
  * factors affecting the life schedule

##### Unaffected Realization

- evolution without market
  * the effect of other factors is neutral
  * the overall effect from external factors is 0
  * Markov property
  * subjective probability

##### Simulated Realization


### 4-3. Brokers and Three Kinds of Strategies

#### 4-3-1. Mixed Consumption

##### Dynamic Inconsistency, Sub-Game and Anticipation

- reservation-realization
	* the anticipation is becoming more clear with lead time shrinkingm, thus the deviation will become smaller
	* the realization process is random
	* the conflict is assumed to be resolved with decrease in utility

model the decision making process when the effect of reservation is taken into account as part of the probability.



##### Anticipated Transition Probability Matrix (ATPM)

##### Action Rules

Event Routine 1

##### Parameters Describing the Population

- population
  * elasticity, reaction to prices in the market
  * reservation lead time
  * arrival time and frequency
  * other characteristics are homogeneous
  * reactions to external factors are the same

#### 4-3-2. Uncontrollable Generation


##### Simulation of Forecast

continuous Markov chain with fixed number of states ?

- decreasing as lead time decreasing ?
  * updating frequency
  * adjustment quantity

asymmetric because of capacity

##### Forecast Update and Trading

- scenarios for realization and forecast
	* discrete state
	* capacity
	* forecast correlations

##### Spatial Representation and Correlation


### 4-3-3. "P&O" Model for Controllable Generations

- assumptions
	* no random factor in generation states
	* The realization within units is ignored.
	* linear costs

- find the benefits from
	* controllability: constraints on power adjustments

##### Standard Follower, Discrete Production

modeled and analyzed individually

##### Receding Horizon Decision Making

- The start-up and shut-down costs are assumed to be zero.

##### Plan & Order

- Event Routine 3

### 4-3-4. Arbitraging Agents

Demand-Side Production Function





## 6. Conclusion and Discussion

- when delivery networks are considered
	* market fragmentation -> spatially distributed markets
