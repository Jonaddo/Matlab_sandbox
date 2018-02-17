%% Triangular Arbitrage
% Period: Tuesday 9th November 2016, 07:00 am to 05:00 pm 
clc
load 'currencies.mat'
%% Bid price
% In order to get the Bid price JPYGBP from the Bid GBPJPY we need to
% inverse the ASK GBPJPY

JPYGBP=zeros(36001,1);
for i=1:36001
    JPYGBP(i,1)=1/(forex(i,3));
end

forex=[forex(:,1) forex(:,2) JPYGBP];
Ia=1000000;                           
l=length(forex);
%%
Arbitrage_p=zeros(l,1);              
for i=1:l
    Arbitrage_p(i,1)=Ia*forex(i,1)*forex(i,2)*forex(i,3);
end

Product_forex=zeros(l,1);
for i=1:l
    Product_forex(i,1)=forex(i,1)*forex(i,2)*forex(i,3);
end
        
Ia_1=Ia*ones(l,1);
Difference=Arbitrage_p-Ia_1; 
%%
D=size(Difference);
Profit_minute=zeros(D);
for i=1:D(1,1)
    if Difference(i,1)>0
        Profit_minute(i,1)=Difference(i,1);
    else
        Profit_minute(i,1)=0;
    end
end
%% Figure 1: Cash flows
Cumu=zeros(l,1);
for i=2:l
    Cumu(i,1)=Cumu(i-1,1)+Profit_minute(i,1);
end

Final_amount=Ia+Cumu(l,1);

figure
subplot(2,1,1)      
plot(Profit_minute)
title('Cash flows during a stock-day')
ylabel('Cash flow')
xlabel('Secondes')

subplot(2,1,2)       
area(Cumu)       
title('Cumulative cash flows')
ylabel('Cash flow')
xlabel('Secondes')
%% Figure 2: Triangle
figure
subplot(4,1,1)      
plot(forex(:,1))
title('GBP/USD')
ylabel('Bid rate(t)')

subplot(4,1,2)       
plot(forex(:,2))       
title('USD/JPY')
ylabel('Bid rate(t)')

subplot(4,1,3)       
plot(forex(:,3))       
title('JPY/GBP')
ylabel('Bid rate(t)')

subplot(4,1,4)      
plot(Product_forex)       
title('R')
ylabel('R(t)')
xlabel('Time in seconds')
