program megistos_koinos_diairetis_5
implicit none
integer::a,b,t
write(*,*)'dwse 2 thetikous'
read(*,*)a,b
do
  t=MOD(a,b)
  if (t==0) exit
  if (t/=0) then
    a=b
    b=t
  end if
end do
write(*,*)'mkd o',b
end