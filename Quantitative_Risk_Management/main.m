%% Financial Econometrics - Assignment
clear all
close all
clc

load 'stockPrice.mat'                 % load banks' stock price
stockReturn=diff(log(X));             % log return
SIGMA=cov(stockReturn);               % empiric covariance matrix
mu=mean(stockReturn)';                % empiric mean
a=[1/3 1/3 1/3]';                     % equally weigthed portfolio

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

%% VaR - Gaussian (parametric) 
z_95=norminv(.99,0,1); %Inverse normal cumulative distribution function giving the 99% quantile
fprintf('------- Gaussian VaR -------\n')
GaussianVaR = -(a'* mu -(a'*SIGMA*a)^(1/2)*z_95)

%% VaR - Non parametric
z = -a'*stockReturn';         % negative of the returns weighted by their portfolio weight (a)
opt = optimset('Display','off');   % parameters optimisation
guess = GaussianVaR;               
fprintf('------- Non parametric VaR -------\n')
NonParamVaR = fminsearch(@obj_fct, guess, opt, z)

% We notice that the Gaussian hypothesis seems to underestimate the true VaR.
% Therefore it is not a good thing to assume gaussian returns.

%% Expected Shortfall (ES) - Non parametric
alpha = 0.05;
T=length(z);
h=std(z)*T^(-.2);
fprintf('------- Non parametric ES -------\n')
NonParamES = mean(z.*normcdf((z-NonParamVaR)/h))/alpha

%% Non parametric VaR and ES of the portfolio
figure(2)
h4 = histogram(z);
h4.Normalization = 'probability';
h4.BinWidth = 0.01;
title('Portfolio non param. VaR and ES')
l1 = line([-NonParamVaR -NonParamVaR],[0, 0.3], 'Color', 'r', 'LineWidth', 2);
l2 = line([-NonParamES -NonParamES],[0, 0.3], 'Color', 'b', 'LineWidth', 2);
legend([l1 l2],'VaR','ES')

%% VaR - Sensitivities 
% Gaussian
fprintf('------- Parametric VaR - sensitivities -------\n')
SensitivitiesGaussianVaR = -mu + SIGMA * a/(a'*SIGMA*a)^(1/2)*z_95 
% Using Kernel estimation
T = length(z);
h = std(z)*T^(-.2); 
C = exp(-.5*((-stockReturn*a-NonParamVaR)/h).^2);
A = kron(ones(1,1),C);
B = -stockReturn.*A;
fprintf('------- Non param. VaR - sensitivities -------\n')
SensitivitiesNonParamVaR = sum(B)'/sum(C)

%% Bar plot - VaR sensitivities
figure(3)
c = {'BMPS','DBK','CS'};
bar(SensitivitiesNonParamVaR, 0.4);
set(gca,'XTick',1:3,'XTickLabel',c)
title('Non param. VaR sensitivities')

%% Extreme Value Theory - Peaks Over Threshold (POT)
u=-.05;        %treshold
z2=stockReturn(stockReturn<u); 
%Method of moments, parameters estimation
m=mean(z2);    % empiric mean
S2=var(z2,1);  % empiric variance
xi=.5*(1-(m-u)^2/S2); 
sigma=.5*(m-u)*((m-u)^2/S2+1);
N=length(z2);
sigma_tilde=sigma*(N/T)^xi;
mu_tilde=u-sigma_tilde/xi*((N/T)^(-xi)-1);
fprintf('------- VaR - POT -------\n')
POTVaR = mu_tilde+sigma_tilde/xi*(alpha^(-xi)-1) 
fprintf('------- ES - POT --------\n')
POTES = POTVaR-sigma_tilde/(xi-1)*alpha^(-xi)