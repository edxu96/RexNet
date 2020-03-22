
There are many kinds of random variables in this simulation.

> This estimation of the relevant probability distribution is called the problem of identification or system identification. We see then how the problem of estimation often involves that of identification. In fact, in most situations of decision making in stochastic environment, the problems of identification, estimation and control are all tied together. (Stochastic Systems: Estimation, Identification and Adaptive Control)

All kinds of randomnesses are summarized in the following table:

|           Name            |  Expression   | Type |    Constraint     | M-Corr | A-Corr |
|:-------------------------:|:-------------:|:----:|:-----------------:|:------:|:------:|
|       Factor of Fix       |    `f_fix`    |  RV  |        > 0        |   N    |   -    |
|      Factor of Flex       |   `f_flex`    |  RV  |        > 0        |   N    |   -    |
|     Factor of Control     |  `f_control`  |  RV  |      [0, 1]       |   N    |   -    |
|      Fixed Quantity       |   `vec_fix`   |  SP  |         -         |   Y    |   Y    |
| Maximum Flexible Quantity |   `vec_max`   |  SP  | corr with fixed q |   N    |   N    |
|   Forward Trading Time    | `vec_forward` |  SP  |        > 0        |   N    |   N    |

1. RV: random variable; SP: stochastic process

## 1,  Attributes of Prosumers

There are three univariate attributes for every prosumer, `f_fix`, `f_flex` and `f_max`.

```Python
vec_f_fix = [random.uniform(0.01, 0.05) for _ in range(0, self.num)]
vec_f_flex = [random.uniform(1, 5) for _ in range(0, self.num)]
vec_f_control = [random.uniform(0, 1) for _ in range(0, self.num)]
```

## 2,  Fixed Quantity Profile of Prosumers

To make the simulation feasible, we assume that all the fixed quantities are pre-determined, and there is no update after the forward trading time.

A fixed profile of some participant for one cycle is a series of values showing how much energy it must generates or consumes during one cycle profile, which is stored in vector. For every prosumer, three values, `slope`, `volatile` and `x_peak` are needed to generate the fixed quantity profile.

```Python
vec_slope = [random.uniform(-slope_max, slope_max) for _ in range(0, self.num)]
vec_volatile = [random.uniform(1, volatile_max) for _ in range(0, self.num)]
vec_x_peak = [int(random.uniform(x_peak_min, x_peak_max) * self.num_unit) for _ in range(0, self.num)]
```

The following algorithm can generate a volatile line with single peak value.

```Python
@staticmethod
def generate_fix(num_unit, slope, volatile, x_peak):
    """
    Function to generate fixed quantity profile during one cycle.
        The general trend of the result is single-peak v-curve, with maximum absolute value around x_peak.
        The mean of slope of first part is slope, The mean of slope of second part is (- slope).
        The volatile indicates the volatility of the value.
    Example: vec_fix = generate_fix(num_unit=120, slope=-5, volatile=5,
                                    x_peak=int(120 * random.uniform(0.2, 0.8)))
             plt.plot(range(0, 120), vec_fix)
             plt.show()
    :param num_unit: Number of intervals in one cycle
    :param slope: changing ratio of quantity
    :param volatile: intermittent ratio of quantity
    :param x_peak: interval with maximum quantity absolute value
    :return vec_fix: vector of fixed quantity during one cycle

    Author: Edward J. Xu
    Version: 2.0
    Date: Feb 10th, 2019
    """
    if num_unit <= x_peak:
        logging.error('num_unit <= x_peak!')  # num_unit > x_peak
    vec_fix = [0] * num_unit
    vec_fix[0] = 1 * np.random.normal(loc=slope, scale=volatile)
    for i in range(1, x_peak):
        vec_fix[i] = vec_fix[i - 1] + np.random.normal(loc=slope, scale=volatile)
    for i in range(x_peak, num_unit):
        vec_fix[i] = vec_fix[i - 1] + np.random.normal(loc=-slope, scale=volatile)
    return vec_fix
```

The generated profiles and the sum can be visualized in the following image:

![Generated Fixed Profile and Sum](https://github.com/edxu96/ForwardEnergyMarket/blob/master/src/results/190628/1.png)

In addition, maximum flexible profile is fixed profile multiplied by `f_max`, which means smaller fixed quantity allows larger maximum flexible profile. However, many energy generation technologies, for example, wind turbines and solar panels, are uncontrollable. Usually, electricity output from intermittent renewable energy generators is more difficult to predict and control. That is, they are expected to be assigned with shorter forward time and smaller `f_max`.

```Python
self.vec_max = [self.f_max * (self.fix_max - i) for i in self.vec_fix]
```

Simulated time series scenario should be used to generate the profile.

It's hard to simulate the fixed profile directly. Based on the relationship of external conditions like temperature and wind speed, we can simulate the profile indirectly.

Or, we can rely on [Smart Residential Load Simulator](https://uwaterloo.ca/power-energy-systems-group/downloads/smart-residential-load-simulator-srls) to generate the profile. There are other related articles about the load:

1. [A time series probabilistic synthetic load curve model for residential customers](https://ieeexplore.ieee.org/abstract/document/6019365)
2. Community-scale residential energy demand simulation for smart-grid applications

## 3,  Forward Trading Time of Fixed Profile

For every prosumer, the forward trading time of fixed profile, forward time for short, is the length of all the trading time of fixed profile for some time unit. It's an important variable to describe the behavior of the prosumers. In general, longer forward trading time makes it easier for the prosumer to earn more profit or for other prosumers to compensate it. For example, if a wind farm predict that, 1 hour later, their output will double for 5 minutes, they can trade the quantity when the forward price for that 5 minutes is high. Or if the wind farm decides to trade now no matter what the price is, there is still one hour left for prosumers in demand side to increase their electricity use.

```Python
random.seed(serial)  # the seed will make sure the sample can be replicated
vec_trans = [random.randint(1, ahead_max) for _ in range(0, num_unit)]
```

We may use inter-arrival time to represent the time when the participants make decisions. IID random variables can be used.

## 4,  Reference

### 4.1,  Multi-Variate Distribution

### 4.2,  Correlation

### 4.3,  Stochastic Process

### 4.4,  Specify Randomness in the Absence of Data
