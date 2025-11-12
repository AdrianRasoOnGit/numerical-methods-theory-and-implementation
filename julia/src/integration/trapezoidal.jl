module Trapezoidal

"""
        trapezoidal(f, a, b, n)

Trapezoidal rule method for numerical integration.
    """

function trapezoidal(f, a, b, n::Int)
    if n <= 0
        error("Number of subintervals n must be positive.")
    end

    h = (b - a) / n
    s = 0.5 * (f(a) + f(b))

    for i in 1:(n - 1)
        s += f(a + i * h)
    end

    return h * s
end

if abspath(PROGRAM_FILE) == @__FILE__
    f(x) = sin(x)
    println(trapezoidal(f, 0, π, 1000))
end

end   
