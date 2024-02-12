arxi=1;
telos=2;
vima=10^(-4);

x=[arxi:vima:telos];
y=x.^2;

oloklhrwma=0;
for (ii=1:length(x)-1)
    emv=((y(ii)+y(ii+1))*(x(ii+1)-x(ii)))/2;
    oloklhrwma=oloklhrwma+emv;
end

analytiko=telos^3/3-arxi^3/3;
oloklhrwma