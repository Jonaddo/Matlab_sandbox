function f=obj_fct(VaR,z)
            alpha=.01;
            h=std(z)*length(z)^(-.2);
f=(mean(normcdf((z-VaR)/h))-alpha)^2;
