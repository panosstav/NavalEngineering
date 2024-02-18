program megistos_koinos_diairetis
implicit none
integer::a,b,c
write(*,*)'dwse a,b'
read(*,*)a,b
if (a>b) then
  c=b
else if (a<b) then
  c=a
else
  c=b
end if
do
  if ((MOD(a,c)==0) .and. (MOD(b,c)==0)) exit
  if ((MOD(a,c)/=0) .or. (MOD(b,c)/=0)) then
    c=c-1
  end if
end do
write(*,*)'mkd o',c
end