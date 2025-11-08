

def secant(f, x0, x1, tol=1e-8, max_iter=100):
    """
    Secant method for root finding.

    Parameters
    ----------
    f : callable
        The function whose root is sought.
    x0 : float
        First initial guess.
    x1 : float
        Second initial guess.
    tol : float, optional
        Convergence tolerance.
    max_iter : int, optional
        Maximum number of iterations.

    Returns
    -------
    x : float
        Approximate root of the function
    """
    for _ in range(max_iter):
        fx0 = f(x0)
        fx1 = f(x1)

        if fx1 == fx0:
            raise ZeroDivisionError("Denominator in secant method became zero.")

        x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0)

        if abs(x2 - x1) < tol:
            return x2

        x0, x1 = x1, x2

    return x1
