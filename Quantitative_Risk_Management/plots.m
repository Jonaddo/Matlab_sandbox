%% Histogram of the 3 stocks returns
figure(1)
h1 = histogram(stockReturn(:,1));
hold on
h2 = histogram(stockReturn(:,2));
h3 = histogram(stockReturn(:,3));
h1.Normalization = 'probability';
h1.BinWidth = 0.01;
h2.Normalization = 'probability';
h2.BinWidth = 0.01;
h3.Normalization = 'probability';
h3.BinWidth = 0.01;
title('Portfolio composition returns')
hold off
%% Non parametric VaR and ES of the portfolio
figure(2)
h4 = histogram(z);
h4.Normalization = 'probability';
h4.BinWidth = 0.01;
title('Portfolio non param. VaR')
l1 = line([-NonParamVaR -NonParamVaR ],[0, 0.3], 'Color', 'r', 'LineWidth', 2);
l2 = line([-NonParamES -NonParamES],[0, 0.3], 'Color', 'b', 'LineWidth', 2);
legend([l1 l2],'VaR','ES')