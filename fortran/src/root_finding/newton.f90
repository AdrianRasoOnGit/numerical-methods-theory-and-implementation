module newton_mod
  implicit none
contains

  function newton(f, df, x0, tol, max_iter, iterations) result(root)
    !
    ! Newton's method for root finding.
    !
    interface
       real(kind=8) function f(x)
         real(kind=8), intent(in) :: x
       end function f

       real(kind=8) function df(x)
         real(kind=8), intent(in) :: x
       end function df
    end interface

    real(kind=8), intent(in) :: x0, tol
    integer, intent(in) :: max_iter
    integer, intent(out) :: iterations
    real(kind=8) :: root, x, x_new, fx, dfx

    x = x0

    do iterations = 1, max_iter
       fx = f(x)
       dfx = df(x)

       if (dfx == 0.0d0) then
          print *, "Derivative is zero, Newton method will fail."
          stop
       end if

       x_new = x - fx / dfx

       if (abs(x_new - x) < tol) then
          root = x_new
          return
       end if

       x = x_new
    end do

    print *, "Newton did not converge with max_iter."
    stop

  end function newton


end module newton_mod
