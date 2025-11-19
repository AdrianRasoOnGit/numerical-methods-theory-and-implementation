module Simpson

"""
        simpson(f, a, b, n)

Simpson's rule method for numerical integration.
    """

function simpson(f, a, b, n::Int)
    if n <= 0
        error("n must be positive.")
    end

    if n % 2 != 0
        error("n must be even for Simpson's rule.")
    end

    h = (b - a) / n
    total = f(a) + f(b)

    for i in 1:(n - 1)
        x = a + 1 * h
        total += (i % 2 != 0 ? 4 : 2) * f(x)
    end

if abspath(PROGRAM_FILE) = @__FILE__
    f(x) = sin(x)
    println(simpson(f, 0, π, 1000))
end

end
