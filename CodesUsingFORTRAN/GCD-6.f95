program megistos_koinos_diairetis_6
implicit none
integer::a,b,i,j
write(*,'(a)') "Give number a"
read(*,*) a
write(*,'(a)') "Give number b"
read(*,*) b
i=a
j=b
do while ((i>0).and.(j>0))
  if (i>j) then
    i=mod(i,j)
  else
    j=mod(j,i)
  end if
end do
write (*,'(I10)') i+j
end