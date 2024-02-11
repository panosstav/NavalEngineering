close all
clear all

a=5;
x0=0;
y0=0;

tKBK=-7;
tABK=11;

vimaT=10^(-3);
vimaZ=10^(-1);

t=[0:vimaT:2*pi];
x=x0+a*cos(t);
y=y0+a*sin(t);

for jj=tKBK:vimaZ:tABK
    z=jj*ones(size(t));
    plot3(x,y,z)
    hold on
end