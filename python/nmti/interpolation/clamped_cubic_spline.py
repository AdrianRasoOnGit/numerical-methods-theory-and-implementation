
def clamped_cubic_spline(x_nodes, y_nodes, dy0, dyn, x):
    """
    Clamped cubic spline interpolation.

    Parameters
    ----------
    x_nodes : list[float]
        Interpolation nodes.
    y_nodes : list[float]
        Function values at nodes.
    dy0 : float
        Derivative at the left endpoint.
    dyn : float
        Derivative at the right endpoint.
    x : float
        Evaluation point.

    Returns
    -------
    float
        Approximation S(x).
    """
    n = len(x_nodes)
    if n != len(y_nodes):
        raise ValueError("x_nodes and y_nodes must have the same length")

    a = y_nodes.copy()
    h = [x_nodes[i+1] - x_nodes[i] for i in range(n-1)]

    alpha = [0.0]*n
    alpha[0] = 3*(a[1] - a[0]) / h[0] - 3*dy0
    alpha[-1] = 3*dyn - 3*(a[-1] - a[-2]) / h[-1]

    for i in range(1, n-1):
        alpha[i] = (3/h[i])*(a[i+1] - a[i]) - (3/h[i-1])*(a[i] - a[i-1])

    l = [0.0]*n
    mu = [0.0]*n
    z = [0.0]*n
    c = [0.0]*n
    b = [0.0]*n
    d = [0.0]*n

    l[0] = 2*h[0]
    mu[0] = 0.5
    z[0] = alpha[0] / l[0]

    for i in range(1, n-1):
        l[i] = 2*(x_nodes[i+1] - x_nodes[i-1]) - h[i-1]*mu[i-1]
        mu[i] = h[i] / l[i]
        z[i] = (alpha[i] - h[i-1] * z[i-1]) / l[i]
        
    l[-1] = h[-1] * (2 - mu[-2])
    z[-1] = (alpha[-1] - h[-1] * z[-2]) / l[-1]
    c[-1] = z[-1]

    for i in range(n-2, -1, -1):
        c[i] = z[i] - mu[i]*c[i+1]
        b[i] = (a[i+1]-a[i])/h[i] - h[i]*(c[i+1] + 2*c[i]) / 3
        d[i] = (c[i+1] - c[i]) / (3*h[i])

    i = n - 2
    while i > 0 and x < x_nodes[i]:
        i -= 1

    dx = x - x_nodes[i]
    return a[i] + b[i]*dx + c[i]*dx**2 + d[i]*dx**3

if __name__ == "__main__":
    xs = [0, 1, 2]
    ys = [1, 3, 2]
    print(clamped_cubic_spline(xs, ys, dy0=0, dyn=0, x=1.5))
