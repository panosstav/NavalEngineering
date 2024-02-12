function [x,y]=sunarthsh_euthgrammou(xa,ya,ux,uy,vima,arxi,telos)

lamda=[arxi:vima:telos];
d=sqrt(ux^2+uy^2);
uxMon=ux/d;
uyMon=uy/d;

x=xa+lamda*uxMon;
y=ya+lamda*uyMon;

hold on
plot(x,y)