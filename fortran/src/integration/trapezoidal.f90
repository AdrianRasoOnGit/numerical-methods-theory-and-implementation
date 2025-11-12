module trapezoidal_mod
  implicit none
contains

  function trapezoidal(f, a, b, n) result(integral)
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
    real(8) :: h, total
    integer :: i

    if (n <= 0) then
       print *, "n must be positive."
       stop
    end if

    h = (b - a) / real(n, 8)
    total = 0.5_8 * (f(a) + f(b))

    do i = 1, n - 1
       total = total + f(a + real(i, 8) * h)
    end do

    integral = total * h

  end function trapezoidal

end module trapezoidal_mod
