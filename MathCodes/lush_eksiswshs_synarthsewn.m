arxi=-2*pi;
telos=3*pi;
vima=5*10^(-4);
a=0;
d_pin=1;
d1=1;
for ii=arxi:vima:telos
    x(d_pin)=ii;
    syn(d_pin)=cos(ii);
    mit(d_pin)=sin(ii);
    if d_pin>=2
        if (syn(d_pin)-mit(d_pin)-a>=0)&&(syn(d_pin-1)-mit(d_pin-1)-a<0)||(syn(d_pin)-mit(d_pin)-a<0)&&(syn(d_pin-1)-mit(d_pin-1)-a>=0)
            xLysh(d1)=ii;
            synLysh(d1)=syn(d_pin);
            mitLysh(d1)=mit(d_pin);
            d1=d1+1;
        end
    end
    d_pin=d_pin+1;
end
figure
hold on
plot(x,syn)
plot(x,mit)
plot(xLysh,synLysh,'r*')
plot(xLysh,mitLysh,'co')