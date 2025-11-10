module newton_mod
  implicit none
contains

  function newton_i(x_nodes, y_nodes, x, n) result(p)
    implicit none
    integer, intent(in) :: n
    real(8), intent(in) :: x_nodes(n), y_nodes(n), x
    real(8) :: p
    real(8) :: coef(n)
    integer :: i, j

    coef = y_nodes

    do j = 2, n
       do i = n, j, -1
          coef(i) = (coef(i) - coef(i-1)) / (x_nodes(i) - x_nodes(i-j+1))
       end do
    end do

    p = coef(n)
    do i = n-1, 1, -1
       p = p * (x - x_nodes(i)) + coef(i)
    end do

  end function newton_i

end module newton_mod
