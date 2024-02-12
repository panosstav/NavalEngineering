arxi=-9;
telos=9;
vima=10^(-5);
x=[arxi:vima:telos];
y=cos(x);
z=sin(x+0.5);
figure
hold on
plot(x,y)
plot(x,z)
axis equal

%tomh synartisewn
d=1;
N=length(x);
for k=2:N
    prin=y(k-1)-z(k-1);
    nyn=y(k)-z(k);
    if ((nyn<=0)&&(prin>0))||((nyn>0)&&(prin<=0))
        if abs(nyn)<=abs(prin)
            tomh_x(d)=x(k);
            tomh_y(d)=y(k);
            tomh_z(d)=z(k);
        else
            tomh_x(d)=x(k-1);
            tomh_y(d)=y(k-1);
            tomh_z(d)=z(k-1);
    end
    d=d+1;
    end
end
plot(tomh_x,tomh_y,'m')
