

# Numerical Methods: Theory and Implementation

[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Purpose](https://img.shields.io/badge/Status-Research-orange.svg)]()
[![Topics](https://img.shields.io/badge/Topics-Numerical_Methods-red.svg)]()

This repository contains algorithms for numerical methods, detailed theoretically as well as implemented in *Python*, *Julia*, and *Fortran*. The goal of this repo is to offer a reference space (mainly personal) for different numerical techniques for problem solving, allowing the review and practice of fundamental concepts and techniques in the field, through different programming languages.

### Contents

Here are listed all the methods already present in the project:

#### Root-Finding Methods
| Method    | [Theory](docs/root_finding/) | [Python](python/nmti/root_finding)       | [Julia](julia/src/root_finding)        | [Fortran](fortran/src/root_finding)       |
|-----------|--------|--------------|--------------|---------------|
| Bisection | [Yes](docs/root_finding/bisection.md)    | [`bisection.py`](python/nmti/root_finding/bisection.py) | [`bisection.jl`](julia/src/root_finding/bisection.j) | [`bisection.f90`](fortran/src/root_finding/bisection.f90) |
| Secant    | [Yes](docs/root_finding/secant.md)    | [`secant.py`](python/nmti/root_finding/secant.py)    | [`secant.jl`](julia/src/root_finding/secant.jl)    | [`secant.f90`](fortran/src/root_finding/secant.f90)    |
| Newton    | [Yes](docs/root_finding/newton.md)    | [`newton.py`](python/nmti/root_finding/newton.py)    | [`newton.jl`](julia/src/root_finding/newton.jl)    | [`newton.f90`](fortran/src/root_finding/newton.f90)    |
| Aitken    | [Yes](docs/root_finding/aitken.md)    | [`aitken.py`](python/nmti/root_finding/aitken.py)    | [`aitken.jl`](julia/src/root_finding/aitken.jl)       | [`aitken.f90`](fortran/src/root_finding/aitken.f90) |
| Müller    | [Yes](docs/root_finding/muller.md)     | [`muller.py`](python/nmti/root_finding/muller.py)    | [`muller.jl`](julia/src/root_finding/muller.jl)         | [`muller.f90`](fortran/src/root_finding/muller.f90) |

#### Interpolation Methods
 Method    | Theory | Python       | Julia        | Fortran       |
|-----------|--------|--------------|--------------|---------------|
| Lagrange | [Yes](docs/interpolation/lagrange.md)    | [`lagrange.py`](python/nmti/interpolation/lagrange.py) | [`lagrange.jl`](julia/src/interpolation/lagrange.jl) | [`lagrange.f90`](fortran/src/interpolation/lagrange.f90) |
| Hermite | No    | [`hermite.py`](python/nmti/interpolation/hermite.py) | [`hermite.jl`](julia/src/interpolation/hermite.jl)  | [`hermite.f90`](fortran/src/interpolation/hermite.f90) |
| Newton | No | [`newton_i.py`](python/nmti/interpolation/newton_i.py) | [`newton_i.jl`](julia/src/interpolation/newton_i.jl) | [`newton_i.f90`](fortran/src/interpolation/newton_i.f90) |
| Natural cubic spline | No | [`natural_cubic_spline.py`](python/nmti/interpolation/natural_cubic_spline.py) | [`natural_cubic_spline.jl`](julia/src/interpolation/natural_cubic_spline.jl) | No |
| Clamped spline | No | No | No | No |


Coming soon: Spline, and some piecewise polynomial approximations.

### References

- Richard L. Burden & Douglas Faires. *Numerical Analysis*

- Peter Henrici. *Elements of Numerical Analysis*

- Timothy Sauer. *Numerical Analysis*
