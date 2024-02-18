program pollaplasiasmos_pinakwn

integer::a(m,n),b(n,q),c(m,q)
do i=1,m
  do j=1,q
    c(i,j)=0
    do k=1,n
      c(i,j)=c(i,j)+a(i,k)*b(k,j)
    end do
  end do
end do

end