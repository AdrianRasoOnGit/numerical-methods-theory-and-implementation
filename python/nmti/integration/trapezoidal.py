
def trapezoidal(f, a, b, n):
    """
    Trapezoidal rule method.

    Parameters
    ----------
    f : callable
        Function to integrate.
    a : float
        Lower integration limit.
    b : float
        Upper integration limit.
    n : int
        Number of subintervals

    Returns
    -------
    float
        Approximation of the integral of f over [a, b].
    """
    if n <= 0:
        raise ValueError("Number of subintervals n must be positive.")

    h = (b - a) / n
    s = 0.5 * (f(a) + f(b))

    for i in range(1, n):
        s += f(a + i * h)

    return h * s

if __name__ == "__main__":
    import math
    f = math.sin
    print(trapezoidal(f, 0, math.pi, 1000))
