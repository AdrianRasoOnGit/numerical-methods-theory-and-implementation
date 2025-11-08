# Secant method

The secant method is a numerical technique for approximating a root of an equation

$$
f(x) = 0,
$$

similar to Newton's method, but avoiding to compute derivatives. Here, of course, we are not concerned with tangents, but with secants. To be precise, the secant line through two points. In root-finding methods, there is a progressive line in efficiency with regard to the kind of line we are using: first, in the bisection method, we found a baseline technique, simple yet rudimentary. With the secant, we are halfway, since this method already attempts to *approximate* the derivative of the function by using two evaluations of \(f\) at distinct points. Beyond this sits Newton's method, which goes one step further by using the exact derivative.

The secant method hence sits in the intermediate position. With respect to the bisection method, we are getting too a less robust technique, since the secant method can find a hard time in some problems, failing to converge if the initial values are poorly chosen. Yet, as we are in the middle of the way, we are improving speed, while still dealing with a straightforward approach.

## Conditions

To apply the secant method, we need yo satisfy:

- C1: a function $f$ assumed to be continuous at least near the root of interest.
- C2: two distinct initial values $x_0$ and $x_1$, such that $f(x_0) \neq f(x_1)$, in order to avoid division by zero.

We have no real theoretical guarantees on a root lying between $x_0$ and $x_1$, but if we choose them near the true root, we increase significantly the likelihood of convergence.

## Algorithm

Given $x_0$ and $x_1$, the secant method draws a line through the points $(x_0, f(x_0)$ and $(x_1, f(x_1))$. The intersection of this secant line with the $x$-axis becomes the next approximation, denoted $x_2$. Algebraically, this implies the following formula:

$$
x_{n+1} = x_n - f(x_n), \frac{x_n - x{n-1}}{f(x_n) - f(x_{n-1})}.
$$

Once this new approximation is computed, we update the method:

$$
x_{n-1} \leftarrow x_n, \quad n_n \leftarrow x_{n+1},
$$

and we repeat the formula until we meet the tolerance $\epsilon$. Formally, we stop when

$$
|x_n - x_{n-1}| < \epsilon.
$$

Given that stop, we regard $x_n$ as the approximate root.

## Practical example

Let's recycle the function from the [bisecion method section](bisection.md), that is,

$$
f(x) = x^3 - x - 2,
$$

whose root we previously estimated. To start applying the secant method, we choose two first values. For instance, consider

$$
x_0 = 1,\quad x_1 = 2.
$$

We compute the next approximation using the secant formula.

```math
x_2 = 2 - 4\,\frac{2 - 1}{4 - (-2)}
    = 2 - \frac{4}{6}
    = 1.\overline{3}.
```

If we repeat this iteratively, the sequence ${x_n}$ converges toward the solution. Let's assume a tolerance of

$$
\epsilon = 10^{-3},
$$

and use one of the implementations of this repo, for example, the Python one. We will find that 

$$
x \approx 1.5214,
$$

which is the value we already knew from the bisection method. Compared to the biection, which guarantees convergence, but usually requires more iterations, the secant method converges faster. In any case, it is less stable, and as we noted before, it can fail to converge. 
