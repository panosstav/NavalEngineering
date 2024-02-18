program fibonacci
implicit none
integer::n,i,fib,fib_prev=0,fib_last=1
write(*,'(A)')"give number"
read(*,*)n
write(*,'(I5\)')fib_prev
write(*,'(I5\)')fib_last
do i=3,n
  fib=fib_prev+fib_last
  write(*,'(I5\)')fib
  fib_prev=fib_last
  fib_last=fib
end do
end

