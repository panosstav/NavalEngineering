r=5;
t=[0:10^(-3):2*pi];
x=r*cos(t);
y=r*sin(t);
figure
hold on
plot(x,y,'m*')
axis equal