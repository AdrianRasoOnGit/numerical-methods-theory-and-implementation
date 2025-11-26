module clamped_cubic_spline_mode
  implicit none
contains

  function clamped_cubic_spline(x_nodes, y_nodes, dy0, dyn, x, n) result(Sx)
    implicit none
    integer, intent(in) :: n
    real(8), intent(in) :: x_nodes(n), y_nodes(n)
    real(8), intent(in) :: dy0, dyn
    real(8), intent(in) :: x
    real(8) :: Sx

    real(8) :: a(n), b(n), c(n), d(n)
    real(8) :: h(n-1), alpha(n), l(n), mu(n), z(n)
    integer :: i
    real(8) :: dx

    a = y_nodes

    do i = 1, n-1
       h(i) = x_nodes(i+1) - x_nodes(i)
    end do

    alpha(1) = 3d0*((a(2)-a(1))/h(1) - dy0)
    alpha(n) = 3d0*(dyn - (a(n)-a(n-1))/h(n-1))

    do i = 2, n-1
       alpha(i) = 3d0*((a(i+1)-a(i))/h(i) - (a(i)-a(i-1))/h(i-1))
    end do

    l(n) = h(n-1)*(2d0 - mu(n-1))
    z(n) = (alpha(n) - h(n-1)*z(n-1)) / l(n)
    c(n) = z(n)

    do i = n-1, 1, -1
       c(i) = z(i) - mu(i)*c(i+1)
    end do

    do i = 1, n-1
       b(i) = (a(i+1)-a(i))/h(i) - h(i)*(2d0*c(i) + c(i+1))/3d0
       d(i) = (c(i+1) - c(i)) / (3d0*h(i))
    end do

    i = n-1
    do while (i > 1 .and. x < x_nodes(i))
       i = i - 1
    end do

    dx = x - x_nodes(i)

    Sx = a(i) + b(i)*dx + c(i)*dx*dx + d(i)*dx*dx*dx

  end function clamped_cubic_spline

end module clamped_cubic_spline_mode    
