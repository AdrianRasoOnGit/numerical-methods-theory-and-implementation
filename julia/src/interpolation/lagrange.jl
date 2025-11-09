module Lagrange

export lagrange

function lagrange(x_nodes::Vector{Float64},
                  y_nodes::Vector{Float64},
                  x::Float64)

    n = length(x_nodes)
    if n != length(y_nodes)
        error("x_nodes and y_nodes must have the same length.")
    end

    total = 0.0

    for i in 1:n
        xi = x_nodes[i]
        yi = y_nodes[i]

        Li = 1.0
        for j in 1:n
            if i != j
                Li *= (x - x_nodes[j]) / (xi - x_nodes[j])
            end
        end

        total += yi * Li
    end

    return total
end
