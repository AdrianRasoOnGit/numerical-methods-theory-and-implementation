
"""
nmti.interpolation

Interpolation algorithms. Please check the docs/ to read the theory behind these methods
"""

from .lagrange import lagrange
from .hermite import hermite

__all__ = ["lagrange", "hermite"]
