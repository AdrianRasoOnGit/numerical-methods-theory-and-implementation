module Midpoint

"""
        midpoint(f, a, b, n)

Midpoint rule for numerical integration.
    """

function midpoint(f, a::Float64, b::Float64, n::Int)
    n <= 0 && error("n must be a positive integer.")

    h = (b - a) / n
    total = 0.0

    for i in 0:(n-1)
        mid = a + (i + 0.5) * h
        total += f(mid)
    end

    return total * h
end

end

if abspath(PROGRAM_FILE) == @__FILE__
    using .Midpoint
    f(x) = x^2
    println(Midpoint.midpoint(f, 0.0, 1.0, 10))
end
