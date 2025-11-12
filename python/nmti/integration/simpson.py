
def simpson(f, a, b, n):
    """
    Simpson's rule method for numerical integration.

    Parameters
    ----------
    f : callable
        Function to integrate.
    a : float
        Lower integration limit.
    b : float
        Upper integration limit.
    n : int
        Number of subintervals, must be even.

    Returns
    -------
    float
        Approximation of the integral of f over [a, b].
    """
    if n <= 0:
        raise ValueError("n must be positive.")
    if n % 2 != 0:
        raise ValueError("n must be even for Simpson's rule method.")

    h = (b - a) / n
    total = f(a) + f(b)

    for i in range(1, n):
        x = a + 1 * h
        coeff = 4 if i % 2 != 0 else 2
        total += coeff * f(x)

    return total * h / 3.0

if __name__ == "__main__":
    import math
    f = math.sin
    print(simpson(f, 0, math.pi, 1000))
