function points = descent(f, gradf, hess, x0, method, rule, epsilon)
% Iterative descent x_{k+1} = x_k + gamma_k * d_k, until |grad f(x_k)| < epsilon.
%   method: 'steepest'  d_k = -grad f(x_k)
%           'newton'    d_k = -(hessian f(x_k))^(-1) grad f(x_k)
%           'lm'        d_k = -(hessian f(x_k) + mu_k I)^(-1) grad f(x_k),
%                       with mu_k the smallest integer that makes the matrix positive definite
%   rule:   'const'     gamma_k = 0.1
%           'min'       gamma_k minimizes f(x_k + gamma_k d_k) (bisection with derivative)
%           'armijo'    gamma_k from the Armijo rule
% Returns all iterates as rows of points.

maxIter = 1000; % safety limit
fh = matlabFunction(f);
gh = matlabFunction(gradf);
hh = matlabFunction(hess);

x = x0;
points = x0;
g = gh(x(1), x(2))'; % gradient as a row vector

while norm(g) >= epsilon && size(points, 1) <= maxIter
    % descent direction
    switch method
        case 'steepest'
            d = -g;
        case 'newton'
            d = -(hh(x(1), x(2)) \ g')';
        case 'lm'
            H = hh(x(1), x(2));
            mu = 0;
            while min(eig(H + mu*eye(2))) <= 0
                mu = mu + 1;
            end
            d = -((H + mu*eye(2)) \ g')';
    end

    % step size
    switch rule
        case 'const'
            gamma = 0.1;
        case 'min'
            gamma = minimize_gammafunction(fh, x, d);
        case 'armijo'
            gamma = armijo_step(fh, x, d, g, 1e-4, 0.4, 1);
    end

    x = x + gamma*d;
    points(end+1, :) = x;
    g = gh(x(1), x(2))';
end

end
