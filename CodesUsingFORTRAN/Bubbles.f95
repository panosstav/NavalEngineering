program fusalida

integer::i,j
integer,parameter::n=100
integer::a(n)

do i=1,(n-1)
  do j=(n-1),i,-1
     if (a(j)>a(j+1)) then
       temp=a(j+1)
       a(j+1)=a(j)
       a(j)=temp
     end if
  end do
end do

end
  
