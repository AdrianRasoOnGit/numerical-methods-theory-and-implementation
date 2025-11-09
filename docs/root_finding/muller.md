# Müller's method

The Müller method is an algorithm for finding roots that is based on a strategy we have already seen: the secant method. While the secant method replaces the line that interpolates two points, here we replace that line with a parabola that interpolates three. The immediate consequence is simple: the Müller method tends to converge faster than the secant method, and moreover, like Newton's method, under ideal conditions it exhibits quadratic convergence.

An even more relevant property of this method is that it does not confine us to the real plane. The Müller method can be effectively applied to complex-valued iterates, making it the go-to technique for problems involving complex values in root-finding algorithms.

One way to interpret this, in order to structure our understanding of numerical methods as a whole, is that the Müller method is a natural progression from the secant method, though still not quite reaching Newton’s method. Compared to the secant method, which performs a first-degree approximation to a function, the Müller method uses a second-degree approximation (this needs to be clarified). However, it allows us to take this step forward relative to the secant method without using derivatives, which relaxes the conditions we must impose on the problem.

## Conditions

In order to apply Müller's method, we want from the problem:

- C1: Three initial approximations $x_0$, $x_1$, and $x_2$ sufficiently close to the root.
- C2: The function $f$ must be evaluable at these points, and the quadratic interpolation defined by them must be well-posed.
- C3: The denominator in the update formula must not vanish, ensuring a meaningful next iterate.

Unlike what we saw with Aitken's acceleration, which assumes convergence in the sequence, in the Müller method we directly produce the sequence by means of a quadratic interpolant. The reliance on three points does not impose a convergence requirement beforehand, but it does make initialization important for stability reasons.

## Algorithm

Given three distinct points $x_0$, $x_1$, and $x_2$, we build the unique quadratic polynomial interpolating the pairs $(x_i, f(x_i))$. Let the successive finite differences be defined as

```math
d_0 = f(x_0), \qquad d_1 = \frac{f(x_1) - f(x_0)}{x_1 - x_0}, \qquad d_2 = \fract{\left(\frac{f(x_2) - f(x_1)}{x_2 - x_1}\right)
```

The coefficients correspond to the terms of the quadratic interpolant, written in Newton form. The next approximation $x_3$ is obtained from the roots of the quadratic polynomial. If we define

```math
b = d_1 + (x_2 - x_1) d_2, \qquad a = d_2, \qquad c = f(x_2),
```

and the update is

```math
x_3 = x_2 - \frac{2c}{b \pm \sqrt{b^2 - 4ac}},
```

where the sign we find in the denominator is selected to maximize its absolute value, improving numerical stability and dodge cancellation.

Once the value $x_3$, the tiple $(x_1, x_2, x_3)$ can replace $(x_0, x_1, x_2)$, and so on. Iterations will continue until the method meets with the tolerance, such as

```math
|x_{n+1} - x_n| < \epsilon.
```

When the tolerance is met, we adopt $x_{n+1}$ as the approximate root.
