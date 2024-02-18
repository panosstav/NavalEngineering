PROGRAM square_root_example

IMPLICIT NONE
REAL :: x,y
INTRINSIC SQRT

WRITE (*,*) 'Give a number for x:'
READ (*,*) x

y=x**2+1

WRITE (*,*) 'Give value for x:'
WRITE (*,*) 'Computed value of x**2+1:',y

WRITE (*,*) 'Computed value of SQRT(x**2+1):',SQRT(y)

END PROGRAM square_root_example