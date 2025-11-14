# Newton's interpolation method

Newton's interpolation method is another classical Global Polynomial Interpolation method, that is, another interpolation method that works on a complete interval of points, instead of dealing with subintervals. The idea here is to write the interpolation polynomial, instead of using some global basis fnctions, building incrementally the polynomial with divided differences. These are a recursive way to compute the coefficients, basically finding the slope between points.

## Conditions

To apply Newton's method, we need:

- C1: A set of distinct interpolation nodes $x_0, x_1, ..., x_n$.
- C2: The corresponding function values $f_0, f_1, ..., f_n$.

These conditions are basically the Lagrange's method conditions, because in a way Newton's interpolation method is Lagrange's method, but with Newton's divided differences.

## Algorithm

The algorithm of this method is heavily dependent on what we will call the divided differences table, that will provide the coefficients of the Newton interpolating polynomial. We begin with the zero-order divided differences:

```math
f[x_i] = f_i.
```

Then, we define the higher-order divided differences recursively:

```math
f[x_i, x_{i+1}] = \frac{f[x_i{i+1}] - f[x_i]}{x_{i+1} - x_i}
```

and in general, we get,

```math
f[x_i, x_{i+1}, ..., x_{i+k}] =
\frac{f[x_{i+1}, ..., x_{i+k}] - f[x_i, ..., x_{i+k-1}]}{x_{i+k} - x_i}.
```

The values form a triangular structure, the first entry of each column becoming a coefficient of the final polynomial.

Once the divided differences are computed, we can write the interpolating polynomial as

```math
P(x) = a_0 + a_1(x - x_0) + a_2(x - x_0)(x - x_1) + ... + a_n(x - x_0)...(x - x_{n-1}),
```

where

```math
a_k = f[x_0, x_1, ..., x_k].
```

This way of representing is interesting because adding a new interpolation point only requires computing a new divided difference column and appending one more term to the expression.

To evaluate the polynomial, we will substitute the desired value of $x$ directly into the expression:

```math
P(x) = a_0 + a_1(x - x_0) + a_2(x - x_0)(x - x_1) + … + a_n(x - x_0)(x - x_1)…(x - x_{n-1}).
```

Then each term is computed by forming the corresponding product

```math
(x - x_0)(x - x_1)…(x - x_{k-1}),
```

multiplying it by the coefficient $a_k$ and summing all contributions. This determines the Newton's interpolating polynomial.
