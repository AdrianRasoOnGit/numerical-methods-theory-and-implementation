
module hermite_mod
  implicit none
contains

  function hermite(x_nodes, y_nodes, dy_nodes, x, n) result(p)
    implicit none
    integer, intent(in) :: n
    real(8) :: p
    real(8) :: Li, Lp, Hi, Ki
    real(8) :: xi
    integer :: i, j

    p = 0d0

    do i = 1, n
       xi = x_nodes(i)

       Li = 1d0
       do j = 1, n
          if (j /= i) then
             Li = Li * (x - x_nodes(j)) / (xi - x_nodes(j))
          end if
       end do

       Lp = 0d0
       do j = 1, n
          if (j /= i) then
             Lp = Lp + 1d0 / (xi - x_nodes(j))
          end if
       end do

       Hi = (1d0 - 2d0 * (x - xi) * Lp) * Li * Li
       Ki = (x - xi) * Li * Li

       p = p + y_nodes(i) * Hi + dy_nodes(i) * Ki
    end do

  end function hermite

end module hermite_mod
