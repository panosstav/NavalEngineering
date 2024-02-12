function [m,megisto,thesi]=mesh_timh_megisto(x)

sum1=0;
for ii=1:length(x)
    sum1=sum1+x(ii);
    if ii==1
        megisto=x(ii);
        thesi=ii;
    else
        if megisto<x(ii)
            mesgisto=x(ii);
            thesi=ii;
        end
    end
end
m=sum1/length(x);