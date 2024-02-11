%mh estrameni troxia me kokkino xrwma
arxi=5^(-11/3);
telos=3*(pi/8);
vima=5*10^(-4);
x0=2;
y0=1;
d=1;

for p=arxi:vima:telos
 x(d)=x0+exp(-p).*cos(p);
 y(d)=y0+log(1+p).*sin(p);
 d=d+1;
end

figure
hold on
plot(x,y,'r')

%estrameni troxia me mple xrwma
thita=((pi)^(1/2))/2;
pinakas_strofi=[cos(thita),-sin(thita);sin(thita),cos(thita)];
suntetagmenes=[x;y];
estramenes=pinakas_strofi*suntetagmenes;
x_estrameno=estramenes(1,:);
y_estrameno=estramenes(2,:);

plot(x_estrameno,y_estrameno,'b')

%efaptomeni mh estramenis troxias me kitrino sto 666o shmeio
p=[arxi:vima:telos];
ux=-exp(-p(666))*cos(p(666))+exp(-p(666))*(-sin(p(666)));
uy=(1/(1+p(666)))*sin(p(666))+log(1+p(666))*cos(p(666));

lamda=[-1.5:10^(-4):1.5];
uxMon=ux/sqrt(ux^2+uy^2);
uyMon=uy/sqrt(ux^2+uy^2);

ef_x=x(666)+lamda*uxMon;
ef_y=y(666)+lamda*uyMon;
plot(x(666),y(666),'ko')
plot(ef_x,ef_y,'y')
axis equal