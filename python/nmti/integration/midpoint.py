
def midpoint(f, a, b, n):
    """
    Midpoint rule method.

    Parameters
    ----------
    f : callable
        Function to integrate.
    a : float
        Left endpoint of the interval.
    b : float
        Right endpoint of the interval.
    n : int
        Number of subintervals.

    Returns
    -------
    float
        Approximation of the integral of f over [a, b].
    """
    if n <= 0:
        raise ValueError("n must be a positive.")

    h = (b - a) / n
    total = 0.0

    for i in range(n):
        mid = a + (i + 0.5) * h
        total += f(mid)

    return total * h

if __name__ == "__main__":
    f = lambda x: x**2
    print(midpoint(f, 0, 1, 10))
