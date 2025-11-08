

def newton(f, df, x0, tol=1e-10, max_iter=100):
    """
    Newton's method for root finding.

    Parameters
    ----------
    f : callable
        Function whose root is sought.
    df : callable
        Derivative of f.
    x0 : float
        Initial guess.
    tol : float, optional
        Convergence tolerance.
    max_iter : int, optional
        Maximum number of iterations.

    Returns
    -------
    x : float
        Estimated root.
    n_iter : int
        Number of iterations performed.
    """
    x = x0
    for i in range(max_iter):
        fx = f(x)
        dfx = df(x)
        if dfx == 0:
            raise ZeroDivisionError("Derivative is zero, Newton method will fail.")
        x_new = x - fx / dfx
        if abs(x_new - x) < tol:
            return x_new, i + 1
        x = x_new

    raise RuntimeError("Newton method did not converge with max_iter.")
