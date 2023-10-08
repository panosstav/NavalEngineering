%Goal: electrical engineering calculations involving a three-phase induction motor

V=400;
Rs=0.3;
Xs=0.4;
Rr=0.15;
Xr=0.4;
Xm=60;
ns=15;

%1st question
for ii=1:1001
    s(ii)=(ii-1)*0.001;
    %s1(ii)=1-s(ii);
end

Tem=(3*Rr./s)/(2*pi*ns).*abs(((V*Xm*j)/(Xm*j+Rs+Xs*j))./((1/(Rs+Xs*j)+1/(Xm*j))^-1+(Rr./s+Xr*j))).^2;

plot(s,Tem);
hold on

k=1.9;
Tpr=k*((1-s)*ns).^2;

plot(s,Tpr);

%2nd question
%Tem=Tpr for s0=0.0127, thus T0=412.2485 [N*m] and n0=14.729 rps=883.74
%[rpm]
%bisection method

%3rd question
s0=0.0127;
V=440;

Zmr=(j*Xm*(j*Xr+Rr/s0))/(j*(Xm+Xr)+Rr);
Is=V/(Rs+j*Xs+Zmr);
S=3*V*conj(Is);

%4th question
Z1=1.6+j*2.7;
Z2=0.1+j*0.4;

a=6000/(sqrt(3)*440);
I1=Is/a;
V2_=V*a;
Z2_=Z2*a^2;
V1=V2_+I1*(Z1+Z2_);

%5th question
Zg=0.2+j*12;
Zc=0.15+j*0.3;

Ig=I1;
Eg=V1+Ig*(Zg+Zc);

%6th question
Vg=Eg-Ig*Zg;
Sg=3*Vg*conj(Ig);