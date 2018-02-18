# About this exercise
The goal of this assignment was to verify if they are arbitrages opportunities in the FOREX market.
We collected high frequency data for three pairs of currencies in order to be able to make the triangle:
- GBP/USD
- USD/JPY
- JPY/GBP

In the currencies.mat file you will find bid-ask prices over a period of 10 hours. We already have preprocess the data in order to have seconds by seconds instead of ticks data points.

In order to detect an opportunity, the product of the three currencies should exceed 1.
As we could expect there are no arbitrage opportunities since we are standing in a very liquid and "efficient" market nowadays. However in a paper written by Y. Aiba et al. (2002), with data from 1999 they did find artbitrage opportunities.

![triangle](https://user-images.githubusercontent.com/36447056/36248592-571c82bc-1238-11e8-83e8-56e0b116b740.jpg)
