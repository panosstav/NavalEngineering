clear all
x0=0;
y0=0;
a=5;
tKBK=-7; %katw z
tABK=11; %panw z
bhmaZ=10^(-1);
bhmaT=10^(-3);
t=[0:bhmaT:2*pi]
figure
for jj=tKBK:bhmaZ:tABK
    x=x0+a*cos(t);
    y=y0+a*sin(t);
    z=jj*ones(size(x));
    plot3(x,y,z)
    hold on
end