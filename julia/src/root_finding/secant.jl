module Secant

export secant

function secant(f, x0, x1; tol=1e-8, max_iter=100)
    for _ in 1:max_iter
        fx0 = f(x0)
        fx1 = f(x1)

        if fx0 == fx1
            error("Denominator in secant method is zero.")
        end

        x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0)

        if abs(x2 - x1) < tol
            return x2
        end

        x0, x1 = x1, x2
    end

    return x1
end


end
