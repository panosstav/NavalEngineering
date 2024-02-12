arxi=0;
telos=1;
vima=10^(-5);

x=[arxi:vima:telos];
y=x.^2;

oloklhrwma=0;
for (ii=1:length(x)-1)
    emv=((y(ii)+y(ii+1))*(x(ii+1)-x(ii)))/2;
    oloklhrwma=oloklhrwma+emv;
end

par_x=1;
par_y=2*x;

stoix_mhkos=sqrt(par_x.^2+par_y.^2);
mhkos=0;
for (ii=1:length(x)-1)
    mhk=((stoix_mhkos(ii)+stoix_mhkos(ii+1))*(x(ii+1)-x(ii)))/2;
    mhkos=mhkos+mhk;
end
mhkos