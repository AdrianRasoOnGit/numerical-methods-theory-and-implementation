## Root-Finding Methods

The methods presented in this chapter aim to solve equations of the following form:

\[
f(x) = 0.
\]

These are generally simple problems, for which we find introductory numerical techniques that provide a very good starting point for becoming familiar with the field. Solving these problems usually consists of approximating the value of the root of the equation above through a process carried out over a series of iterations. Thus, what we do is generate a sequence of values that, under certain conditions, converges toward the solution.

Each method explores a different strategy for updating this approximation, such as exploiting the derivative (Newton), using secant lines (secant), or simply identifying intervals where a sign change occurs (bisection). All of them assume, as is common in numerical methods, that the function is continuous.


## Methods

Below we list the methods contained in this chapter.
- [Bisection Method](bisection.md)
- [Secant Method](secant.md)
- [Newton's Method](newton.md)
