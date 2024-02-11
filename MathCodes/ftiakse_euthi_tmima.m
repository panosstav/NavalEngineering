function [x_euth,y_euth]=ftiakse_euthi_tmima(xa,ya,xb,yb)
%arxi A(xa,ya),peras B(xb,yb)

lamda=[0:10^(-4):1];
x_euth=xa+lamda*(xb-xa);
y_euth=ya+lamda*(yb-ya);

plot(x_euth,y_euth)
hold on