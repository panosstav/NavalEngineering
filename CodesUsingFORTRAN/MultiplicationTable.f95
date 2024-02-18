program propedia

implicit none
real::a,b,c,d
integer::i,k

do i=1,10

  k=0
  do while (k<0)
    k=k+1
    a=i*k
    print*, i,'*',k,'*',a
  end do
  
  print*, '=================='
  
end do