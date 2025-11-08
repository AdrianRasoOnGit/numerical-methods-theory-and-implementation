module NewtonMethod

export newton

"""
        newton(f, df, x0; tol=1e-10, max_iter=100)

Newton's method for root finding.

Returns `(root, iterations)`.
"""
function newton(f, df, x0; tol=1e-10, max_iter=100)
    x = x0
    for i in 1:max_iter
        fx = f(x)
        dfx = df(x)
        if dfx == 0
            error("Derivative is zero, Newton method will fail.")
        end
        x_new = x - fx / dfx
        if abs(x_new - x) < tol
            return x_new, i
        end
        x = x_new
    end
    error("Newton method did not converge with max_iter.")
end


end
