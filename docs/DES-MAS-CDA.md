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
