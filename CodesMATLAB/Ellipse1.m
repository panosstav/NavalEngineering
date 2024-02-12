clear all
close all

a=3;
b=2;

x0=0;
y0=0;

t=[0:5*10^(-4):2*pi];
x=x0+a*cos(t);
y=y0+b*sin(t);

figure
hold on
axis equal
plot(x,y)

xb=x(666);
yb=y(666);

lamda=[-1:5*10^(-4):1];
xe=x0+lamda*(xb-x0);
ye=y0+lamda*(yb-y0);

plot(xe,ye,'m')
plot(x0,y0,'k*')
plot(xb,yb,'ko')