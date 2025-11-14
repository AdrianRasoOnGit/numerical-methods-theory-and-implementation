# Clamped Cubic Spline method

After the Natural Cubic Spline, where the spline is founded on the natural boundary conditions, another really useful technique in this family of methods is the Clamped Cubic Spline. As with any spline method, it is a piecewise interpolation, so instead of relying on a single high-degree polynomial for the complete interval, we rely on a collection of cubic polynomials for subintervals of that interval. This approach usually returns better accurate interpolations than Global Polynomial Interpolation methods. 

Again, with natual spline, we imposed zero cuvature at the endpoint, and with the clamped spline, we will incorporate derivative information at the boundaries. In comparison with the Natural Cubic Spline, the clamped technique additional precision when that information is known, turning this form of spline method an useful tool to enforece specific slope behavior at the edges.

## Conditions

In order to build a clamped cubic spline, we need:

- C1: A set of distinct interpolation nodes $x_0 < x_1 < \dots < x_n$.
- C2: Corresponding function values $f_0, f_1, \dots, f_n$.
- C3: Boundary derivatives, that is, the clamped conditions:

```math
S'(x_0) = f'(x_0), \quad S'(x_n) = f'_n.
```

In C3, $f'_0$ and $f'_n$ are the slopes at the first and last nodes, replacing the natural bounds conditions of the natural spline. These again give the name to the method, since with C3 the endpoints are, let's say, *clamped*, to match the specified derivates.

## Algorithm

Like in the Natural Cubic Spline method, our goal is to build a piecewise function constitued by cubic polynomials

```math
S_i(x) = a_i + b_i(x - x_i) + c_i(x - x_i)^2 + d_i(x - x_i)^3,
```

valid on each interval $[x_i, x_{i+1}]$. We will begin defining the interval lenghts:

```math
h_i = x_{i + 1} - x_i, \quad i = 0, \dots, n - 1.
```

With the distance between nodes, we can now write the equations. For $i = 1, \dots, n - 1$, we impose continuity of the second derivative, which gives us:

```math
h_{i-1} c_{i-1} + 2(h_{i-1} + h_i)c_i + h_i c_{i+1}
= 3\left( \frac{f_{i+1} - f_i}{h_i} - \frac{f_i - f_{i-1}}{h_{i-1}} \right).
``` 

Now we add the known endpoint derivatives:

```math
S'(x_0) = f'_0, \quad S'(x_n) = f'_n.
```

Which leads us to:

```math
2h_0 c_0 + h_0 c_1
= 3\left( \frac{f_1 - f_0}{h_0} - f'_0 \right),
\\[6pt]
h_{n-1} c_{n-1} + 2h_{n-1} c_n
= 3\left( f'_n - \frac{f_n - f_{n-1}}{h_{n-1}} \right).
```

These equations from the system for $c_0, \dots, c_n$. Once we obtain all $c_i$, the other coefficients follow:

```math
b_i = \frac{f_{i+1} - f_i}{h_i} - \frac{h_i}{3}(2c_i + c_{i+1}), 
\\[6pt]
d_i = \frac{c_{i+1} - c_i}{3h_i},
\\[6pt]
a_i = f_i .
```

Finally, the spline can be defined as 

```math
S(x) = S_i(x) for x \in [x_i, x_{i+1}],
```

providing a smooth interpolant that captures the data and the boundary sloples.
