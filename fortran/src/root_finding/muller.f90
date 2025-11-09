module muller_mod
  implicit none
contains

  function muller(f, x0, x1, x2, tol, max_iter) result(root)
    implicit none
    interface
       function f(x)
         real(8) :: f
         real(8), intent(in) :: x
       end function f
    end interface

    real(8), intent(in) :: x0, x1, x2
    real(8), intent(in) :: tol
    integer, intent(in) :: max_iter
    real(8) :: root

    real(8) :: xx0, xx1, xx2
    real(8) :: f0, f1, f2
    real(8) :: h1, h2, d1, d2, d
    real(8) :: a, b, c, D, denom, x3
    integer :: n

    xx0 = x0
    xx1 = x1
    xx2 = x2

    do n = 1, max_iter
       f0 = f(xx0)
       f1 = f(xx1)
       f2 = f(xx2)

       h1 = xx1 - xx0
       h2 = xx2 - xx1
       d1 = (f1 - f0) / h1
       d2 = (f2 - f1) / h2
       d = (d2 - d1) / (h2 + h1)

       a = d
       b = d2 + h2*d
       c = f2

       D = sqrt(b*b - 4d*c)

       if (abs(b + D) > abs(b - D)) then
          denom = b + D
       else
          denom = b - D
       end if

       if (denom == 0d0) then
          print *, "Müller denominator zero."
          root = xx2
          return
       end if

       x3 = xx2 - (2d0 * c) / denom

       if (abs(x3 - xx2) < tol) then
          root = x3
          return
       end if

       xx0 = xx1
       xx1 = xx2
       xx2 = x3
    end do

    root = xx2
  end function muller

end module muller_mod
