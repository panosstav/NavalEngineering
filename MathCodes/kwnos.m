clear all
close all

x0=0;
y0=0;

tKBK=-7;
tABK=11;

vimaT=10^(-3);
vimaZ=10^(-1);
t=[0:vimaT:2*pi];

for jj=tKBK:vimaZ:tABK
    a=abs(jj*tan(pi/6));
    x=x0+a*cos(t);
    y=y0+a*sin(t);
    z=jj*ones(size(x));
    plot3(x,y,z)
    hold on
end