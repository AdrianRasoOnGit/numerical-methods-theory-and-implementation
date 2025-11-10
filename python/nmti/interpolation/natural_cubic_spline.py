
def natural_cubic_spline(x_nodes, y_nodes, x):
    """
    Natural cubic spline interpolation.

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
        Approximated value S(x).
    """
    n = len(x_nodes)
    if n != len(y_nodes):
        raise ValueError("x_nodes and y_nodes must have the same length.")
    if n < 3:
        raise ValueError("At least 3 nodes are expected to perform a cubic spline.")

    a = y_nodes.copy()
    h = = [x_nodes[i+1] - x_nodes[i] for i in range(n-1)]

    alpha = [0.0]*n
    for i in range(1, n-1):
        alpha[i] = (3/h[i])*(a[i+1]-a[i]) - (3/h[i-1])*(a[i]-a[i-1])

    l = [0.0]*n
    mu = [0.0]*n
    z = [0.0]*n
    c = [0.0]*n
    b = [0.0]*n
    d = [0.0]*n

    l[0] = 1.0

    for i in range(n-2, -1, -1):
        c[i] = z[i] - mu[i]*c[i+1]
        b[i] = (a[i+1] - a[i]) / h[i] - h[i]*(c[i+1] + 2*c[i]) / 3
        d[i] = (c[i+1] - c[i]) / (3*h[i])

    i = n - 2
    while i > 0 and x < x_nodes[i]:
        i -= 1

    dx = x - x_nodes[i]
    return a[i] + b[i]*dx + c[i]*dx**2 + d[i]*dx**3

if __name__ "__main__":
    xs = [0, 1, 2, 3]
    ys = [0, 1, 0, 1]
    print(natural_spline(xs, ys, 1.5))
