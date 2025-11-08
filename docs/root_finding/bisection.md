# Bisection Method

The bisection method is one of the simplest techniques in numerical methods, and it is a great place to start. This method is aimed at solving problems in which we want to obtain a root, that is, a value $x$ that satisfies the equation 

$$
f(x) = 0.
$$

The technique is applied over an interval $[a, b]$, and the bisection method requires that the function values satisfy for this interval

$$
f(a) · f(b) < 0.
$$

That is, that $a$ and $b$ must have opposite signs. This opposition, thanks to the *Intermediate Value Theorem*, ensures that there is at least one root $x*$ within the interval, and from there, the method consists of repeatedly dividing our interval $[a, b]$ in half, discarding the subinterval that does not contain the root and keeping the one that does maintain the sign change.

## Conditions
To apply the bisection method, we need two conditions to be satisfied:
- C1: $f$ is continuous on $[a, b]$
- C2: $f(a) * f(b) < 0$, that is, $f(a)$ and $f(b)$ do not share the same sign

By the *Intermediate Value Theorem*, we know that there exists at least one root $x*$ in $[a, b]$ such that

$$
f(x*) = 0.
$$

And in this way, these conditions support the applicability of the bisection method.

## Algorithm

If we start with an interval $[a_0, b_0]$ that satisfies C2, we begin by computing the midpoint:

$$
c_n = (a_n + b_n) / 2
$$

Second, we evaluate $f(c_n)$ and check which subinterval, either $[a_n, c_n]$ or $[c_n, b_n]$, satisfies C2. Thus, if $f(a_n) · f(c_n) < 0$, we redefine:

$$
a_{n+1} = a_n
b_{n+1} = c_n
$$

Otherwise, if $f(c_n) · f(b_0) < 0$, then:

$$
a_{n+1} = c_n
b_{n+1} = b_n
$$

Once the first application of the method is completed, we will reapply it up to a certain point. This point, a sort of stopping criterion, is the tolerance, a value $\epsilon > 0$ that allows us to define how precisely we will approximate the solution. In this sense, we will apply the steps detailed above until $|b_n - a_n| < \epsilon$.

Then, once the tolerance is met, we will compute the midpoint one more time, and the value $c_n$ will be the approximate root.

## Practical example

Say we want to find a root of the function

$$
f(x) = x^3 - x - 2
$$

We will start by choosing an interval where the function changes sign, for instance, $[1, 2]$. Let's evaluate the function on this interval:

$$
f(1) = -2, f(2) = 4
$$

To check if this interval is valid, we verify the inequality $f(1) · f(2) < 0$, which is indeed satisfied since 

$$
f(1) · f(2) = -8.
$$

Knowing that the interval satisfies C2, we can compute the midpoint

$$
c_1 = (1 + 2) / 2 = 1.5
$$

and observe which subinterval, either [1, 1.5] or [1.5, 2], satisfies C2. For the left subinterval [1, 1.5], we have

$$
f(1) = - 2, f(1.5) = 1.5^3 - 1.5 - 2 = 3.375 - 3.5 = -0.125,
$$

and their product is then $(-2)(-0.125) > 0$. For the right subinterval [1.5, 2] we have

$$
f(1.5) = -0.125, f(2) = 4,
$$

and the product here is (-0.125)(4) < 0. We see that in the right subinterval the inequality holds, so we thus know that the next interval over which we will apply the method is

$$
[a_1, b_2] = [c_1, b_1] = [1.5, 2].
$$

In this way, we will iterate these steps until meeting the tolerance. If we assume, for example, a tolerance of 

$$
\epsilon = 10^-3
$$

and apply this method using computational means, we see that the approximate solution to the equation $f(x) = x^3 - x - 2$ is $1.5214$.



