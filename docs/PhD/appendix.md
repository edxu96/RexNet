---
for: github/edxu96/RexNet/docs/PhD
date: April 18, 2020
author: Edward J. Xu
---

# Appendix: Brief Mathematical Description

Two resolution parameters for the CDA market are given: tick size <img src="/docs/PhD/tex/7ccca27b5ccc533a2dd72dc6fa28ed84.svg?invert_in_darkmode&sanitize=true" align=middle width=6.672392099999992pt height=14.15524440000002pt/>, and lot size <img src="/docs/PhD/tex/8cda31ed38c6d59d14ebefa440099572.svg?invert_in_darkmode&sanitize=true" align=middle width=9.98290094999999pt height=14.15524440000002pt/>.

## Clients and CPPs

For now, univariate delivery <img src="/docs/PhD/tex/12db77e83e760808caf636deecc1b7f2.svg?invert_in_darkmode&sanitize=true" align=middle width=21.27850394999999pt height=22.63846199999998pt/> is used. Given some prosumer, for target unit <img src="/docs/PhD/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/>, , the final realization is a random variable <img src="/docs/PhD/tex/a75ad4aa393d50109470b1783c9a8858.svg?invert_in_darkmode&sanitize=true" align=middle width=40.23981884999999pt height=24.65753399999998pt/>.

__CPPs__ convert input <img src="/docs/PhD/tex/35531be55273dc37ee90083451d089ff.svg?invert_in_darkmode&sanitize=true" align=middle width=14.54330789999999pt height=22.55708729999998pt/> to output <img src="/docs/PhD/tex/26eb59da31fb48cb17abfe4c6dc80375.svg?invert_in_darkmode&sanitize=true" align=middle width=14.554737449999989pt height=22.55708729999998pt/>, which can be modeled by discrete-time linear time-invariant state space multiple-input multiple-output systems models:

<p align="center"><img src="/docs/PhD/tex/136e337163670748e8a023cdacbbdf5b.svg?invert_in_darkmode&sanitize=true" align=middle width=197.1942456pt height=41.09589pt/></p>

Given some prosumer, for target unit <img src="/docs/PhD/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/>, the evolution of forecasts for the final realization can be represented by a continuous time stochastic process <img src="/docs/PhD/tex/017af907c9ee548fa4f14ee833a377dd.svg?invert_in_darkmode&sanitize=true" align=middle width=159.47178719999997pt height=24.65753399999998pt/>. If all the information regarding target unit <img src="/docs/PhD/tex/77a3b857d53fb44e33b53e4c8b68351a.svg?invert_in_darkmode&sanitize=true" align=middle width=5.663225699999989pt height=21.68300969999999pt/> at time <img src="/docs/PhD/tex/4f4f4e395762a3af4575de74c019ebb5.svg?invert_in_darkmode&sanitize=true" align=middle width=5.936097749999991pt height=20.221802699999984pt/> can be represented by <img src="/docs/PhD/tex/12b5eaf62fb13bb62362010f291fec9d.svg?invert_in_darkmode&sanitize=true" align=middle width=36.06650684999999pt height=24.65753399999998pt/>, the forecast is the expectation of final realization condition on all current information:

<p align="center"><img src="/docs/PhD/tex/42ffd7d08590f64e272fab6ecc6b3c1c.svg?invert_in_darkmode&sanitize=true" align=middle width=159.21054435pt height=16.438356pt/></p>

It is hard to simulate the evolution of <img src="/docs/PhD/tex/12b5eaf62fb13bb62362010f291fec9d.svg?invert_in_darkmode&sanitize=true" align=middle width=36.06650684999999pt height=24.65753399999998pt/> and forecast processes directly, so the first part of prosumer models is introduced as __clients__ to simulate the forecast evolutions:

<p align="center"><img src="/docs/PhD/tex/cbc5497c51d9411529a83fae3969533b.svg?invert_in_darkmode&sanitize=true" align=middle width=151.2338421pt height=16.438356pt/></p>

where <img src="/docs/PhD/tex/0473c769f4d060e18f4e58ee0eff6fad.svg?invert_in_darkmode&sanitize=true" align=middle width=31.83898079999999pt height=24.65753399999998pt/> is a counting process, summarizing all adjustments during interval <img src="/docs/PhD/tex/65d9092b6b056d164248577af7ef7e48.svg?invert_in_darkmode&sanitize=true" align=middle width=73.02222014999998pt height=24.65753399999998pt/>. Because of the existence of lot size <img src="/docs/PhD/tex/8cda31ed38c6d59d14ebefa440099572.svg?invert_in_darkmode&sanitize=true" align=middle width=9.98290094999999pt height=14.15524440000002pt/>, all values are assumed to be integers. For now, it is assumed that there is no frictions between two parts of prosumers. So <img src="/docs/PhD/tex/dd4df8f644567ec3a64f4bf61e6eed96.svg?invert_in_darkmode&sanitize=true" align=middle width=33.58931564999999pt height=24.65753399999998pt/> is known to the second part, __coordinators__, who are responsible for managing CPPs.

## Receding Horizon Plan & Order Management

The state of some coordinator and its CPP at time <img src="/docs/PhD/tex/4f4f4e395762a3af4575de74c019ebb5.svg?invert_in_darkmode&sanitize=true" align=middle width=5.936097749999991pt height=20.221802699999984pt/> can be described by:

- portfolio vector (PV): <img src="/docs/PhD/tex/b00b9a11472eca8ebdf8bbc604306040.svg?invert_in_darkmode&sanitize=true" align=middle width=248.17180244999997pt height=24.65753399999998pt/>. Usually, one coordinator has one PV. When the coordinator faces multiple clients, it can participate in the market as one identity and distribute the procurement among clients.
- planned input matrix (PIM): <img src="/docs/PhD/tex/668f272627c4fa022397c3f44cebb5da.svg?invert_in_darkmode&sanitize=true" align=middle width=255.27874679999994pt height=24.65753399999998pt/>. The realization will follow the planned input vector if the coordinator does not arrive. The input into the market is the first row of the matrix: <img src="/docs/PhD/tex/9d70541f2131154413d8a9691f3578c9.svg?invert_in_darkmode&sanitize=true" align=middle width=261.64426364999997pt height=24.65753399999998pt/>.
- planned output matrix (POM): <img src="/docs/PhD/tex/44f0a4b5aa60b1ffe745f660bcafc21c.svg?invert_in_darkmode&sanitize=true" align=middle width=253.7148372pt height=24.65753399999998pt/>, which can be predicted by DT-LTI-SS. The output to satisfy requests of prosumers is the first several rows of the matrix: <img src="/docs/PhD/tex/debfc122f747f050a6adef9329e423c9.svg?invert_in_darkmode&sanitize=true" align=middle width=263.61878729999995pt height=24.65753399999998pt/>. The rest rows can be used to indicate if other requirements are satisfied.
- cumulative request matrix (CRM): <img src="/docs/PhD/tex/3fcaa261c58c910e531dfaa7812c5524.svg?invert_in_darkmode&sanitize=true" align=middle width=253.4522694pt height=24.65753399999998pt/>. Usually, there is only one client, so CRM becomes a row vector.

So that the general optimization problem for coordinators can be:

<p align="center"><img src="/docs/PhD/tex/444b8907bb57ee25d3a8d277251d505a.svg?invert_in_darkmode&sanitize=true" align=middle width=428.63463885pt height=676.0912586999999pt/></p>

with linear damping weights to keep the decision schemes linear:

The cost associated with inputs except that from the market: <img src="/docs/PhD/tex/c00372c0536d1897d33ae64575183742.svg?invert_in_darkmode&sanitize=true" align=middle width=44.88589214999999pt height=27.91243950000002pt/>:

<p align="center"><img src="/docs/PhD/tex/e894ddf9b6efc8d5a23e7a5e7b1e978f.svg?invert_in_darkmode&sanitize=true" align=middle width=244.76593845pt height=43.379419049999996pt/></p>

The risk weights associated with mismatched <img src="/docs/PhD/tex/61ccc6d099c3b104d8de703a10b20230.svg?invert_in_darkmode&sanitize=true" align=middle width=14.20083224999999pt height=22.55708729999998pt/> and <img src="/docs/PhD/tex/3ea43a6103aedd6b0ed232d3f2a374b4.svg?invert_in_darkmode&sanitize=true" align=middle width=14.20083224999999pt height=22.55708729999998pt/> can be defined as follows:

<p align="center"><img src="/docs/PhD/tex/17b929f289f2fe228aa41907f77d49e1.svg?invert_in_darkmode&sanitize=true" align=middle width=251.45578919999997pt height=224.7997125pt/></p>

> Choosing appropriate values of Q and R (i.e., tuning) is not always obvious, and this difficulty is one of the challenges faced by industrial practitioners of LQ control. [_rawlings2019model_]

Damping weights provide buffers against fluctuations to reduce round trades.

## Make-Take Management

Being linear in both objective functions and constraints, the above problem can provide prices for one-unit limit orders and one-unit cooperations based on Lagrange multipliers. Take one-unit limit orders for example, to price a one-unit limit order <img src="/docs/PhD/tex/1161987854e9308a987f774c131ea730.svg?invert_in_darkmode&sanitize=true" align=middle width=62.90453234999998pt height=24.65753399999998pt/> for target unit <img src="/docs/PhD/tex/8d1a78f3c7c6efdefdef6ecaf333edd8.svg?invert_in_darkmode&sanitize=true" align=middle width=34.82978564999999pt height=22.831056599999986pt/>, a new plan <img src="/docs/PhD/tex/8be54632fd8381f60b2977c77684015d.svg?invert_in_darkmode&sanitize=true" align=middle width=41.10164024999999pt height=24.65753399999998pt/> can be introduced. The price can be calculated using <img src="/docs/PhD/tex/64a1e139deec42c40db51b56c161341b.svg?invert_in_darkmode&sanitize=true" align=middle width=169.48032089999998pt height=24.65753399999998pt/> based on the current bid-ask prices <img src="/docs/PhD/tex/198ec338f865b3bd32348201cc7871b7.svg?invert_in_darkmode&sanitize=true" align=middle width=32.168949449999985pt height=24.65753399999998pt/> and <img src="/docs/PhD/tex/b53ac7d921eee1159278bc69d9383682.svg?invert_in_darkmode&sanitize=true" align=middle width=33.01369664999999pt height=24.65753399999998pt/>.

The introduction of <img src="/docs/PhD/tex/4b2d49c087ea9ba18547240a8fa41745.svg?invert_in_darkmode&sanitize=true" align=middle width=48.56757839999999pt height=24.65753399999998pt/> changes the right side of equation (1) by one unit. The resulting change of the objective function will be the value of the dual variable associated with the equation (1) in the dual problem of <img src="/docs/PhD/tex/b89e55c1530fb3b9cc3ff36884729fa9.svg?invert_in_darkmode&sanitize=true" align=middle width=38.46235469999999pt height=24.65753399999998pt/>. That is, the resulting change will be the corresponding Lagrange multiplier:

<p align="center"><img src="/docs/PhD/tex/d0f966420e92b22affcf5ce2b260d08b.svg?invert_in_darkmode&sanitize=true" align=middle width=236.7749571pt height=38.83491479999999pt/></p>

The effect of price change can be obtained after the model is optimized:

<p align="center"><img src="/docs/PhD/tex/f4416fdbea90c446dbc75f932862ddb6.svg?invert_in_darkmode&sanitize=true" align=middle width=250.63330214999996pt height=84.24519509999999pt/></p>

Regarding optimized market orders, their profit may be increased by make-take management:

For any prosumer <img src="/docs/PhD/tex/55a049b8f161ae7cfeb0197d75aff967.svg?invert_in_darkmode&sanitize=true" align=middle width=9.86687624999999pt height=14.15524440000002pt/> in the population <img src="/docs/PhD/tex/f9c4988898e7f532b9f826a75014ed3c.svg?invert_in_darkmode&sanitize=true" align=middle width=14.99998994999999pt height=22.465723500000017pt/>, equation (4) can be used to obtain the aggregated forecast of uncontrollable prosumptions:

<p align="center"><img src="/docs/PhD/tex/25dd51fe9d2b19dccaccf991344f9d58.svg?invert_in_darkmode&sanitize=true" align=middle width=123.9416838pt height=37.775108249999995pt/></p>

However, the exact value is unknown to anyone, because prosumers don't reveal their information to any one. Instead, coordinators all have their own anticipation based on their current information:

<p align="center"><img src="/docs/PhD/tex/f7200d179c65a11e4dcbadb58adb1bfc.svg?invert_in_darkmode&sanitize=true" align=middle width=212.42978129999997pt height=16.438356pt/></p>

where <img src="/docs/PhD/tex/1307d945728dfe6d10c801ad1c414f0b.svg?invert_in_darkmode&sanitize=true" align=middle width=35.37494894999999pt height=24.65753399999998pt/> is the expected position in the market:

<p align="center"><img src="/docs/PhD/tex/42c6f8c6f258f27d69a2141cca818578.svg?invert_in_darkmode&sanitize=true" align=middle width=212.4298605pt height=16.438356pt/></p>

The determination of <img src="/docs/PhD/tex/1307d945728dfe6d10c801ad1c414f0b.svg?invert_in_darkmode&sanitize=true" align=middle width=35.37494894999999pt height=24.65753399999998pt/> can be simulated as well.

The decisions can be optimized as a robust optimization problem.

Some prosumers may learn their position according to order flows.
