# Natural Cubic Spline method

The natural cubic spline method is the first technique from this chapter that it's not a Global Polynomial Interpolation, but a piecewise interpolation, that is, instead of using a high-degree polynomial for the complete interval, with cubic spline we will use low-degree polynomials on each separate interval. The most inmediate and clear outcome of this is that we manage to provide fairly better approximations, with a significant increase in precision. In the chapter, we will explain two splines: the natural cubic, and the clamped cubic, which are two introductory (yet really useful) examples of splines. More advanced ones are for example the B-spline, that it's not going to be considered here for now.

## Conditions

To build a natural cubic spline we need:
- C1: A set of distinct interpolation nodes $x_0 < x_1 < \dots < x_n$.
- C2: Corresponding function values $f_0, f_1, \dots, f_n$.
- C3: Natural boundary conditions, that give name to the spline:

```math
S''(x_0) = 0, \quad S''(x_n) = 0.
```

These conditions of C3 are characteristic of this spline method. We call it naturall because we are not imposing any curvature constraints at the endpoints. Splines in general use this trick to allow us to solve the interpolation problem, since we may not have enough equations to determine an unique solution. In the natural cubic spline, this natural boundary condition is the tool we use to ensure we can perform the interpolation.

## Algorithm

Our goal is to create a piecewise function composed of cubic polynomials

```math
S_i(x) = a_i + b_i(x - x_i) + c_i(x - x_i)^2 + d_i(x - x_i)^3,
```

that are valid on each interval $[x_i, x_{i+1}]$. To find the coefficients, we impose smoothness and interpolation conditions.

First, let 

```math
h_i = x_{i+1} - x_i, \quad i = 0, \dots, n-1.
```

With these values we define how intervals are scaled.

Then, to obtain the coefficients $c_i$, we solve the linear system

```math
h_{i-1}c_{i-1} + 2(h_{i-1} + h_i)c_i + h_i c_{i+1} =
3\left(\frac{f_{i+1} - f_i}{h_i} - \frac{f_i - f_{i-1}}{h_{i-1}}\right),
```

for $i=1, \dots, n-1$, together with the natural boundary conditions

```math
c_0 = 0, \quad c_n = 0.
```

Once done this, we want to solve that very system for all coefficients. When these are known:

```math
b_i = \frac{f_{i+1} - f_i}{h_i} - \frac{h_i}{3}(2c_i + c_{i+1}),
d_i = \frac{c_{i+1} - c_i}{3h_i},
a_i = f_i,
```

thus exhibiting the complete cubic polynomials on each interval. Now we can build the spline, since it is defined by

```math
S(x) = S_i(x) \quad \text{for } x \in [x_i, x_{i+1}],
```

With this, we get a smooth differentiable function that successfully interpolates all data points. And usually it will be more precise than its Global Polynomial Interpolation counterpart.

