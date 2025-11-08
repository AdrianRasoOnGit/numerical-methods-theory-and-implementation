
"""
nmti.root_finding

Root-finding algorithms. Please check the docs/ to read the theory behind these methods
"""

from .bisection import bisection
from .secant import secant
from .newton import newton

__all__ = ["bisection", "secant", "newton"]
