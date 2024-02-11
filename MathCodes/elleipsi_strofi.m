%Statheres
arxi=0;
telos=2*pi;
bima=0.001;
a=2;
b=3;
x0=0;
y0=0;
wmega=pi/3;
%Pinakas strofhs 
strofi=[cos(wmega), -sin(wmega);sin(wmega), cos(wmega)];

deiktis=1;
for ii=arxi:bima:telos
    %Pinakas ston opoio apothhkeuetai to pedio orismou
    thita(deiktis)=ii;
    %Pinakes stous opoious apothhkeuontai oi suntetagmenes ths elleipshs
    x(deiktis)=x0+a*cos(thita(deiktis));
    y(deiktis)=y0+b*sin(thita(deiktis));
    %Oi syntetagmenes gia thn ekastote timh gwnias tou pediou orismou
    %apothhkeuontai se enan pinaka gia na pollaplasiastoun me ton pinaka
    %strofhs kai na ginei h strofh
    simeio=[x(deiktis);y(deiktis)];
    str_simeio=strofi*simeio;
    %Oi estramenes suntetagmenes apothhkeuontai se neous pinakes
   str_simeio_x(deiktis)=str_simeio(1);
   str_simeio_y(deiktis)=str_simeio(2);
    deiktis=deiktis+1;
end

%Ektypwsh ths elleipshs kai ths elleipshs strammenhs kata pi/3
figure
plot(x,y)
hold on
axis equal
plot(str_simeio_x,str_simeio_y,'m')
plot(x0,y0,'*')
plot(0,0,'ro')

