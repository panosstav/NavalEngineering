program yes_no
implicit none
character::ans
ans='yes'
do while (ans=='yes')
  read(*,*)n
  write(*,*)n**2
  write(*,*)'continue?yes or no?'
  read(*,*) ans
end do