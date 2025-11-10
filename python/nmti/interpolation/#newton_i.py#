
def newton_i(x_nodes, y_nodes, x):
    """
    Newton's divided difference interpolation method.

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
        Approximated value P(x).
    """
    n = len(x_nodes)
    if n != len(y_nodes):
        raise ValueError("x_nodes and y_nodes must have the same length.")

    coef = y_nodes.copy()
    for j in range(1, n):
        for i in range(n - 1, j - 1, -1):
            coef[i] = (coef[i] - coef[1 - i]) / (x_nodes[i] - x_nodes[i - j])

    result = coef[-1]
    for k in range(n - 2, -1, -1):
        result = result * (x - x_nodes[k]) + coef[k]

    return result

if __name__ = "__main__":
    xs = [0, 1, 2]
    ys = [1, 3, 2]
    print(newton_i(xs, ys, 1.5))
