
def lagrande(x_nodes, y_nodes, x):
    """
    Lagrange polynomial interpolation.

    Parameters
    ----------
    x_nodes : list[float]
        Interpolation nodes.
    y_nodes : list[float]
        Function values at the nodes.
    x : float
        Evaluation point.

    Returns
    -------
    float
        Approximated value p(x).
    """
    n = len(x_nodes)
    if n != len(y_nodes):
        raise ValueError("x_nodes and y_nodes must have the same lenght.")

    total = 0.0

    for i in range(n):
        xi, yi = x_nodes[i], y_nodes[i]

        Li = 1.0
        for j in range(n):
            if i != j:
                Li *= (x - x_nodes[j]) / (xi - x_nodes[j])

        total += yi * Li

    return total

if __name__ = "__main__":
    xs = [0, 1, 2]
    ys = [1, 3, 2]
    print(lagrange(xs, ys, 1.5))
