## Interpolation Methods

# Introduction to Interpolation Methods

The methods presented in this chapter aim to solve problems where, given the values of a function at several points, we are required to construct another function that reproduces that behavior. In most cases, this is achieved by finding a polynomial that passes exactly through the given points. This idea may already be familiar from Calculus I: indeed, it is closely related to the spirit of the Taylor polynomial.

The Taylor polynomial of order \(n\) for a function \(f\) expanded around a point \(a\) is given by

```math
T_n(x) = \sum_{k=0}^{n} \frac{f^{(k)}(a)}{k!}\,(x-a)^k,
```
and serves as the local polynomial approximation of $f$. This is a really good picture of what a interpolation method looks (on the surface!). Yet, Taylor polynomials are not really a good interpolation method. They require knowledge of the derivatives of $f$, and they have to be centered at a single point. Interpolation techniques, on the other hand, build a polynomial that really mathces the given data, at multiple points, even when the function is unknown or even too complicated to differentiate. 

Suppose we are given $n + 1$ data points:

```math
(x_0, f_0), (x_1, f_1), ..., (x_n, f_n).
```

We want to build a polynomial $P_n(x)$ of degree at most $n$ such that

```math
P_n(x_i) = f_i for all i = 0, 1, ..., n.
```

This task is known as interpolation, and the resulting $P_n$ has the quite straightforward nickname of interpolating polynomial.

Interpolation methods have their own families of approaches based on some major properties and conditions. Here, we will deal with two:

- Global Polynomial Interpolation, like Lagrange's method, or Newton interpolation method, and the goal here is to pass all the points.
- Piecewise Polynomial Interpolation, like the splines, where we split into subintervals, and we use, instead of high-degree polynomials, low-degree subparts.

From this pair, we will see that the second are more precise, but they are harder to use.

## Methods

Below we list the methods contained in this chapter.
- [Lagrange's Method](lagrange.md)
- [Hermite's Method](hermite.md)
- [Newton's Interpolation Method](newton_i.md)
- [Natural Cubic Spline Method](natural_cubic_spline.md)
