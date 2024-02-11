function sum1=our_oloklhrwma(x,y)

sum1=0;
for kk=2:1:size(x,2)
    emv=((y(kk)+y(kk-1))*(x(kk)-x(kk-1)))/2;
    sum1=sum1+emv;
end



