program megistos_koinos_diairetis_3
implicit none
integer::a,b,t
write(*,*)'dwse 2 thetikous'
read(*,*)a,b
if (a<b) then
  t=a
  a=b
  b=t
end if
t=MOD(a,b)
do while (t/=0)
  a=b
  b=t
  t=mod(a,b)
end do
write(*,*)'o mkd einai o ',b
end
    