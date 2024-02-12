function [euth_x,euth_y]=euthigrammo_tmhma_synartisi(xA,yA,ux,uy,bhma,arxi,telos)

lamda=[arxi:bhma:telos];

uxmon=ux/sqrt(ux^2+uy^2);
uymon=uy/sqrt(ux^2+uy^2);

euth_x=xA+lamda*uxmon;
euth_y=yA+lamda*uymon;
