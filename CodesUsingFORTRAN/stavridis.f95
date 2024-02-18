!mathima:Fortran antikeimenostrafis programmatismos  
!hmerominia:13/6/2016
!onoma:Panagiotis Stavridis
!arithmos mhtrwou:nm15069
!onoma arxeiou:stavridis.f95

program stavridis
integer,parameter::n=10
integer::i,ar1,ar2
real::mo,ta
integer,dimension(n)::a
open(unit=11,file='C:\Users\USER\Desktop\stavridis.data.txt')                !anoigei to arxeio kai epeita tha diavasei tis times apo auto
read(11,*)a
close (11)                                                                            !kleinei to arxeio pou anoikse
write(*,*)'File name:stavridis.data'
ar1=stoixeia(a,n)
write(*,*)'Number of valid data:',ar1
ar2=erwtimatika(a,n)
write(*,*)'Number of missing data:',ar2
mo=mesos_oros(a,n)
write(*,*)'Mean value:',mo
ta=tupiki_apoklisi(a,n,mo)
write(*,*)'Standard deviation:',ta
open(unit=10,file='C:\Users\USER\Desktop\results_of_stavridis.data.txt')   !dhmeiourgei ena neo arxeio me ta stoixeia tis eksodou pou ektupwnei to programma
write(10,*)'Number of valid data:',ar1
write(10,*)'Number of missing data:',ar2
write(10,*)'Mean value:',mo
write(10,*)'Standard deviation:',ta
close (10)
end program

!upologismos stoixeiwn arxeiou
function stoixeia(p,k)
integer::i,k
integer,dimension(k)::p
do i=1,k
  if (p(i)/='?') then
    stoixeia=stoixeia+1
  end if
end do
end

!upologismos stoixeiwn pou leipoun
function erwtimatika(p,k)
integer::i,k
integer,dimension(k)::p
do i=1,k
  if (p(i)=='?') then
    erwtimatika=erwtimatika+1
  end if
end do
end

!upologismos mesou orou
function mesos_oros(p,k)
integer::k,i
real::sum
integer,dimension(k)::p
sum=0
do i=1,k
  if (p(i)/='?') then
    sum=sum+p(i)
  end if
end do
mesos_oros=sum/k
end

!upologismos tupikis apoklisis
function tupiki_apoklisi(p,k,mesos_oros)
real::mesos_oros,sum
integer::k,i
integer,dimension(k)::p
sum=0
do i=1,k
  if (p(i)/='?') then
        sum=sum+(p(i)-mesos_oros)**2
  end if
end do
tupiki_apoklisi=sqrt(sum/k)
end