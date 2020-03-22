
## Hierarchy in `RexNet` Framework

## 1, RexNet as Base for Hierarchical System

Some prosumer can be treated as an uncontrolled external effort for the corresponding lower level model. For example, prosumer `A` is the aggregator of whole DTU, then prosumers in the model representing `A` can be every single users in DTU. The decision in upper level will be the `EE` for the model in lower level. The relationship is illustrated in figure 1.

![Figure 1, Illustration of Hierarchical Models in `RexNet`](../images/RexNet_5.png)

## 2, RexNet-VPP: Integration of RexNet in Incumbent Electricity Market

A `RexNet` can serve as a lower level model for a specific area. The `EE` will be the traded power in the electricity market. The quantity can vary with balancing market, and changes in `RexNet` will follow. This feature provides the possibility for current energy system to transform progressively to reservation-based distributed energy system.

The external efforts can be the traded volume by the local aggregators.

> Consumers whose peak demand is at least a few hundred kilowatts may be able to save significant amounts of money by employing specialized personnel to forecast their demand and trade in the electricity markets to obtain lower prices. These consumers can be expected to participate directly and actively in the markets. On the other hand, such active trading is not worthwhile for smaller consumers who usually prefer purchasing on a tariff. Electricity retailers are in business to bridge the gap between the wholesale market and these smaller consumers. [_kirschen2018fundamentals_]

## 3, Big Data and Privacy

> To reduce its exposure to the risk associated with the unpredictability of the spot market prices, a retailer therefore tries to forecast as accurately as possible the demand of its customers. It then purchases energy on the forward markets to match this forecast. A retailer thus has a strong incentive to understand the consumption patterns of its customers. [_kirschen2018fundamentals_]
