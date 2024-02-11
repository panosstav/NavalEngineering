arxi=1/2; telos=1.7; vima=5*10^(-3);
d=1;
for x=arxi:vima:telos
    f(d)=(x^3)*log(x);
    g(d)=(2^x)*cos(x);
    k(d)=x;
    d=d+1;
end
%an den valw tin grammi 6 mporw na apothikeusw edw ton pinaka x=[arxi:vima:telos];
figure
hold on
plot(k,f)
plot(k,g)
