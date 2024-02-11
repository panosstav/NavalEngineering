clear all
close all

arxi=0;
bhma=10^(-3);
telos=5*pi;

x0=1;
y0=1;
k=0.1;

t=[arxi:bhma:telos];
x=x0+exp(k*t).*cos(t);
y=y0+exp(k*t).*sin(t);

figure
plot(x,y,'m*')
hold on
axis equal