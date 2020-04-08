
- lot size: $\delta$
- tick size: $\sigma$

- length of units: $\epsilon$
- number of forward units: $\kappa$

## Continuous-Time Binary-Adjustment Martingale Model of Forecast Evolution (CTBA-MMFE)

$$
x^u_i(t) = x^u_i (\kappa \epsilon) + z^u_i(t)
$$

$z^u_i(t)$ is a counting process, summarizing all adjustments during interval $(c_i - \kappa \epsilon, c_i - t]$.

sojourn times $S_{n} = W_{n+1} - W_{n}$ are independent.

The sizes of forecast adjustments are fixed, equal to $\delta$.

initial forecast

$x^u_i(t)$ is the cumulative forecast up to $(c_i - t)$

$z^u_i(t)$ is the cumulative forecast adjustments up to $(c_i - t)$

$x^u_i(0)$ is the realization

The probability of adjustment $P_x (t) = $ depends on lead time and state.

$$
P_{\Delta x} (t) = \frac{(\kappa \epsilon - t)^2 + (\Delta x)^2}{\kappa^2 \epsilon^2 + (x_{\mathrm{max}} - x_{\mathrm{min}})^2}
$$

$\Delta x = \min\{x - x_{\mathrm{min}}, x_{\mathrm{max}} - x \} $

### Birth and Death Processes
