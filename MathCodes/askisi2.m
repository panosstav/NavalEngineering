x=[-pi/2+0.1:3*10^(-4):pi/2-0.1];
f=tan(x);
figure
hold on
plot(x,f,'b')

y=[0.1:3*10^(-4):pi-0.1];
g=cot(y);
plot(y,g,'r')

plot(968*3*10^(-4)-pi/2+0.1,f(969),'mo')
plot(695*3*10^(-4)+0.1,g(696),'g*')