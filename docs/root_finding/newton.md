# Newton's method

Newton's method, or Newton-Raphson method, is an extremelly popular and useful technique for solving equations of the form

```math
f(x) = 0.
```

If we compare it to the bisection and secant methods, Newton's is one stage forward in efficiency: instead of using midpoints (bisection), or secant lines (secant), the technique we present here relies on the tangent line at a single point. By using the derivative of the function, Newton's method reaches notably rapid rates of convergence, often quadratic, provided initial guess is spot on. In any case, this quadratic pace will have really interesting consequences in what we will call later the Atkin's method.

Newton's method is fast, and it's elegant too, and thus has become one of the most widely used tools in numerical methods. However, and as we discussed in [the secant method section](secant.md), the method is delicate as well, since if we provide poor first guesses, or the functions bear problematic derivatives, divergence can emerge, or get unexpected behavior.

## Conditions

In order to apply Newton's method effectively, we require:

- C1: the function $f$ is differentiable on an interval containing the root.
- C2: the derivative $f'(x)$ does not vanish near the root.
- C3: an initial guess $x_0$, ideally chosen close to the actual root.

Here again the method does not consist on finding sign changes, neither on intervals, but on choosing a good initial value. This is key, since if we miss, divergence is very likely, and if we succeed, the converge gets extremely fast.

## Algorithm
 
Given an initial guess $x_0$, Newton's method builds a sequence using the tangent line at the current point. The tangent line at $(x_n, f(x_n))$ intersects the $x$-axis at a point $x_{n+1}$, which becomes the next approximation. The formula for this is the following:

```math
x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}.
```

From a geometric point of view, each iteration draws the tangent to the curve at $x_n$ and following it down to the horizontal axis. This iterations are concateneated until we reach the tolerance, that is,

```math
|x_{n+1} - x_n| < \epsilon.
```

Once tolerance is met, we adopt $x_n$ as the approximate root.

## Practical example

Let's apply Newton's method to the function

```math
f(x) = x^3 - x - 2.
```

We start computing the derivative:

```math
f'(x) = 3x^2 - 1.
``

To begin with the method, we select an initial guess. A reasonable choice here is

```math
x_0 = 1.
```

Then, we compute the successive approximations:

```math
x_1 = x_0 - \frac{f(x_0)}{f'(x_0)}
    = 1 - \frac{-2}{2}
    = 2.
```

If we keep going the iteration, the values will approach the root fast, due to the efficiency of this method. For a tolerance of

```math
\epsilon = 10^{-3},
```

the method converges (using a computational implementation) to the approximate solution 

```math
x \approx 1.5214,
```

in just seven iterations! And it's the same root obtained using the bisection and secant methods, but with less iterations.
