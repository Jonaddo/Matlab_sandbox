%% Triangular Arbitrage
%Période: Mardi 9 Novembre de 07:00 à 17:00 
clc
%% Debut des calculs
%Pour obtenir un Bid price JPYGBP à partir d'un Bid GBPJPY
%il faut prendre le ASK GBPJP puis l'inversé

JPYGBP=zeros(36001,1);% changement de point de vue pour avoir du JPYGBP
for i=1:36001
    JPYGBP(i,1)=1/(forex(i,3));
end

forex=[forex(:,1) forex(:,2) JPYGBP];%Matrix des 3 FOREX
Ia=1000000;%Initial amount in GBP

l=length(forex);
%%
Arbitrage_p=zeros(l,1);%Arbitrage "Profit"
for i=1:l
    Arbitrage_p(i,1)=Ia*forex(i,1)*forex(i,2)*forex(i,3);
end

Product_forex=zeros(l,1);
for i=1:l
    Product_forex(i,1)=forex(i,1)*forex(i,2)*forex(i,3);
end
        
Ia_1=Ia*ones(l,1);
Difference=Arbitrage_p-Ia_1;%Payoff positif and/or negatif

%Positives payoffs
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
%% Descriptive statistics
%Cumulative Profit Plot
Cumu=zeros(l,1);
for i=2:l
    Cumu(i,1)=Cumu(i-1,1)+Profit_minute(i,1);
end

Final_amount=Ia+Cumu(l,1);

%Graph 
figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
plot(Profit_minute)
title('Cash flows during a stock-day')
ylabel('Cash flow')
xlabel('Secondes')

subplot(2,1,2)       % add second plot in 2 x 1 grid
area(Cumu)       % plot using + markers
title('Cumulative cash flows')
ylabel('Cash flow')
xlabel('Secondes')

%Graph
figure
subplot(4,1,1)       % add first plot in 4 x 1 grid
plot(forex(:,1))
title('GBP/USD')
ylabel('Bid rate(t)')


subplot(4,1,2)       % add second plot in 2 x 1 grid
plot(forex(:,2))       % plot using + markers
title('USD/JPY')
ylabel('Bid rate(t)')


subplot(4,1,3)       % add second plot in 2 x 1 grid
plot(forex(:,3))       % plot using + markers
title('JPY/GBP')
ylabel('Bid rate(t)')


subplot(4,1,4)       % add second plot in 2 x 1 grid
plot(Product_forex)       % plot using + markers
title('R')
ylabel('R(t)')
xlabel('Time in seconds')