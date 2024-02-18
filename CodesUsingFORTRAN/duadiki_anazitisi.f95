program duadiki_anazitisi

integer,parameter::n=100
integer::first,mid,last,howmany
integer::a(n),x,found

read(*,*)howmany
do i=1,howmany
  read(*,*)a(i) !upothetw oti einai se auksousa seira
end do

read(*,*)x
first=1
last=howmany
found=1
do while ((first<=last).and.(found/=2))
  mid=(first+last)/2
  if (x==a(mid)) then
    found=2
  end if
  if (x<a(mid)) then
    last=mid-1
  else
    first=mid+1
  end if
end do

if (found==2) then
  write(*,*)mid
else
  write(*,*)'not found'
end if

end