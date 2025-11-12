# Hermite's method 

The Hermite method is a generalization of the Lagrange method in the sense that, in addition to reproducing the points of a function, it also allows us to capture their derivatives. With this, we interpolate not only the points but also the slope between them. Formally, a polynomial interpolation such as Lagrange’s ensures that $P(x_i) = f_i$. With Hermite, we extend this to the expression

```math
P(x_i) = f_i, \quad P'(x_i) = f'_i
```

for each interpolation node. In summary, the Hermite method is more accurate, especially near the points, since it succeeds in emulating the local behavior of the function.

## Conditions

In order to apply Hermite's method, we need:

- C1: A set of distinct interpolation nodes $x_0, x_1, ..., x_n$.
- C2: The corresponding function values $f_0, f_1, ..., f_n$.
- C3: The derivative values $f'_0, f'_1, ..., f'_n$.
- C4: The function and its derivatives are continous over the interval of the nodes.

If we compare it with the conditions of the Lagrange method, we see a resemblance that is hard to ignore, except for C3. It is important to have the derivatives, since the Hermite polynomial cannot be constructed without them. Also, it would be really great that the function and its derivatives are continuous on the interval, to ensure some guarantees around error bounds.

## Algorithm

The main idea behind Hermite interpolation is to construct basis functions that allow us to reproduce both the values of the function and its derivative for each node. These basis functions can be expressed as Lagrange basis functions $L_i(x) without issue. For this purpose, it may be helpful to review the previous section dedicated to the Lagrange method. We will begin now with the Lagrange basis functions:

```math
L_i(x) = \prod_{\substack{j = 0 \\ j \ne i}}^{n}
        \frac{x - x_j}{x_i - x_j}.
```

The functions satisfy the properties

```math
L_i(x_i) = 1, L_i(x_j) = 0 (j 
```

Now, to add the derivative information, we will need the value of the derivative of the Langrange basis at the nodes, which is given by

```math
L_i'(x_i) =
\sum_{\substack{j = 0 \\ j \ne i}}^{n}
\frac{1}{x_i - x_j}
```

From this, we can now build the Hermite basis polynomials:

```math
H_i(x) = [1 - 2(x - x_i)L_i'(x_i)][L_i(x)]^2
```

```math
K_i(x) = (x - x_i)[L_i(x)]^2
```

And lastly, we get the Hermite interpolating polynomial:

```math
P(x) = \sum_{i=0}^{n} [ f_i H_i(x) + f'_i K_i(x) ]
```

With this formula we build the interpolating polynomial from the function value $f_i$, captured by $H_i(x)$, and the derivative $f'_i$, with $K_i(x)$. The polynomial $P(x)$ now satisfies

```math

P(x_i) = f_i, P'(x_i) = f'_i,

```

allowing us to have formed an unique Hermite interpolating polynomial on any interval.


