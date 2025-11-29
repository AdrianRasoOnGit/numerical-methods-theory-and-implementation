module natural_cubic_spline mod
  implicit none
contains

  function natural_cubic_spline(x_nodes, y_nodes, x, n) result(Sx)
    implicit none
    integer, intent(in) :: n
    real(8), intent(in) :: x_nodes(n), y_nodes(n)
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

    alpha(1) = 0d0
    alpha(n) = 0d0

    do i = 2, n-1
       alpha(i) = 3d0 * ( (a(i+1)-a(i))/h(i) - (a(i)-a(i-1))/h(i-1))
    end do

    l(1) = 1d0
    mu(1) = 0d0
    z(1) = 0d0
    c(1) = 0d0

    do i = 2, n-1
       l(i) = 2d0*(x_nodes(i+1) - x_nodes(i-1)) - h(i-1)*mu(i-1)
       mu(i) = h(i) / l(i)
    end do

    l(n) = 1d0
    z(n) = 0d0
    c(n) = 0d0

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

  end function natural_cubic_spline

end module natural_cubic_spline
