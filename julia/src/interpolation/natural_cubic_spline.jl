module NaturalCubicSpline

export natural_cubic_spline

"""
        natural_spline(x_nodes, y_nodes, x)

Natural cubic spline interpolation.
Returns the interpolated value S(x).
"""

function natural_spline(x_nodes::Vector{<:Real}, y_nodes::Vector{<:Real}, x::Real)
    n = length(x_nodes)
    n == length(y_nodes) || error("x_nodes and y_nodes must have the same length.")
    n > 3 || error("At least 3 nodes are expected for the cubic spline.")

    a = copy(y_nodes)
    h = [x_nodes[i+1] - x_nodes[i] for i in 1:n-1]

    alpha = zeros(Float64, n)
    for i in 2:n-1
        alpha[i] = (3/h[i]) * (a[i+1] - a[i]) - (3/h[i-1]) * (a[i] - a[i-1])
    end

    l = zeros(Float64, n)
    mu = zeros(Float64, n)
    z = zeros(Float64, n)

    c = zeros(Float64, n)
    b = zeros(Float64, n)
    d = zeros(Float64, n)

    l[1] = 1.0
    
    for i in 2:n-1
        l[i] = 2*(x_nodes[i+1] - x_nodes[i-1]) - h[i-1]*mu[i-1]
        mu[i] = h[i] / l[i]
        z[i] = (alpha[i] - h[i-1]*z[i-1]) / l[i]
    end

    l[n] = 1.0

    for i in (n-1):-1:1
        c[i] = z[i] - mu[i] * c[i+1]
        b[i] = (a[i+1] - a[i]) / h[i] - h[i] * (c[i+1] + 2*c[i]) / 3
        d[i] = (c[i+1] - c[i]) / (3*h[i])
    end

    i = n - 1
    while i > 1 && x < x_nodes[i]
        i -= 1
    end

    dx = x - x_nodes[i]
    return a[i] + b[i]*dx + c[i]*dx^2 + d[i]*dx^3
end

if abspath(PROGRAM_FILE) == @__FILE__
    xs = [0.0, 1.0, 2.0, 3.0]
    ys = [0.0, 1.0, 0.0, 1.0]
    print(natural_spline(xs, ys, 1.5))
end

end                
