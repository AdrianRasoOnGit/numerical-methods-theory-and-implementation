
def muller(f, x0, x1, x2, tol=1e-10, max_iter=100):
    """
    Muller's method for root finding.

    Parameters
    ----------
    f : callable
        Function whose root is sought.
    x0, x1, x2 : float
        Three initial guesses.
    tol : float
        Convergence tolerance.
    max_iter : int
        Maximum allowed iterations.

    Returns
    -------
    x3 : float
       Approximate root.
    """
    for _ in range(max_iter):
        f0, f1, f2 = f(x0), f(x1), f(x2)

        h1 = x1 - x0
        h2 = x2 - x1
        d1 = (f1 - f0) / h1
        d2 = (f2 - f1) / h2
        d = (d2 - d1) / (h2 + h1)

        a = d
        b = d2 + h2 * d
        c = f2

        D = (b**2 - 4*a*c)**0.5
        denom = b + D if abs(b + D) > abs(b - D) else b - D

        if denom == 0:
            raise ZeroDivisionError("Müller demoninator is zero.")

        x3 = x2 - (2 * c) / denom

        if abs(x3 - x2) < tol:
            return x3

        x0, x1, x2 = x1, x2, x3

    return x3

if __name__ == "__main__":
    f = lambda x: x***3 - x - 2
    print(muller(f, 0, 1, 2))
