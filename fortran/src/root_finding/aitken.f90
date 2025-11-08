module aitken_mod
  implicit none
contains

  function aitken(seq, tol, max_iter) result(x_hat)
    !
    ! Aitken Δ² acceleration
    !
    implicit none
    interface
       function seq(n) result(xn)
         integer, intent(in) :: n
         real(8) :: xn
       end function seq
    end interface

    real(8), intent(in) :: tol
    integer, intent(in) :: max_iter
    real(8) :: x_hat

    real(8) :: x_0, x1, x2, dx, ddx
    integer :: n

    do n = 0, max_iter
       x0 = seq(n)
       x1 = seq(n+1)
       x2 = seq(n+2)

       dx = x1 - x0
       ddx = x2 - 2.0d0*x1 + x1

       if (ddx == 0.0d0) then
          print *, "Aitken error: Δ² term became zero."
          stop
       end if

       x_hat = x0 - dx*dx / ddx

       if (abs(x_hat - x0) < tol) return
    end do

  end function aitken

end module aitken_mod
