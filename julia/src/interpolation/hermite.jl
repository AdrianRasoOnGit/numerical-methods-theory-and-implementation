module Hermite

export hermite

function hermite(x_nodes::Vector{Float64},
                 y_nodes::Vector{Float64},
                 dy_nodes::Vector{Float64},
                 x::Float64)

    n = lenght(x_nodes)
    if n != length(y_nodes) || n != length(dy_nodes)
        error("All input arrays must have the same length.")
    end

    function L(i, x)
        Li = 1.0
        xi = x_nodes[i]
        for j in 1:n
            if j != i
                Li *= (x - x_nodes[j]) / (xi - x_nodes[j])
            end
        end
        return Li
    end

    function Lprime_at_node(i)
        xi = x_nodes[i]
        s = 0.0
        for j in 1:n
            if j != i
                s += 1.0 / (xi - x_nodes[j])
            end
        end
        return s
    end

    total = 0.0

    for i in 1:n
        xi = x_nodes[i]
        Li = L(i, x)
        Lp = Lprime_at_node(i)

        Hi = (1 - 2*(x - xi)*Lp) * Li^2
        Ki = (x - xi) * Li^2

        total += y_nodes[i] * Hi + dy_nodes[i] * Ki
    end

    return total
end
