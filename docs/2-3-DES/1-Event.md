
# How to Store Event List in Code

The event list decides which event to be executed next. In this project, single linked lists are used to represent the event lists. The events in the list are instances of the following class.

To make sure every command start from head of the event list, we create the head using the following class `EventList`, inherited from `Event`. The instances of `EventList` don't have `who` attribute and always have `t` being 0, which means they are not an event but the head of the event list.

```Python
class Event(object):
    """
    Construct the event list using single linked list
    """
    def __init__(self, t, who, v, ref=None):
        self.t = t  # [Time of the event]
        self.who = who  # [who the stakeholder is]
        self.v = v  # [Which batch]
        self.ref = ref
```

# Two Kinds of Events

There are two kinds of events in the event list. If the `event.who` is the exchanger, whose `who` is 0, the event is that the exchanger updates the state list. On the other hand, the `event.who` is the encode of some prosumer, the event is that the prosumer trades with the exchanger.

- __Update__. The exchanger update the state list. `node.update()`
- __Trade__. Some prosumer trades with exchanger. `node.trade(event, c)`

```Python
def happen(node, event, clock, whe_print=False):
    """
    The first event happens.
    """
    if event.who == 0:  # Exchanger update the state
        node.update()
        if whe_print:
            print('({:^4})-th update at () clock time.'.format(event.s, clock))
    else:  # Prosumer trade with exchanger
        node.trade(event, clock)
    # Delete the finished event
    node.events.delete_first()
    return node
```
