module simpson_mod
  implicit none
contains

  function simpson(f, a, b, n) result(I)
    implicit none

    interface
       function f(x) result(y)
         real(kind=8), intent(in) :: x
         real(kind=8) :: y
       end function f
    end interface

    real(kind=8), intent(in) :: a, b
    integer, intent(in) :: n
    real(kind=8) :: I, h, x
    integer :: i

    if (mod(n, 2) /= 0) then
       print *, "Error: n must be even for Simpson's rule"
       stop
    endif

    h = (b - a) / real(n, 8)
    I = f(a) + f(b)

    do i = 1, n - 1
       x = a + i * h
       if (mod(i, 2) == 0) then
          I = I + 2.0d0 * f(x)
       else
          I = I + 4.0d0 * f(x)
       endif

    end do

    I = I * h / 3.0d0
  end function simpson

end module simpson_mod
