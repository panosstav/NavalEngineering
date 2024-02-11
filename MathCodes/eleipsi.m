clear all
close all

a=2;
b=1;

x0=0;
y0=0;

vima=10^(-5);
d=1;
for ii=0:vima:2*pi
    thita(d)=ii;
    x(d)=x0+a*cos(ii);
    y(d)=y0+b*sin(ii);
    d=d+1;
end
figure
hold on
plot(x,y)
axis equal
floor(2*pi/vima)+1 %posa stoixeia exoun oi pinakes kai ans tha vgei 628329