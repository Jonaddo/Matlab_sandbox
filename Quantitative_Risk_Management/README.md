# About this folder
This was an option project in the class Financial Econometrics. This project shows how to compute different types of Value at Risk, Expected Shortfall and also the portfolio's risk measure sensitivity to its different components.

# Portfolio composition
The portfolio is constructed with only three stocks (Banca Monte dei Paschi di Siena, Deutsche Bank and Credit Suisse) and is equally weighted, i.e. w = 1/3 for every stocks.

![portf](https://user-images.githubusercontent.com/36447056/36306875-ea573cca-1319-11e8-805f-562a54143607.jpg)

# Value at risk (VaR) and Expected Shortfall (ES)
In the project file we compute different risk measures such as: parametric and non parametric VaR, ES sensitivities and also peaks over treshold VaR and ES.
As we expected the Gaussian VaR underestimate the true VaR therefore it is not recommended to use the parametric VaR.
In addition, the results also confirm that the ES tends to be higher than VaR since it takes into account the magnitude of the losses in the tail (alpha = .05 for this example).

![ook](https://user-images.githubusercontent.com/36447056/36326257-b7bc541c-135a-11e8-8061-bbb0bbc6da4f.jpg)

