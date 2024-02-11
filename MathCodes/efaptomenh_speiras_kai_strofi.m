clear all
close all

%speira
arxi=0;
bhma=10^(-3);
telos=5*pi;

x0=0;
y0=0;
k=0.1;

t=[arxi:bhma:telos];
x=x0+exp(k*t).*cos(t);
y=y0+exp(k*t).*sin(t);

figure
plot(x,y,'r')
hold on
axis equal

%efaptomeni sto N
N=1000;
xA=x(N);
yA=y(N);

uy=k*exp(k*t(N))*sin(t(N))+exp(k*t(N))*cos(t(N));
ux=k*exp(k*t(N))*cos(t(N))+exp(k*t(N))*(-sin(t(N)));

[euth_x,euth_y]=euthigrammo_tmhma_synartisi(xA,yA,ux,uy,0.0001,-1,1);
plot(euth_x,euth_y)

%aksones x'x/y'y
[x_arnitika,x_thetika]=euthigrammo_tmhma_synartisi(0,0,1,0,10^(-3),-2,2);
[y_arnitika,y_thetika]=euthigrammo_tmhma_synartisi(0,0,0,1,10^(-3),-2,2);

hold on
plot(x_arnitika,x_thetika)
plot(y_arnitika,y_thetika)

%strofi
phii=pi/2;
pinakas_strofi=[cos(phii),-sin(phii);sin(phii),cos(phii)];
c=pinakas_strofi*[x;y];
x_estrameno=c(1,:);
y_estrameno=c(2,:);
plot(x_estrameno,y_estrameno)


