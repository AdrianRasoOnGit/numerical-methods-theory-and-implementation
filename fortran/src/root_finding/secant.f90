module secant_mod
contains

  function secant(f, x0, x1, tol, max_iter) result(root)
    implicit none
    interface
       function f(x)
         real :: f
         real, intent(in) :: x
       end function f
    end interface

    real, intent(in) :: x0, x1, tol
    integer, intent(in) :: max_iter
    real :: fx0, fx1, x2, root
    real :: a, b
    integer :: i

    a = x0
    b = x1
    
    do i = 1, max_iter
       fx0 = f(a)
       fx1 = f(b)

       if (fx1 == fx0) stop "Secant denominator is zero."

       x2 = x1 - fx1 * (b - a) / (fx1 - fx0)

       if (abs(x2 - x1) < tol) then
          root = x2
          return
       end if

       a = b
       b = x2
    end do

    root = b
  end function secant
  end module secant_mod
