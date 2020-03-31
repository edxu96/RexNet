
# Simulated Realization and Forecast

1. Analysis of Error Sequences
2. Martingale Model of Forecast Evolution (MMFE)
3. Continuous-Time Fixed-Volume MMFE
4. Resampling of Non-Stationary Dependent Time Series

## 1. Analysis of Error Sequences

time-dependent continuous-time Markov

sojourn times are uncorrelated

states will affect the transition probability

jump (increment and reduction) size fixed to 1

evolving time is fixed

multi-variate

whether the jump is increment or reduction dependent on states

using artificial data

How forecast errors for the same unit evolve with decreasing forecast horizon?

Example:

multiple realization of a stochastic process with fixed length

### 1-1. Performance in Different Horizons

![](../images/SRF-1.png)

_Figure 1. Performance in terms of normalized mean absolute error (NMAE) of two prediction models (persistence and a state-of-art artificial-intelligence based prediction method) for short-term wind power in four different sites._

- __madsen2005standardizing__ Standardizing the performance evaluation of short-term wind power prediction models
- __kariniotakis2004what__ What performance can be expected by short-term wind power prediction models depending on site characteristics?

reproduce the result using realized error sequence

### 1-2. Autocorrelation of Error Sequences

there is no correlation in the error



- __miettinen2020simulating__ Simulating wind power forecast error distributions for spatially aggregated wind power plants

### 1-3. Cross-Correlation of Error Sequences by Different Prosumers

the aggregated estimation will be lowered.

### 1-4. Information

Information may have similar influence on forecasts for different time units.

## 2. Martingale Model of Forecast Evolution (MMFE)

> Although it might seem desirable to develop a stochastic model for these quantities based on the particular statistical method which is used to produce the forecasts, this turns out (in many cases) to be unnecessary. It is indeed fortunate that this is so. for many forecasting techniques are based on more data than past demands. For example, prices of competing goods, and marketing, advertising, and other promotional plans, and sometimes even expert judgement are used to produce the forecasts on which decisions are based. For many reasons (lack of data, the difficulty of modeling competitors' price changes, and the obvious problem of modeling expert judgement) it would be very difficult to produce and fit a model in this way, and to have confidence in the resulting model. [_heath1994modeling_]


When horizons of forecasts are fixed, like those in electricity market families, there is no need for MMFE, because there is no evolution. Instead, empirical findings regarding relationships of two forecasts are essential.

> Let <img src="/SimRealFore/tex/ee9d54822fe854da6a43aabc754423ac.svg?invert_in_darkmode&sanitize=true" align=middle width=27.75472589999999pt height=22.465723500000017pt/> be the forecast made in period <img src="/SimRealFore/tex/6f9bad7347b91ceebebd3ad7e6f6f2d1.svg?invert_in_darkmode&sanitize=true" align=middle width=7.7054801999999905pt height=14.15524440000002pt/> for the demand in period <img src="/SimRealFore/tex/e6f67d2dd02f3db62b92134688f76846.svg?invert_in_darkmode&sanitize=true" align=middle width=40.12543094999999pt height=20.908638300000003pt/> The realized demand in period <img src="/SimRealFore/tex/4f4f4e395762a3af4575de74c019ebb5.svg?invert_in_darkmode&sanitize=true" align=middle width=5.936097749999991pt height=20.221802699999984pt/> is denoted by <img src="/SimRealFore/tex/cd92e256abb8779531802e3b644213f3.svg?invert_in_darkmode&sanitize=true" align=middle width=31.904221799999988pt height=22.465723500000017pt/> In each period, forecasts are updated for future <img src="/SimRealFore/tex/ddcb483302ed36a59286424aa5e0be17.svg?invert_in_darkmode&sanitize=true" align=middle width=11.18724254999999pt height=22.465723500000017pt/> periods; let the forecasts for all periods beyond be a constant. Thus, <img src="/SimRealFore/tex/ddcb483302ed36a59286424aa5e0be17.svg?invert_in_darkmode&sanitize=true" align=middle width=11.18724254999999pt height=22.465723500000017pt/> may be interpreted as the length of the forecasting horizon. Define <img src="/SimRealFore/tex/6b8269b130f0c90a35a1514a0125cfbe.svg?invert_in_darkmode&sanitize=true" align=middle width=334.1270212499999pt height=22.465723500000017pt/> to be the change in the forecast in period <img src="/SimRealFore/tex/6f9bad7347b91ceebebd3ad7e6f6f2d1.svg?invert_in_darkmode&sanitize=true" align=middle width=7.7054801999999905pt height=14.15524440000002pt/> for the demand of period <img src="/SimRealFore/tex/99e119d76bd1a0b69988e9580970b30d.svg?invert_in_darkmode&sanitize=true" align=middle width=10.50232094999999pt height=20.221802699999984pt/> Thus, in each period <img src="/SimRealFore/tex/b2e4b727b722462631879a1b313d8d26.svg?invert_in_darkmode&sanitize=true" align=middle width=12.27170339999999pt height=14.15524440000002pt/> a forecast update vector <img src="/SimRealFore/tex/3f31fb9697eca4becfa5267903da604a.svg?invert_in_darkmode&sanitize=true" align=middle width=220.21107404999998pt height=24.65753399999998pt/> is generated. (Note that the first element in the vector, <img src="/SimRealFore/tex/29bd9e5611a1e036571bd1ca9e9d2b61.svg?invert_in_darkmode&sanitize=true" align=middle width=29.366487149999987pt height=14.15524440000002pt/> which is equal to the difference between the actual demand and the last forecast, represents the error that remains unresolved through forecasts.) The purpose of the MMFE is to analyze the probabilistic structure of this vector. [_sapra2012continuous_]

> The model requires an assumption that the forecast update vector in period <img src="/SimRealFore/tex/634454300a2bd029ef99a7d0167677f1.svg?invert_in_darkmode&sanitize=true" align=middle width=34.269373049999984pt height=14.15524440000002pt/> be a zero-mean normally distributed random vector that is identically distributed for all <img src="/SimRealFore/tex/6f9bad7347b91ceebebd3ad7e6f6f2d1.svg?invert_in_darkmode&sanitize=true" align=middle width=7.7054801999999905pt height=14.15524440000002pt/> and that <img src="/SimRealFore/tex/8da637c817923dad700f6c2d36783d16.svg?invert_in_darkmode&sanitize=true" align=middle width=13.869873599999991pt height=14.15524440000002pt/> is uncorrelated with past forecast update vectors <img src="/SimRealFore/tex/731a7d1a2a5fda3974efd70b6a73fc84.svg?invert_in_darkmode&sanitize=true" align=middle width=77.68255769999999pt height=17.723762100000005pt/> The last assumption is satisfied if, for any <img src="/SimRealFore/tex/b2e4b727b722462631879a1b313d8d26.svg?invert_in_darkmode&sanitize=true" align=middle width=12.27170339999999pt height=14.15524440000002pt/> the forecast made in period <img src="/SimRealFore/tex/6f9bad7347b91ceebebd3ad7e6f6f2d1.svg?invert_in_darkmode&sanitize=true" align=middle width=7.7054801999999905pt height=14.15524440000002pt/> for demand in period <img src="/SimRealFore/tex/c360ae93efaa80c9e3fc24578a97b335.svg?invert_in_darkmode&sanitize=true" align=middle width=46.38479834999999pt height=22.465723500000017pt/> is a conditional expectation of <img src="/SimRealFore/tex/bb21b403fa6c1bf15ca031fd0b780c0e.svg?invert_in_darkmode&sanitize=true" align=middle width=26.51614679999999pt height=22.465723500000017pt/> given all of the information available at time <img src="/SimRealFore/tex/6f9bad7347b91ceebebd3ad7e6f6f2d1.svg?invert_in_darkmode&sanitize=true" align=middle width=7.7054801999999905pt height=14.15524440000002pt/>. In this case, the sequence of forecasts for the demand of period <img src="/SimRealFore/tex/a4f13f5154eba4ba977b04fe09e81961.svg?invert_in_darkmode&sanitize=true" align=middle width=102.94839059999998pt height=24.65753399999998pt/> forms a Martingale process. [_sapra2012continuous_]

> Note that this assumption does not mean that the elements of <img src="/SimRealFore/tex/8da637c817923dad700f6c2d36783d16.svg?invert_in_darkmode&sanitize=true" align=middle width=13.869873599999991pt height=14.15524440000002pt/> are uncorrelated. On the contrary, they are likely to be correlated since they are equal to forecast updates for future periods given the same new information in period <img src="/SimRealFore/tex/6f9bad7347b91ceebebd3ad7e6f6f2d1.svg?invert_in_darkmode&sanitize=true" align=middle width=7.7054801999999905pt height=14.15524440000002pt/>. [_sapra2012continuous_]

### 2-1. Dynamic Procurement and Cancellation

__wang2012multiordering__ A multiordering newsvendor model with dynamic forecast evolution.
  - Eq. 9 uses deterministic future ordering costs

> The newsvendor can spread her orders over the planning horizon to take advantage of lower ordering costs with early orders and more accurate demand forecasts with late orders. [_wang2012multiordering_]

### 2-1. Optimal Stopping and Procurement Quantity

For procurements of goods, companies may not have the ability to make decisions regard target units only, and the demand in target units may be uncertain. The delivery of goods procured takes time, and it may be uncertain. That is, the lead time of procurements may be uncertain. For goods instead of services, they are storable. So it's better for companies to receive the goods early when the lead time varies.

> Moreover, the procurement lead times are often uncertain. Delays can occur for many reasons, including transportation-infrastructure issues in rapidly-developing economies, congestion in foreign and domestic ports, customs inspections, and logistical issues involving export quotas. [_wang2009wait_]

> Ordering earlier reduces the “lateness” risk associated with uncertain lead times but it also increases the firms’ demand risk, i.e., the potential mismatch between the quantity procured and the realized demand. [_wang2009wait_]

### 2-2. Martingale Model of Asymmetric Forecast Evolutions (MMAFE)

> Both MMFE and CTMMFE are not forecasting techniques; they simply provide a framework to represent the evolution of forecasts over time. The actual forecasts could be made using any forecasting technique such as time-series methods or a combination of human judgement and statistical techniques. The MMFE and CTMMFE models treat the forecasts over time as realizations of a stochastic process, namely, a martingale process; that is, the forecasts are the conditional expectation of the future demand, given all the available information. [_sapra2013equilibrium_]

### 2-3. Forecast Cooperation

> The supplier, however, does not know the manufacturer’s private forecast information. To facilitate information sharing, the manufacturer can report her forecast prior to the capacity decision. However, the manufacturer’s forecast report is non-binding (it is not a firm order and can be canceled or revised), non-verifiable (after demand is realized, a third party cannot verify that the manufacturer disclosed her actual forecast), and costless (the manufacturer does not incur any cost when sharing her forecast). This kind of forecast reporting strategy leads to what is known as “cheap talk” communication. [_oh2013mechanism_]

Auctioneers collect everyone's forecast and willings to clear the markets once in a while.

### 2-4. Evolution of Forward Prices

When future forward prices are unknown, their realization should be simulated as well. Most of the time, the realization can be correlated to that of quantites.

- __hair2014energy__ energy procurement strategies in the presence of intermittent sources

> In general, conventional energy tends to be more expensive in markets closer to real time. The reason for this is that the marginal costs of production tend to be higher in spot markets than in forward or long term markets because any conventional energy that is demanded closer to real time is provided by generators that have low start up time and these generators typically are more expensive than generators that require several hours to start up. [_hair2014energy_]

## 4. Resampling of Non-Stationary Dependent Time Series

### Model-Based Resampling

> Model-based resampling is easily adopted to time series. The resamples are obtained by simulating the time series model. For example, if the model is ARIMA(p,d,q), then the resamples of an ARIMA(p, q) model with MLEs (from the differenced series) of the autoregressive and moving average coefficients and the noise variance. The resamples are the sequences of partial sum of the simulated ARIMA(p, q) process.

> Model-free resampling of time series is accomplished by block resampling, also called block bootstrap, which can be implemented using the tsboot function in R’s boot package. The idea is to break the series into roughly equal-length blocks of consecutive observations, to resample the block with replacement, and then to paste the blocks together. For example, if the time series is of length 200 and one uses 10 blocks of length 20, then the blocks are the first 20 observations, the next 20, and so forth. A possible resample is the fourth block (observation 61 to 80), then the last block (observation 181 to 200), then the second block (observation 21 to 40), then the fourth block again, and so on until there are 10 blocks in the resample.

### Model-free Resampling

Stationary sub-process -> Scenario

Assume that sub-processes are iid.

#### Scenario and Profile

> Taking the need for flexibility into account when assessing whether a portfolio of generation and other resources will meet future needs for electricity cannot be done on the basis of a projected load-duration curve because such curves do not reflect the time-domain variations of the load. To ensure that a set of resources will be able to meet a system’s operating constraints, their operation must be simulated on a set of demand profiles that reflect a sufficiently wide range of anticipated system conditions. For a more detailed discussion of this issue, see Ma et al. (2013) or Ulbig and Andersson (2015). [1]

> Note that a discrete stochastic process can be represented by a finite set of actual vectors, referred to as scenarios, resulting from the combinations of all the discrete values that its component random variables can adopt. In mathematical terms, if <img src="/SimRealFore/tex/fd8be73b54f5436a5cd2e73ba9b6bfa9.svg?invert_in_darkmode&sanitize=true" align=middle width=9.58908224999999pt height=22.831056599999986pt/> is a discrete stochastic process, it can be expressed as <img src="/SimRealFore/tex/e263746254135e56cdc551e1041ed96e.svg?invert_in_darkmode&sanitize=true" align=middle width=179.39467259999998pt height=24.65753399999998pt/>, where <img src="/SimRealFore/tex/ae4fb5973f393577570881fc24fc2054.svg?invert_in_darkmode&sanitize=true" align=middle width=10.82192594999999pt height=14.15524440000002pt/> is the scenario index and <img src="/SimRealFore/tex/a2f93c3085aaf2e6b8898a28f49b3fb0.svg?invert_in_darkmode&sanitize=true" align=middle width=22.591375949999993pt height=22.465723500000017pt/> is the number of possible scenarios. In order for the discrete stochastic process to be perfectly determined, a probability of occurrence π(ω) needs to be associated with each realization <img src="/SimRealFore/tex/4cc1f312f1762191e01a8cb536678fdc.svg?invert_in_darkmode&sanitize=true" align=middle width=33.19642259999999pt height=24.65753399999998pt/> such that <img src="/SimRealFore/tex/e43b3be675aef37d9792e347806bce70.svg?invert_in_darkmode&sanitize=true" align=middle width=109.95552974999998pt height=32.256008400000006pt/>. [2]

#### Stochastic Process and Scenario

> A weakly stationary process is characterized by the fact that both the mean value and the variance are constant, while the auto-covariance function depends only on the time difference, i.e., by <img src="/SimRealFore/tex/e17a98818ec293ff9cc092dcfc2f58ed.svg?invert_in_darkmode&sanitize=true" align=middle width=39.40654739999999pt height=24.65753399999998pt/>. [3]

> A stationary process is said to be ergodic if its ensemble averages equal appropriate time averages. By this definition we mean that any statistic of <img src="/SimRealFore/tex/739fe69d785eb129eeb2746580e64377.svg?invert_in_darkmode&sanitize=true" align=middle width=33.63019769999999pt height=24.65753399999998pt/> can be determined from a single realization <img src="/SimRealFore/tex/f92a2fed82f1dacdec6e4d5a05fbbf97.svg?invert_in_darkmode&sanitize=true" align=middle width=28.11651809999999pt height=24.65753399999998pt/>. This is a general requirement. In most applications we consider only specific statistics, as, e.g., the mean value. [3]

#### Scenario Generation and Reduction

> To adequately describe a stochastic process, it is critical to generate a sufficient number of scenarios so that these scenarios cover the most plausible realizations of the considered stochastic process. To achieve this, it is generally required to generate a very large number of scenarios, which may render the associated stochastic programming problem computationally intractable. [2]

> It is thus required to develop procedures to reduce the number of scenarios initially generated. These procedures should retain most of the relevant information on the stochastic process contained in the original scenario set while reducing significantly its cardinality. [2]


---

## 1, Introduction

> In the day-ahead market, the wind forecast is simulated based on the realization of WG and the simulation of wind forecast error. The realization of WG is assumed to be the same as historical data. Wind forecast error is simulated based on a probability distribution considering the associated temporal correlation. Demand forecast is also simulated using this approach. [4]



## 3, References

1. Kirschen, D.S. and Strbac, G., 2018. Fundamentals of power system economics. John Wiley & Sons.
2. Conejo, A.J., Carrión, M. and Morales, J.M., 2010. Decision making under uncertainty in electricity markets (Vol. 1). New York: Springer.
under uncertainty in electricity markets (Vol. 1). New York: Springer.
3. Madsen, H., 2007. Time series analysis. Chapman and Hall/CRC.
4. Ma, J., Silva, V., Belhomme, R., Kirschen, D.S. and Ochoa, L.F., 2013, July. Evaluating and planning flexibility in sustainable power systems. In 2013 IEEE power & energy society general meeting (pp. 1-11). IEEE.

[_wang2012multiordering_]: https://github.com/edxu96/symposium/tree/master/src/SRF
[_sapra2013equilibrium_]: https://github.com/edxu96/symposium/tree/master/src/SRF
[_oh2013mechanism_]: https://github.com/edxu96/symposium/tree/master/src/SRF
[_hair2014energy_]: https://github.com/edxu96/symposium/tree/master/src/SRF
[_madsen2005standardizing_]: https://github.com/edxu96/symposium/tree/master/src/SRF
[_sapra2012continuous_]: https://github.com/edxu96/symposium/tree/master/src/SRF
[_heath1994modeling_]: https://github.com/edxu96/symposium/tree/master/src/SRF
[_wang2009wait_]: https://github.com/edxu96/symposium/tree/master/src/SRF
