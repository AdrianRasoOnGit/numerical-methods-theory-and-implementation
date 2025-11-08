

def bisection(f, a, b, tol=1e-8, max_iter=100):
    """
    Bisection method for root finding.

    Parameters
    ----------
    f : callable
        The function whose root is sought.
    a : float
        Left endpoint of the inverval.
    b : float
        Right endpoint of the interval.
    tol : float, optional
        Tolerance of the convergence.
    max_iter : int, optional
        Maximum number of iterations.

    Returns
    -------
    c : float
        The approximate root of the function.
    """
    if f(a) * f(b) >= 0:
        raise ValueError("f(a) and f(b) must have opposite signs.")

    for _ in range(max_iter):
        c = (a + b) / 2
        if abs(f(c)) < tol or (b - a) / 2 < tol:
            return c

        if f(a) * f(c) < 0:
            b = c
        else:
            a = c

    return c

if __name__ == "__main__":
    f = lambda x: x**2 - 2
    root = bisection(f, 0, 2)
    print(f"Approximate root of x**2 - 2: {root}")
