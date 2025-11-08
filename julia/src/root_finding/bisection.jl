module Bisection

export bisection

function bisection(f, a, b; tol=1e-8, max_iter=100)
    if f(a) * f(b) > 0
        error("f(a) and f(b) must have opposite signs.")
    end

    for _ in 1:max_iter
        c = (a + b) / 2

        if abs(f(c)) < tol || (b - a) / 2 < tol
            return c
        end

        if f(a) * f(c) < 0
            b = c

        else
            a = c
        end
    end

    return (a + b) / 2
end

        
end        
