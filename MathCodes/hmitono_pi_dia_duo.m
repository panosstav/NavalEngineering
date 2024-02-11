clear all
close all

x=[-pi/2:5*10^(-4):pi/2];
y=sin(x);

arxiX=-x(length(x))-0.5;
telosX=x(length(x))+0.5;
arxiY=-1.5;
telosY=1.5;

figure
hold on

ftiakse_euthi_tmima(arxiX,0,telosX,0);
ftiakse_euthi_tmima(0,arxiY,0,telosY);

plot(x,y)
hold on

%n=4114;
%xp=x(n);
%yp=0;
%xA=xp;
%yA=0;
%xB=xA;
%yB=y(n);
%ftiakse_euthi_tmima(xA,yA,xB,yB);
%ftiakse_euthi_tmima(xp,yB,0,yB);
%plot(xA,yA,'ko')
%plot(0,yB,'k*')

%arxi_X=-1.2;
%telos_X=1.2;
%arxi_Y=y(1)-1.5;
%telos_Y=x(length(x))+0.5;
%hold on
%figure
%ftiakse_euthi_tmima(arxi_X,0,telos_X,0);
%ftiakse_euthi_tmima(0,arxi_Y,0,telos_Y);

%x1=asin(y);
%plot(y,x1,'r');