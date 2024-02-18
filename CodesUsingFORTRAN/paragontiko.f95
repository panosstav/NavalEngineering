program paragontiko
implicit none
integer::n,i,res
result=1
write(*,*)'give number'
read(*,*)n
do i=1,n
  res=res*i
end do
write(*,*)res
end