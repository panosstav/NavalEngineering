clear all
close all

%speira
x0=0;
y0=0;
arxi=0;
vima=10^(-3);
telos=2*pi;
k=0.1;

t=[arxi:vima:telos];
x=x0+exp(k*t).*cos(t);
y=y0+exp(k*t).*sin(t);
figure
hold on
plot(x,y)
axis equal

%efaptomenh speiras sto N
N=3333;

ux=k*exp(k*t(N))*cos(t(N))-exp(k*t(N))*sin(t(N));
uy=k*exp(k*t(N))*sin(t(N))+exp(k*t(N))*cos(t(N));

d=sqrt(ux^2+uy^2);
uxMon=ux/d;
uyMon=uy/d;

lamda=[-1.5:10^(-5):1.5];
x_ef=x(N)+uxMon*lamda;
y_ef=y(N)+uyMon*lamda;

plot(x_ef,y_ef)

%strofh
syntetagmenes=[x;y];
phii=pi/3;
pinakas_strofh=[cos(phii),-sin(phii);sin(phii),cos(phii)];
estramenes_syntetagmenes=pinakas_strofh*syntetagmenes;

x_estramena=estramenes_syntetagmenes(1,:);
y_estramena=estramenes_syntetagmenes(2,:);

plot(x_estramena,y_estramena)