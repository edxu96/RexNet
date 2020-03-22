
## 2, Batch Trading

### Trade in Batch

Prosumer may trade for a period composed of several time units. For example, it takes 5 hours, which is 15 time units when the length of the unit is 20 minutes, to charge an electric vehicle, and the prosumer may trade for these 15 units in the 5 time units before. This is called trading in batch.

| Name |           Meaning           |
|:----:|:---------------------------:|
| t_1  |       start to trade        |
| t_2  | beginning of trading period |
| t_3  |    end of trading period    |

### Illustration of Batch

```
len_unit = 20
t = s * len_unit

       |_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|
t      0     20    40    60    80   100   120   140   160   180   200   220   240   260   280
s      0     1     2     3     4     5     6     7     8     9     10    11    12    13    14
```

```
list_t_1 = [1, 61, 141]
list_s_1 = [0, 3, 7]
list_s_trade_1 = [0, 1, 2]  # [Trading Session]
list_s_batch_1 = [3, 4, 5, 6]  # [Batch]
```

```
  3 4 5 6  
0 - - - -    
1 - - - -    
2 - - - -  
```

```
list_t_2 = [61, 141, 261]
list_s_2 = [3, 7, 13]
list_s_trade_2 = [3, 4, 5, 6]  # [Trading Session]
list_s_batch_2 = [7, 8, 9, 10, 11, 12]  # [Batch]
```

```
  7  8  9  10 11 12
3 -  -  -  -  -  -
4 -  -  -  -  -  -
5 -  -  -  -  -  -
6 -  -  -  -  -  -
```

```Python
list_s_trade = list(range(s_1, s_2 + 1))
list_s_period = list(range(s_2, s_3 + 1))
len_trade = s_2 - s_1
len_period = s_3 - s_2
s_1 = s_2 - len_trade
s_3 = s_2 + len_period
```

### How Prosumers Trade in Batch

```Python
def decide_batch(self, c, v, len_unit, num_unit, p_std, states):
    """
    At `c`, which is during `v` trade session, the prosumer makes a series of decisions for `[s_2, s_3)` period.
    """
    batch = self.batches.search_v(v)
    list_s = list(range(batch.s_2, batch.s_3 + 1))
    print('    list_s = {} ;'.format(list_s))
    dict_trade = dict.fromkeys(list_s, 0)
    for s_i in list_s:
        dict_trade[s_i] = self.decide(batch, s_i, c, len_unit, num_unit, p_std, states)
    return dict_trade
```

## 3, Appendix

* [Assigning a function to a variable, stack overflow](https://stackoverflow.com/questions/10354163/assigning-a-function-to-a-variable)

```
>>> def print_x(x):
>>>     print(x)
>>> print_y = print_x
>>> print_y(20)
20
```

* [Python : 6 Different ways to create Dictionaries](https://thispointer.com/python-6-different-ways-to-create-dictionaries/)

Creating Dictionary by a list of keys and initialsing all with same value:

```Python
list_s = list(range(batch.s_2, batch.s_3 + 1))
dict_trade = dict.fromkeys(list_s, 0)
```
