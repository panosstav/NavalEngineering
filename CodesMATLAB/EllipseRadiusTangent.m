%dhmeiourgeia elleipshs
x0=0;
y0=0;
a=3;
b=2;

t=[0:10^(-4):2*pi];
x=x0+a*cos(t);
y=y0+b*sin(t);

figure
hold on
plot(x,y)
axis equal

%epivatiki aktina elleipshs
lamda=[0:5*10^(-4):1];
xe=x0+lamda*(x(5000)-x0);
ye=y0+lamda*(y(5000)-y0);

hold on
plot(xe,ye,'m')
plot(x(5000),y(5000),'ko')

%efaptomenh elleipshs
ux=-a*sin(t(5000));
uy=b*cos(t(5000));

[x_ef,y_ef]=euthigrammo_tmhma_synartisi(x(5000),y(5000),ux,uy,10^(-3),-3/2,3/2);
plot(x_ef,y_ef)