module NewtonI

export newton_i

"""
        newton_i(x_nodes, y_nodes, x)

Newton's divided difference interpolation.
Returns the interpolated value P(x).
"""

function newton_i(x_nodes::Vector{<:Real}, y_nodes::Vector{<:Real}, x::Real)
    n = length(x_nodes)
    n == length(y_nodes) || error("x_nodes and y_nodes must have the same length.")

    coef = copy(y_nodes)

    for j in 1:n-1
        for i in n:-1:j+1
            coef[i] = (coef[i] - coef[i-1]) / (x_nodes[i] - xnodes[i-j])
        end
    end

    result = coef[n]
    for k in (n-1):-1:1
        result = result * (x - x_nodes[k]) + coef[k]
    end

    return result
end

if abspath(PROGRAM_FILE) == @__FILE__
    xs = [0.0, 1.0, 2.0]
    ys = [1.0, 3.0, 2.0]
    println(newton_i(xs, ys, 1.5))
end

end
