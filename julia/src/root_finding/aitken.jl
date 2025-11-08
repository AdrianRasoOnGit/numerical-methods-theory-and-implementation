module Aitken

export aitken

"""
        aitken(seq; tol=1e-10, max_iter=100)

Aitken Δ² acceleration applied to sequence `seq(n)` that returns x_n.
"""

function aitken(seq; tol=1e-10, max_iter=100)
    for n in 0:max_iter
        x0 = seq(n)
        x1 = seq(n + 1)
        x2 = seq(n + 2)

        dx = x1 - x0
        ddx = x2 - 2x1 - x0

        ddx == 0 && error("Δ² term became zero in Aitken method.")

        x̂ = x0 - dx^2 / ddx

        if abs(x̂ - x0) < tol
            return x̂
        end
    end
end

end
