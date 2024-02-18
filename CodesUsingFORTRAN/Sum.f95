program example
implicit none
integer::i,j,athroisma
i=15
j=23
call prosthesi(i,j,athroisma)
write(*,*) 'to athroisma einai:',athroisma
end

subroutine prosthesi(a,b,sum)
implicit none
integer::a,b,sum
sum=a+b
end