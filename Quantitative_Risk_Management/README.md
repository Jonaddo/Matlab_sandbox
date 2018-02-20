# About this folder
This was an optional project in the class Financial Econometrics. This project applies different types of Value at Risk, Expected Shortfall and also portfolio's sensitivities to real data. 

# Portfolio composition
The portfolio is constructed with only three stocks (Banca Monte dei Paschi di Siena, Deutsche Bank and Credit Suisse) and is equally weighted.
The period covers the range: 29th December 2006 to 30th December 2008.

![portf](https://user-images.githubusercontent.com/36447056/36306875-ea573cca-1319-11e8-805f-562a54143607.jpg)

# Value at risk (VaR) and Expected Shortfall (ES)
In the main file we compute different risk measures such as: parametric and non parametric VaR, ES sensitivities and also peaks over treshold VaR and ES.
As we expected the Gaussian VaR underestimate the true VaR therefore it is not recommended to use the parametric VaR.
In addition, the results also confirm that the ES tends to be higher than VaR since it takes into account the magnitude of the losses in the tail (alpha = .05 for this example).

![ook](https://user-images.githubusercontent.com/36447056/36326257-b7bc541c-135a-11e8-8061-bbb0bbc6da4f.jpg)

Note for better accuracy it is better to use a Monte Carlo method.

# VaR sensitivities
As expected by some risk metrics and the news at that time, the italian bank Banca Monte dei Paschi di Siena contributes the most to the overall VaR of the portfolio.

![var_sensi](https://user-images.githubusercontent.com/36447056/36421807-301fb6ba-163a-11e8-90f1-a8091661edbb.jpg)
