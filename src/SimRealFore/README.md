
# Simulated Realization and Forecast


## Analysis of Error sequences



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

### Performance in Different Horizons

![](./1.png)

_Figure 1. Performance in terms of normalized mean absolute error (NMAE) of two prediction models (persistence and a state-of-art artificial-intelligence based prediction method) for short-term wind power in four different sites._

- __madsen2005standardizing__ Standardizing the performance evaluation of short-term wind power prediction models
- __kariniotakis2004what__ What performance can be expected by short-term wind power prediction models depending on site characteristics?

reproduce the result using realized error sequence





### Autocorrelation of Error Sequences

there is no correlation in the error



- __miettinen2020simulating__ Simulating wind power forecast error distributions for spatially aggregated wind power plants

### Cross-Correlation of Error Sequences by Different Prosumers

the aggregated estimation will be lowered.

## Fixed-Volume Adjustments


it usually turns out to be one-way adjustment


- one-way adjustment
- early adjustment
- infrequent adjustment

### Horizon Distribution of Adjustments



## Simulation of Error sequences



---

## 1, Introduction

> In the day-ahead market, the wind forecast is simulated based on the realization of WG and the simulation of wind forecast error. The realization of WG is assumed to be the same as historical data. Wind forecast error is simulated based on a probability distribution considering the associated temporal correlation. Demand forecast is also simulated using this approach. [4]

## 2, Resampling of Non-Stationary Dependent Time Series

### Model-Based Resampling

> Model-based resampling is easily adopted to time series. The resamples are obtained by simulating the time series model. For example, if the model is ARIMA(p,d,q), then the resamples of an ARIMA(p, q) model with MLEs (from the differenced series) of the autoregressive and moving average coefficients and the noise variance. The resamples are the sequences of partial sum of the simulated ARIMA(p, q) process.

> Model-free resampling of time series is accomplished by block resampling, also called block bootstrap, which can be implemented using the tsboot function in R’s boot package. The idea is to break the series into roughly equal-length blocks of consecutive observations, to resample the block with replacement, and then to paste the blocks together. For example, if the time series is of length 200 and one uses 10 blocks of length 20, then the blocks are the first 20 observations, the next 20, and so forth. A possible resample is the fourth block (observation 61 to 80), then the last block (observation 181 to 200), then the second block (observation 21 to 40), then the fourth block again, and so on until there are 10 blocks in the resample.

### Model-free Resampling

Stationary sub-process -> Scenario

Assume that sub-processes are iid.

#### Scenario and Profile

> Taking the need for flexibility into account when assessing whether a portfolio of generation and other resources will meet future needs for electricity cannot be done on the basis of a projected load-duration curve because such curves do not reflect the time-domain variations of the load. To ensure that a set of resources will be able to meet a system’s operating constraints, their operation must be simulated on a set of demand profiles that reflect a sufficiently wide range of anticipated system conditions. For a more detailed discussion of this issue, see Ma et al. (2013) or Ulbig and Andersson (2015). [1]

> Note that a discrete stochastic process can be represented by a finite set of actual vectors, referred to as scenarios, resulting from the combinations of all the discrete values that its component random variables can adopt. In mathematical terms, if $\lambda$ is a discrete stochastic process, it can be expressed as $\lambda  = {\lambda(\omega), \omega = 1, 2, ..., N_{\Omega}}$, where $\omega$ is the scenario index and $N_{\Omega}$ is the number of possible scenarios. In order for the discrete stochastic process to be perfectly determined, a probability of occurrence π(ω) needs to be associated with each realization $\lambda(\omega)$ such that $\sum_{\omega = 1}^{N_{\Omega}} \pi(\omega) = 1$. [2]

#### Stochastic Process and Scenario

> A weakly stationary process is characterized by the fact that both the mean value and the variance are constant, while the auto-covariance function depends only on the time difference, i.e., by $(t_1 − t_2)$. [3]

> A stationary process is said to be ergodic if its ensemble averages equal appropriate time averages. By this definition we mean that any statistic of $X(t)$ can be determined from a single realization $x(t)$. This is a general requirement. In most applications we consider only specific statistics, as, e.g., the mean value. [3]

#### Scenario Generation and Reduction

> To adequately describe a stochastic process, it is critical to generate a sufficient number of scenarios so that these scenarios cover the most plausible realizations of the considered stochastic process. To achieve this, it is generally required to generate a very large number of scenarios, which may render the associated stochastic programming problem computationally intractable. [2]

> It is thus required to develop procedures to reduce the number of scenarios initially generated. These procedures should retain most of the relevant information on the stochastic process contained in the original scenario set while reducing significantly its cardinality. [2]


## 3, References

1. Kirschen, D.S. and Strbac, G., 2018. Fundamentals of power system economics. John Wiley & Sons.
2. Conejo, A.J., Carrión, M. and Morales, J.M., 2010. Decision making under uncertainty in electricity markets (Vol. 1). New York: Springer.
under uncertainty in electricity markets (Vol. 1). New York: Springer.
3. Madsen, H., 2007. Time series analysis. Chapman and Hall/CRC.
4. Ma, J., Silva, V., Belhomme, R., Kirschen, D.S. and Ochoa, L.F., 2013, July. Evaluating and planning flexibility in sustainable power systems. In 2013 IEEE power & energy society general meeting (pp. 1-11). IEEE.
