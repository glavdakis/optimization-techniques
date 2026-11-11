function [minArg, minValue] = minimize_gammafunction(fh, x, d)
% Bisection method with derivative that finds the step gamma in [0, 3]
% minimizing g(gamma) = f(x + gamma*d) along the descent direction d.
%   fh  numeric function handle f(x,y)
%   x   current point, d descent direction (row vectors)

% parameters to be changed
upper = 3;
lower = 0;
l = 0.01;   % final length of the search interval
h = 1e-7;   % step for the numerical derivative of g

g = @(t) fh(x(1) + t*d(1), x(2) + t*d(2));
dg = @(t) (g(t + h) - g(t - h)) / (2*h);

while upper - lower >= l
    midpoint = (upper + lower) / 2;
    der_g = dg(midpoint);
    if der_g > 0
        upper = midpoint;
    elseif der_g < 0
        lower = midpoint;
    else
        % exact minimum found
        upper = midpoint;
        lower = midpoint;
    end
end

minArg = (upper + lower) / 2;
minValue = g(minArg);

end
