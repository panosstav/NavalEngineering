r1=1;
r2=2;
ref=3;
x0=0;
y0=0;
x0_ef=5;
y0_ef=0;
k=1;
for t=0:0.01:pi*10
    x1(k)=x0+r1*cos(t);
    y1(k)=y0+r1*sin(t);
    x2(k)=x0+r2*cos(t);
    y2(k)=y0+r2*sin(t);
    xef(k)=x0_ef+ref*cos(t);
    yef(k)=y0_ef+ref*sin(t);
    k=k+1;
end
figure
hold on
plot(x1,y1,'r')
plot(x2,y2,'m')
plot(xef,yef)
axis equal