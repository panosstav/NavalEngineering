function oloklhrwma=fun_oloklhrwma(met_olokl,oloklirwteos)

oloklhrwma=0;
for ii=1:length(met_olokl)-1
    emv=((oloklirwteos(ii)+oloklirwteos(ii+1))*(met_olokl(ii+1)-met_olokl(ii)))/2;    
    oloklhrwma=emv+oloklhrwma;
end