clear all
close all

x=[0:10^(-4):2*pi];
y=cos(x);

figure
plot(x,y)
hold on

%askones
arxiX=-0.5;
telosX=2*pi+0.5;
arxiY=-1.5;
telosY=y(length(y))+0.5;

ftiakse_euthi_tmima(arxiX,0,telosX,0)
ftiakse_euthi_tmima(0,arxiY,0,telosY)