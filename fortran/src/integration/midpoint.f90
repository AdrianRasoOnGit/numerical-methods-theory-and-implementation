module midpoint_mod
  implicit none
contains

  function midpoint(f, a, b, n) result(integral)
    implicit none
    interface
       function f(x) result(val)
         implicit none
         real(8), intent(in) :: x
         real(8) :: val
       end function f
    end interface

    real(8), intent(in) :: a, b
    integer, intent(in) :: n
    real(8) :: integral
    real(8) :: h, total, mid
    integer :: i

    if (n <= 0) then
       print *, "n must be positive."
       stop
    end if

    h = (b - a) / real(n, 8)
    total = 0.0_8

    do i = 0, n - 1
       mid = a + (real(i, 8) + 0.5_8) * h
       total = total + f(mid)
    end do

    integral = total * h

  end function midpoint

end module midpoint_mod
