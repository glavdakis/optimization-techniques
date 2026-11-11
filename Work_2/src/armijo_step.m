function gamma = armijo_step(fh, x, d, g, alpha, beta, s)
% Armijo rule: gamma = s*beta^m, with m the smallest non-negative integer such that
%   f(x) - f(x + s*beta^m*d) >= -alpha*s*beta^m * grad f(x)'*d
%   fh  numeric function handle f(x,y)
%   x   current point, d descent direction, g gradient at x (row vectors)

m = 0;
fx = fh(x(1), x(2));
while m < 60
    gamma = s*beta^m;
    xNew = x + gamma*d;
    if fx - fh(xNew(1), xNew(2)) >= -alpha*gamma*(g*d')
        return;
    end
    m = m + 1;
end

end
