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
	* states of brokers are unknown to each other, while the market state is common knowledge
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
	* the surdden effect from external factors, the intermittency of renewable resources
	* the impacts of different features of agents on the market and their profits from the market

### 4-3. System Evolution without Market

- passive load to be satisfied
	* there is always someone responsible for satisfying the demand of every prosumer in the population.
- cost distributed according to quantity
	* easy to measure
	* tradition
- unaffected realization of responsive consumptions
- the configuration of generators in the system can be optimized
	* three different scenarios are set in the simulation, and the degree of renewable penetrations varies
- automatic generation control
- benchmark

### 4-4. System Evolution with Market

- what is ABM

- why ABM
	* it is hard by analytical methods
	* how the initially mismatched supply and demand are balanced through the market, unaffected consumption and uncontrollable generation
	* no need to replicate empirical findings like market micro-structure literature
	* decision making frameworks
	* there is no centralized coordinator, interaction between agents through the market
  * external factors affect agents
- two kinds of agent-based models
	* brokers
	* clients

- assumptions about ABM
  * agents interact with each other only through the market.
  * hypothesis of independence
	* no learning ability
	* components
  * two major sources of external factors: intermittency of renewable sources and daily activity cycles

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

- Three types of clients
	* uncontrollable
	* controllable
	* responsive

- Requests and Instruction
