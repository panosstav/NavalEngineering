vima=10^(-3)/exp(1);
t=[1/(7^(1/3)):vima:2];
x=t.^(2/3).*log(1+t.^4);
y=(t*(1/2)).*cos(1+t.^2);

olo=trapezoeidhs_olokl(x,y)

par_x=((2/3)*t.^(-1/3)).*log(1+t.^4)+t.^(2/3).*(4*t.^3)/(1+t.^4);
par_y=(1/2).*cos(1+t.^2)-(t*(1/2)).*sin(1+t.^2);

d_mhkos=sqrt(par_x.^2+par_y.^2);
mikos=trapezoeidhs_olokl(t,d_mhkos)

t_neo=t(66:666);
oloklhrwteos_neos=d_mhkos(66:666);

oloklhrwma=trapezoeidhs_olokl(t_neo,oloklhrwteos_neos)
