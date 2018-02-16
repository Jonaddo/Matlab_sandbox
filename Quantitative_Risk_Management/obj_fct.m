function f=obj_fct(VaR,z)
            alpha=.05;
            h=std(z)*length(z)^(-.2);
f=(mean(normcdf((z-VaR)/h))-alpha)^2;
