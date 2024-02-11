arxi=1/2; telos=1.7; vima=5*10^(-3);
x=[arxi:vima:telos];
f=(x.^3).*log(x);
g=(2.^x).*cos(x);
figure
hold on
plot(x,f,'go')
plot(x,g,'b')
d=1;
for ii=1:length(x)
    if f(ii)>2*g(ii)
        megx(d)=x(ii);
        megf(d)=f(ii);
        d=d+1;
    end
end
plot(megx,megf,'r*')