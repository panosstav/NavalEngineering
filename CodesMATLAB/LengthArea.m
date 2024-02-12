clear all

arxi=0;
telos=1;
vima=10^(-5);

x=[arxi:vima:telos];
y=x.^2;

emvadon=fun_oloklhrwma(x,y)

par_x=1;
par_y=2*x;
stoix_mhkos=sqrt(par_x^2+par_y.^2);

mhkos=fun_oloklhrwma(x,stoix_mhkos)