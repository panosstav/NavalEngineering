program disekto_etos

implicit none
integer::year

write(*,*)'dwse etos'
read(*,*)year

if ((MOD(year,4)==0) .AND. (MOD(year,100)/=0) .OR. (MOD(year,400)==0) .AND. (MOD(year,4000)/=0)) then
  write(*,*) 'disekto etos'
end if

end