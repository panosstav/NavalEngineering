x0=0;
y0=0;

a=5;
b=2;
t=[0:10^(-5):pi];
x=x0+a*cos(t);
y=y0+b*sin(t);

x_par=-a*sin(t);
y_par=b*cos(t);

d_mhkos=sqrt(x_par.^2+y_par.^2);
mhkos_kampulhs=fun_oloklhrwma(t,d_mhkos)