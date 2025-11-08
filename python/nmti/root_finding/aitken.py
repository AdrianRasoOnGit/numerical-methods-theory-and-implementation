
def aitken(acc_sequence, tol=1e-10, max_iter=100):
    """
    Aitken Δ² acceleration method.

    Parameters
    ----------
    acc_sequence : callable
        Function generating the sequence x_n.
    tol : float
        Convergence tolernace.
    max_iter : int
        Maximum number of accelerations.

    Returns
    -------
    x_hat : float
        Accelerated limit approximation.
    """

    for n in range(max_iter):
        x0 = acc_sequence(n)
        x1 = acc_sequence(n + 1)
        x2 = acc_sequence(n + 2)

        dx = x1 - x0
        ddx = x2 - 2 * x1 + x0

        if ddx == 0:
            raise ZeroDivisionError("Δ² term became zero in Aitken method.")

        x_hat = x0 - dx * dx / ddx

        if abs(x_hat - x0) < tol:
            return x_hat

    return x_hat

if __name__ == "__main__":
    import math

    def fp(n):
        x = 0.5
        for _ in range(n):
            x = math.cos(x)
        return x

    print(aitken(fp))
