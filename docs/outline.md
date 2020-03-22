
## 4. ABM of Prosumers

_Discussion about general questions about ABM._

- what is ABM

- why ABM
	* it is hard by analytical methods
	* how the initially mismatched supply and demand are balanced through the market, unaffected consumption and uncontrollable generation
	* no need to replicate empirical findings like market micro-structure literature
	* decision making frameworks
	* there is no centralized coordinator, interaction between agents through the market
  * external factors affect agents

### 4-1. Additive Model Structures

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

### 4-2. Mixed Consumption

- reservation-realization and realization without the market
	* decision making process

- external factors affect the market through agents
  * typical life schedule, time and date
  * factors affecting the life schedule

#### 4-2-1. Unaffected Realization

- evolution without market
  * the effect of other factors is neutral
  * the overall effect from external factors is 0
  * Markov property
  * subjective probability

#### 4-2-2. Dynamic Inconsistency, Sub-Game and Anticipation

- reservation-realization
	* the anticipation is becoming more clear with lead time shrinkingm, thus the deviation will become smaller
	* the realization process is random
	* the conflict is assumed to be resolved with decrease in utility

model the decision making process when the effect of reservation is taken into account as part of the probability.

#### 4-2-3. Simulated Realization

#### 4-2-4. Anticipated Transition Probability Matrix (ATPM)

#### 4-2-5. Action Rules

Event Routine 1

#### 4-2-6. Parameters Describing the Population

- population
  * elasticity, reaction to prices in the market
  * reservation lead time
  * arrival time and frequency
  * other characteristics are homogeneous
  * reactions to external factors are the same

### 4-3. Simulated Stochastic Uncontrollable Realization

- scenarios for realization and forecast
	* discrete state
	* capacity
	* forecast correlations

#### 4-3-1. Model-Free Scenario Generation


#### 4-3-2. Simulation of Forecast

continuous Markov chain with fixed number of states ?

- decreasing as lead time decreasing ?
  * updating frequency
  * adjustment quantity

asymmetric because of capacity

#### 4-3-3. Forecast Update and Trading

Event Routine 2

#### 4-3-4. Spatial Representation and Correlation


### 4-4. "P&O" Model for Controllable Generations

- assumptions
	* no random factor in generation states
	* The realization within units is ignored.
	* linear costs

- find the benefits from
	* controllability: constraints on power adjustments

#### 4-4-1. Standard Follower, Discrete Production

modeled and analyzed individually

#### 4-4-2. Receding Horizon Decision Making

- The start-up and shut-down costs are assumed to be zero.




#### 4-4-3. Plan & Order

- Event Routine 3

### 4-5. Arbitraging Agents

Demand-Side Production Function

## 5. discrete event simulation and result

- basic settings
	* next-event time-advance approach
	* realization happens simutaneouly at fixed-interval time points
	* discrete states

- two types of event,
	* order events
	* realizations and opening auctions
- Models are event routine
	* uncontrollable generations: executions of limit orders
	* controllable generaions: submissions of market orders
	* mixed consumptions: submissions of market orders

- Simulation program
	* system states: the market and the population
	* simulation clock
	* event list
	* statistical counters

### 5-1. Correlation of Heterogeneous Factors

- what is the simulation results
	* how the matching is distributed
	* the surden effect from external factors, the intermittency of renewable resources
	* the impacts of different features of agents on the market and their profits from the market

## 6. Conclusion and Discussion

- when delivery networks are considered
	* market fragmentation -> spatially distributed markets
