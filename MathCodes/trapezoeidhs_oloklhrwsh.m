function trap=trapezoeidhs_oloklhrwsh(met_olokl,oloklirwteos)

oloklhrwma=0;
for ii=1:length(oloklirwteos)-1
    emv=((oloklirwteos(ii)+oloklirwteos(ii+1))*(met_olokl(ii+1)-met_olokl(11)))/2;
    oloklhrwma=emv+oloklhrwma;
end
trap=emv;