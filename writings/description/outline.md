
## 1. Introduction

- stochastic and intermittent supply and demand
	* the needs of consumers are required to meet all the time
	* the service delivery process relies heavily on the underlying engineered networks
	* provided and consumed in a continuous manner (continuous production)
	* prosumers cannot present at the same time
	* gate closure before the delivery, forward market
- compared with incumbent electricity market families
  * periodic double auction
  * demand response
- necessary features for a small-scale-friendly market
  * have time to react to price signals
  * anticipate their future states, formulate trading strategies and act accordingly
  * instantaneous transactions
  * Public information is widely spread and private information is tightly protected.
  * thick enough but not congested
  * statistics
  * imbalance within trading units can be maintained

- this project
	* framework for the next generation electricity market
	* three simple models to simulate the market operation process
- basic settings
  * tradable assets
  * limit order market
- reservation exchange
  * continuous double auction with a LOB-3D
- interaction between population, service delivery network, reservation exchange and external factors
  * benefit from the interchange of power between each others
  * constraints regarding service delivery network
  * coordinate in a distributed way
  * montary incentive is the most effective method

- the continuous operation of the market will be simulated, with prosumers represented by three prototypical agent-based modeled, instead of the idealized model
	* not to prove
	* illustrate how small-scale prosumers can participate directly in the market
	* simple strategy can benefit, risk-neutral, no loss stategy, without forecast
  * simulate the arrival of new information
- event routines

- application in other industries


## 2. Differentiate service temporally and spatially

turn services into tradable assets

### 2-1. rate instead of quantity

- why rate instead of quantity
  * time-dependent
  * instantaneous rate matters because of capacity
- first step to design a market for service is to choose a time interval as the trading unit
  * fluctuations between units
  * fluctuations within a unit (2-5)
  * adaptive units

### 2-2. Service Pool and Commodity

- perfect substitutes

- P2P market

### 2-3. Reservation instead of Walk-In

- separation of reservation, realization and settlement

- no reservation no service
  * responsibilities and rights

- Why do we need reservation?
  * inefficient and even dangerous to make decisions based on real-time spot price
  * to explore the maximum short-run elasticity of demand and supply
  * Some prosumers have price-inelastic supply or demand.
  * Prosumers trade for multiple units at the same time.
  * Define the responsibilities and rights.
  * Price discrimination.

- Drawbacks
  * uncertainty

### 2-4. Market Fragamentation

- temporally

- spatially
  * transmission and distribution

- two kinds of arbitragers:
  * temporal arbitrager
  * spatial arbitrager

- spatially-lumped market

- describe the simplified physical systems
  * the exact consumption is hard to know without global information
  * discrete state
  * constraints in networks are omitted.

### 2-5. Floor Constraint and Realization

- settlement
- distributed balancing resources from demand side is cheaper, especially in developing regions
- soft constraint

### 2-6. Inter-Temporal Dynamics

- continuous production process
- dynamics of physical systems
- advantages:
  * detection of market powers
  * make markets more liquid

## 3. Reservation Exchange

### 3-1. Two-Sided Market

- load forecast. forecast-and-control can never be the solution:
  * hard
  * dilemma of balancing privacy protection and forecast precision
  * switching retailer makes problem more complicated
- flexibility from demand response programs is not enough
- direct participation is the key
- no one is responsible for satisfying all the uninformed consumptions

### 3-2. Prosumers

- category of participants and behaviors in two-sided markets

- Traders and dealers

- Two kinds of models
  * short run
  * long run. base contracts

- prosumers in real life
  * energy management systems
  * human and electronic devices
  * forecast, advanced algorithms, artificial intelligence

### 3-3. Continuous Double Auction (CDA)

- for any given unit
- what is CDA
  * limit order books: bid-ask spread
  * market orders
  * limit orders
  * market makers
- why CDA is small-scale friendly
  * flexible
  * no arbitrage
- how to simulate
  * agent-based models (ABM)
  * discrete event simulation (DES)
- P2P
- spatial arbitrage
- gate closure
  * compare with intra-day market

### 3-4. Reservation Exchange

- Reservation exchange (Rex)
  * exchange market 
  * limit orders and market orders
  * the states is describe by LOB-3D (3-6)
  * gate closure
  * opening auction, periodic double auction (PDA)
- stochastic feedback control system

### 3-5. Price Dynamics

- assumptions
  * no inter-temporal dynamics
  * competitive
  * risk-neutral
  * no pure arbitrage
  * marginal cost
- model 1
- model 2
- as time approaching the gate closure

### 3-6. LOB-3D

- states of prosumers
- extra rules
  * simultaneous execution of orders
- performance metrics
