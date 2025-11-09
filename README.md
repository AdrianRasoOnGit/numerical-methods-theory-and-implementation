

# Numerical Methods: Theory and Implementation

[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Purpose](https://img.shields.io/badge/Status-Research-orange.svg)]()
[![Topics](https://img.shields.io/badge/Topics-Numerical_Methods-red.svg)]()

This repository contains algorithms for numerical methods, detailed theoretically as well as implemented in *Python*, *Julia*, and *Fortran*. The goal of this repo is to offer a reference space (mainly personal) for different numerical techniques for problem solving, allowing the review and practice of fundamental concepts and techniques in the field, through different programming languages.

### Contents

Here are listed all the methods already present in the project:

#### Root-Finding Methods
| Method    | Theory | Python       | Julia        | Fortran       |
|-----------|--------|--------------|--------------|---------------|
| Bisection | Yes    | `bisection.py` | `bisection.jl` | `bisection.f90` |
| Secant    | Yes    | `secant.py`    | `secant.jl`    | `secant.f90`    |
| Newton    | Yes    | `newton.py`    | `newton.jl`    | `newton.f90`    |
| Aitken    | Yes    | `aitken.py`    | `aitken.jl`       | `aitken.f90` |
| Müller    | No     | `muller.py`    | `muller.jl`         | `muller.f90`|

### Interpolation Methods
 Method    | Theory | Python       | Julia        | Fortran       |
|-----------|--------|--------------|--------------|---------------|
| Lagrange | No    | `lagrange.py` | `lagrange.jl` | `lagrange.f90` |
| Hermite | No    | `hermite.py` | `hermite.jl`  | `hermite.f90` |

Coming soon: Hermite, Spline, and some piecewise polynomial approximations.

### References

- Richard L. Burden & Douglas Faires. *Numerical Analysis*

- Peter Henrici. *Elements of Numerical Analysis*

- Timothy Sauer. *Numerical Analysis*
