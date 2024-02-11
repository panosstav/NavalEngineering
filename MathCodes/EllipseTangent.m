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
plot(x,y)
axis equal

xc=x(666);
yc=y(666);

lamda=[0:5*10^(-4):1];
xe=x0+(xc-x0)*lamda;
ye=y0+(yc-y0)*lamda;

plot(xe,ye,'m')
plot(x0,y0,'k*')
plot(xc,yc,'ko')

x_par=-a*sin(t);
y_par=b*cos(t);

xpm=x_par(666);
ypm=y_par(666);

xMon=xpm/sqrt(xpm^2+ypm^2);
yMon=ypm/sqrt(xpm^2+ypm^2);

m=[-3/2:10^(-4):3/2];
x_efapt=xc+xMon*m;
y_efapt=yc+yMon*m;

plot(x_efapt,y_efapt)