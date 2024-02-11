clear all
close all

x=[-2:10^(-3):2];
y=exp(x);

arxiX=-2.5;
telosX=2.5;
arxiY=y(1)-0.5;
telosY=y(length(y))+0.5;

ftiakse_euthi_tmima(0,arxiY,0,telosY);
ftiakse_euthi_tmima(arxiX,0,telosX,0);

plot(x,y)