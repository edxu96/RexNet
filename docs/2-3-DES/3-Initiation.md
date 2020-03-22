
## 3,  Initiate the Participants

Firstly, we initiate all the participants in the node.

```Python
node_1 = community.Node(
    num=10000,        # [Number of participants]
    ahead_max=20,     # [Maximum time ahead for dynamic price]
    len_interval=20,  # [Number of minutes in time interval]
    num_interval=60,  # [Number of intervals per cycle]
    p_std=100,        # [Standard price]
)
node_1.initiate()
```

The distributions of initiated parameters are:

```Python
vec_slope = [random.uniform(-slope_max, slope_max) for _ in range(0, self.num)]
vec_volatile = [random.uniform(1, volatile_max) for _ in range(0, self.num)]
vec_x_peak = [int(random.uniform(x_peak_min, x_peak_max) * self.num_interval) for _ in range(0, self.num)]
vec_r_flex = [random.uniform(1, r_flex_max) for _ in range(0, self.num)]
```
