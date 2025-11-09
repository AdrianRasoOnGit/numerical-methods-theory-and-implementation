# Lagrange's method

Lagrange interpolation is a classical numerical technique for interpolation problems, that is, problems where we want to build a function that matches a data that it's given exactly at some points. To be a bit more precise, what we want when we use Lagrange's interpolation is to obtain an explicit polynomial that passes through all those points. You can remember this from the [index of the chapter](index.md), since as you may know Lagrange's is a Global Polynomial Interpolation.

The method relies on a very elegant strategy, since instead of trying to solve a system of equations to determine the coefficients of the polynomial, Lagrange gives this polynomial directly. This is achieved by expressing it as a weighted sum of specially built basis functions, which take the value 1 at one interpolation node and 0 at all the others. With this property, Lagrange’s method reproduces the data point by point, and without using derivatives, like Newton interpolation.

In any case, the method has important drawbacks. For example, since every basis polynomial depends on all nodes, the computational cost grows with the number of points, and numerical instabilities may appear when the degree of the polynomial becomes large. In this sense, Lagrange’s method has more theoretical interest than that of a truly reliable algorithm. It is the best place to start in order to understand interpolation, after that Taylor throwback from the [index](index.md).

## Conditions

In order to apply Lagrange's method, we need:

- C1: A set of distinct interpolation nodes $x_0, x_1, ..., x_n$.
- C2: A set of function values $y_0, y_1, ..., y_n$ corresponding to those nodes.
- C3: A degree $n$ that does not compromise numerical stability.

With the first condition we ensure that the denominators appearing on the basis functions are well-defined. With the second, we obtain the information that the interpolation must emulate. The third is important because global polynomial interpolation may deteriorate real quick if we use too many nodes, of the spacing between them is not enough.

## Algorithm

Given the nodes $x_0, ..., x_n$ and their corresponding values $y_0, ..., y_n$, we build the Lagrange basis polynomials. We define these by

```math
L_i(x) = \prod_{\substack{j = 0 \\ j \ne i}}^{n} \frac{x - x_j}{x_i - x_j}.
```

Each of these basis polynomials follows the interpolation property:

```math
L_i(x_i) = 1, \qquad L_i(x_j) = 0 \quad \text{for } j \ne i.
```

Having this family of polynomials, we are ready to build the interpolant. The expression is the one we show below:

```math
P(x) = \sum_{i = 0}^{n} y_i\, L_i(x).
```

Thus we get an unique polynomial of degree at most $n$ that meets all the given data. Something really interesting and important to note here is that the form is explicit, this method does not need any iterations.
