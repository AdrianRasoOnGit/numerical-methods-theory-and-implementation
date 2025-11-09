
def hermite(x_nodes, y_nodes, dy_nodes, x):
    """
    Hermite interpolation.

    Parameters
    ----------
    x_nodes : list[float]
        Interpolation nodes.
    y_nodes : list[float]
        Function values at nodes.
    dy_nodes : list[float]
        First derivatives at nodes.
    x : float
        Evaluation point.

    Returns
    -------
    float
        Approximation P(x).
    """
    n = len(x_nodes)
    if not (n == len(y_nodes) == len(dy_nodes)):
        raise ValueError("All input arrays must have the same length.")

    def L(i, x):
        Li = 1.0
        xi = x_nodes[i]
        for j in range(n):
            if i != j:
                Li *= (x - x_nodes[j]) / (xi - x_nodes[j])
        return Li

    def L_prime_at_node(i):
        xi = x_nodes[i]
        s = 0.0
        for j in range(n):
            if i != j:
                s += 1.0 / (xi - x_nodes[j])
        return s

    total = 0.0

    for i in range(n):
        xi = x_nodes[i]

        Li = L(i, x)
        Lp = L_prime_at_node(i)

        Hi = (1 - 2 * (x - xi) * Lp) * Li**2
        Ki = (x - xi) * Li**2

        total += y_nodes[i] * Hi + dy_nodes[i] * Ki

    return total

if __name__ = "__main__":
    xs = [0, 1]
    ys = [1, 2]
    dys = [0, 1]
    print(hermite(xs, ys, dys, 0.5))
