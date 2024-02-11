x=[0:10^(-4):pi];
y=cos(x);

arxiX=-0.5;
telosX=pi+0.5;

arxiY=-1.5;
telosY=1.5;

ftiakse_euthi_tmima(arxiX,0,telosX,0)
ftiakse_euthi_tmima(0,arxiY,0,telosY)

plot(x,y)
hold on

%protupo
n=4114;

xp=x(n);
yp=0;

xa=xp
ya=0;

xb=xa;
yb=y(n);

ftiakse_euthi_tmima(xa,ya,xb,yb)
ftiakse_euthi_tmima(xp,yb,0,yb)

plot(xa,ya,'ko')
plot(0,yb,'k*')

hold on
arxi_Y=y(1)-2.5;
telos_Y=x(length(x))+0.5;

ftiakse_euthi_tmima(arxiX,0,telosX,0)
ftiakse_euthi_tmima(0,arxi_Y,0,telos_Y)

x1=acos(y);
plot(y,x1,'r')
