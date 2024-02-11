function a=trapezoeidhs_olokl(met_olokl,oloklirwteos)

oloklhrwma=0;
for ii=1:length(oloklirwteos)-1
    emv=abs(((oloklirwteos(ii)+oloklirwteos(ii+1))*(met_olokl(ii+1)-met_olokl(ii)))/2);
    oloklhrwma=oloklhrwma+emv;
end
a=oloklhrwma;
    

