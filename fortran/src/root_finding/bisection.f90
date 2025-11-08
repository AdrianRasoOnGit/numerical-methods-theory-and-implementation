module bisection_mod
contains

  function bisection(f, a, b, tol, max_iter) result(root)
    implicit none
    interface
       function f(x)
         real(kind=8) :: f
         real(kind=8), intent(in) :: x
       end function f
    end interface

    real(kind=8), intent(in) :: a, b, tol
    integer, intent(in) :: max_iter
    real(kind=8) :: root, fa, fb, c, fc, left, right
    integer :: i

    left = a
    right = b

    
    fa = f(left)
    fb = f(right)
    
    if (fa * fb >= 0.0) stop "Signs of f(a) and f(b) must differ."

    do i = 1, max_iter
       c = 0.5 * (left + right)
       fc = f(c)

       if (abs(fc) < tol .or. abs(right - left) < tol) then
          root = c
          return
       end if

       if (fa * fc < 0.0) then
          right = c
          fb = fc
       else
          left = c
          fa = fc
       end if
       
    end do

    root = c
  end function bisection

end module bisection_mod       
