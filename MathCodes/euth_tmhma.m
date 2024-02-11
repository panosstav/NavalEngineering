xA=1;
yA=1;
vx=9;
vy=4;

arxi=0;
bhma=10^(-3);
telos=pi;

lamda=[arxi:bhma:telos];

metro=sqrt(xA^2+yA^2);
vxmon=vx/metro;
vymon=vy/metro;

x=xA+lamda*vxmon;
y=yA+lamda*vymon;

figure
hold on
plot(x,y)