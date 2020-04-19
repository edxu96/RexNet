---
for: github/edxu96/RexNet/docs/PhD
date: April 18, 2020
author: Edward J. Xu
---

# Appendix: Brief Mathematical Description

Two resolution parameters for the CDA market are given: tick size $\epsilon$, and lot size $\sigma$.

## Clients and CPPs

For now, univariate delivery $\mathbf{U}^{*}$ is used. Given some prosumer, for target unit $i$, , the final realization is a random variable $x_i(c_i)$.

__CPPs__ convert input $\mathbf{U}$ to output $\mathbf{V}$, which can be modeled by discrete-time linear time-invariant state space multiple-input multiple-output systems models:

$$ \begin{align}
\mathbf{w}_{i+1}(t) &= \mathbf{A} \mathbf{w}_{i}(t) + \mathbf{B} \mathbf{u}_{i}(t) \\
\mathbf{v}_{i}(t) &= \mathbf{C} \mathbf{w}_{i}(t) + \mathbf{D} \mathbf{u}_{i}(t)
\end{align} $$

Given some prosumer, for target unit $i$, the evolution of forecasts for the final realization can be represented by a continuous time stochastic process $x_i(t) \text{ ,  } c_i - \kappa \epsilon \leq t \leq c_i$. If all the information regarding target unit $i$ at time $t$ can be represented by $\Omega_i(t)$, the forecast is the expectation of final realization condition on all current information:

$$ x_i(t) = \mathbb{E}\left[x_i(c_i) | \Omega_i(t) \right] \tag{4} $$

It is hard to simulate the evolution of $\Omega_i(t)$ and forecast processes directly, so the first part of prosumer models is introduced as __clients__ to simulate the forecast evolutions:

$$ x_i(t) = x_i(\kappa \epsilon) + z_i(t) $$

where $z_i(t)$ is a counting process, summarizing all adjustments during interval $(c_i - \kappa \epsilon, t]$. Because of the existence of lot size $\sigma$, all values are assumed to be integers. For now, it is assumed that there is no frictions between two parts of prosumers. So $x_i(t)$ is known to the second part, __coordinators__, who are responsible for managing CPPs.

## Receding Horizon Plan & Order Management

The state of some coordinator and its CPP at time $t$ can be described by:

- portfolio vector (PV): $\mathbf{Y}(t) = [y_i(t), y_{i+1}(t), ..., y_{i+\kappa-1}(t)]$. Usually, one coordinator has one PV. When the coordinator faces multiple clients, it can participate in the market as one identity and distribute the procurement among clients.
- planned input matrix (PIM): $\mathbf{U}(t) = [\mathbf{u}_i(t), \mathbf{u}_{i+1}(t), ..., \mathbf{u}_{i+\kappa-1}(t)]$. The realization will follow the planned input vector if the coordinator does not arrive. The input into the market is the first row of the matrix: $\mathbf{U}^{*}(t) = [u_i^{*}(t), u_{i+1}^{*}(t), ..., u_{i+\kappa-1}^{*}(t)]$.
- planned output matrix (POM): $\mathbf{V}(t) = [\mathbf{v}_i(t), \mathbf{v}_{i+1}(t), ..., \mathbf{v}_{i+\kappa-1}(t)]$, which can be predicted by DT-LTI-SS. The output to satisfy requests of prosumers is the first several rows of the matrix: $\mathbf{V}^{*}(t) = [\mathbf{v}_i^{*}(t), \mathbf{v}_{i+1}^{*}(t), ..., \mathbf{v}_{i+\kappa-1}^{*}(t)]$. The rest rows can be used to indicate if other requirements are satisfied.
- cumulative request matrix (CRM): $\mathbf{X}(t) = [\mathbf{x}_i(t), \mathbf{x}_{i+1}(t), ..., \mathbf{x}_{i+\kappa-1}(t)]$. Usually, there is only one client, so CRM becomes a row vector.

So that the general optimization problem for coordinators can be:

$$ \begin{align}
\max_{\mathbf{E}(t), \mathbf{F}(t), \mathbf{U}(t)} \quad & \mathcal{M}_t \left[\mathbf{Y}(t), \mathbf{X}(t), \mathbf{B}^{\mathrm{p}}(t), \mathbf{A}^{\mathrm{p}}(t) \right] \\
& = - \mathbf{H}(t)^{\top} \mathbf{Q} - \left[\mathbf{G}^{+}(t) + \mathbf{G}^{-}(t) \right]^{\top} \mathbf{O} \\
& - \mathbf{U}(t)^{\top} \mathbf{R} + l \left[ \mathbf{E}^{+}(t)^{\top} \mathbf{B}^{\mathrm{p}}(t) - \mathbf{E}^{-}(t)^{\top} \mathbf{A}^{\mathrm{p}}(t) \right] \\
& - [\mathbf{F}^{+}(t) + \mathbf{F}^{-}(t)]^{\top} \mathbf{P} \\
\text{s.t.} \quad & \mathbf{w}_{i+k+1}(t) = \mathbf{A} \mathbf{w}_{i+k}(t) + \mathbf{B} \mathbf{u}_{i+k}(t) \quad \forall k \in K \\
& \mathbf{v}_{i+k}(t) = \mathbf{C} \mathbf{w}_{i+k}(t) + \mathbf{D} \mathbf{u}_{i+k}(t) \quad \forall k \in K \\
& \mathbf{v}_{\text{min}} \leq \mathbf{v}_{i+k}(t) \leq \mathbf{v}_{\text{max}} \quad \forall k \in K \\
& \mathbf{u}_{\text{min}} \leq \mathbf{u}_{i+k}(t) \leq \mathbf{u}_{\text{max}} \quad \forall k \in K \\
& - \mathbf{u}_{\Delta} \leq \mathbf{u}_{i+k+1}(t) - \mathbf{u}_{i+k}(t) \leq \mathbf{u}_{\Delta} \quad \forall k \in K_{-} \\
& \mathbf{E}^{+}(t) \geq 0 \quad \\
& \mathbf{E}^{+}(t) \geq \mathbf{E}(t)  \\
& \mathbf{E}^{-}(t) \geq 0 \\
& \mathbf{E}^{-}(t) \geq - \mathbf{E}(t) \\
& \mathbf{H}(t) \geq 0 \\
& \mathbf{H}(t) \geq \mathbf{Y}(t) + \mathbf{E}(t) - \mathbf{U}(t) \tag{1} \\
& \mathbf{G}^{+}(t) \geq 0 \\
& \mathbf{G}^{+}(t) \geq \mathbf{V}(t) - \mathbf{X}(t) - \mathbf{F}(t) \tag{2} \\
& \mathbf{G}^{-}(t) \geq 0 \\
& \mathbf{G}^{-}(t) \geq \mathbf{X}(t) + \mathbf{F}(t) - \mathbf{V}(t) \tag{3} \\
& \mathbf{F}^{+}(t) \geq 0 \quad \\
& \mathbf{F}^{+}(t) \geq \mathbf{F}(t)  \\
& \mathbf{F}^{-}(t) \geq 0 \\
& \mathbf{F}^{-}(t) \geq - \mathbf{F}(t) \\
& \mathbf{E}(t) \in \mathbb{R}^{\kappa} \\
& \mathbf{F}(t) \in \mathbb{R}^{\kappa} \\
& \mathbf{U}(t) \in \mathbb{R}^{\kappa}_{+}
\end{align} $$

with linear damping weights to keep the decision schemes linear:

The cost associated with inputs except that from the market: $\mathbf{U}^{\#}(t)$:

$$ \begin{align}
\mathbf{R} &= \left[r \quad \frac{\kappa - 1}{\kappa} r \quad \frac{\kappa - 2}{\kappa} r \quad \dots \right]^{\top}
\end{align} $$

The risk weights associated with mismatched $\mathbf{Q}$ and $\mathbf{O}$ can be defined as follows:

$$ \begin{align}
\mathbf{Q} &= \left[\begin{array}{ccccc}
    q & 0 & 0 & \dots & 0 \\
    0 & \frac{\kappa - 1}{\kappa} q & 0 & \dots & 0 \\
    0 & 0 & \frac{\kappa - 2}{\kappa} q & \dots & 0 \\
    \vdots & \vdots & \vdots & \ddots & \vdots \\
    0 & 0 & 0 & \dots & 0
\end{array} \right] \\
\mathbf{O} &= \left[\begin{array}{ccccc}
    o & 0 & 0 & \dots & 0 \\
    0 & \frac{\kappa - 1}{\kappa} o & 0 & \dots & 0 \\
    0 & 0 & \frac{\kappa - 2}{\kappa} o & \dots & 0 \\
    \vdots & \vdots & \vdots & \ddots & \vdots \\
    0 & 0 & 0 & \dots & 0
\end{array} \right]
\end{align} $$

> Choosing appropriate values of Q and R (i.e., tuning) is not always obvious, and this difficulty is one of the challenges faced by industrial practitioners of LQ control. [_rawlings2019model_]

Damping weights provide buffers against fluctuations to reduce round trades.

## Make-Take Management

Being linear in both objective functions and constraints, the above problem can provide prices for one-unit limit orders and one-unit cooperations based on Lagrange multipliers. Take one-unit limit orders for example, to price a one-unit limit order $\Delta e_{i+k}(t)$ for target unit $i+k$, a new plan $\mathbf{Y}_{k}(t)$ can be introduced. The price can be calculated using $ \mathcal{M}_t \left[\mathbf{Y}_{k}(t) \right] - \mathcal{M}_t \left[\mathbf{Y}(t) \right] $ based on the current bid-ask prices $\mathbf{B}(t)$ and $\mathbf{A}(t)$.

The introduction of $\Delta y_k(t)$ changes the right side of equation (1) by one unit. The resulting change of the objective function will be the value of the dual variable associated with the equation (1) in the dual problem of $\mathcal{M}(t)$. That is, the resulting change will be the corresponding Lagrange multiplier:

$$ \begin{align}
\lambda_{k}(t) = \frac{\partial \mathcal{M}_t \left[\mathbf{Y}(t), \mathbf{B}^{\mathrm{p}}(t), \mathbf{A}^{\mathrm{p}}(t) \right]}{\partial y_k(t)}
\end{align} $$

The effect of price change can be obtained after the model is optimized:

$$ \begin{align}
\frac{\partial \mathcal{M}_t \left[\mathbf{Y}(t), \mathbf{B}^{\mathrm{p}}(t), \mathbf{A}^{\mathrm{p}}(t) \right]}{\partial b_k(t)} &= e^+_k(t) \\
\frac{\partial \mathcal{M}_t \left[\mathbf{Y}(t), \mathbf{B}^{\mathrm{p}}(t), \mathbf{A}^{\mathrm{p}}(t) \right]}{\partial a_k(t)} &= - e^-_k(t)
\end{align} $$

Regarding optimized market orders, their profit may be increased by make-take management:

For any prosumer $n$ in the population $N$, equation (4) can be used to obtain the aggregated forecast of uncontrollable prosumptions:

$$ x_i(t) = \sum_{n \in N} x_i^n(t) $$

However, the exact value is unknown to anyone, because prosumers don't reveal their information to any one. Instead, coordinators all have their own anticipation based on their current information:

$$ \mathbb{E} \left[x_i(t) | \Psi_i^n(t) \right] = s_i^n(t) + u_i(t) $$

where $s_i^n(t)$ is the expected position in the market:

$$ s_i^n(t) = \mathbb{E} \left[x_i(t) - u_i(t) | \Psi_i^n(t) \right] $$

The determination of $s_i^n(t)$ can be simulated as well.

The decisions can be optimized as a robust optimization problem.

Some prosumers may learn their position according to order flows.
