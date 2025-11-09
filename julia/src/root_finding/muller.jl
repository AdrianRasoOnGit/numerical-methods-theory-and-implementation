module Muller

export muller

function muller(f, x0, x1, x2; tol=1e-10, max_iter=100)
    for _ in 1:max_iter
        f0, f1, f2 = f(x0), f(x1), f(x2)

        h1 = x1 - x0
        h2 = x2 - x1
        d1 = (f1 - f0) / h1
        d2 = (f2 - f1) / h2
        d = (d2 - d1) / (h2 + h1)

        a = d
        b = d2 + h2*d
        c = f2

        D = sqrt(b^2 - 4a*c)
        denom = abs(b + D) > abs(b - D) ? b + D : b - D

        if denom == 0
            error("Müller demoninator is zero.")
        end

        x0, x1, x2 = x1, x2, x3
    end

    end
