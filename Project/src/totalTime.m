function [T] = totalTime(a, c, x, V)
% total travel time of the network per vehicle [min]:
%   T = (1/V) * sum_i x_i * T_i(x_i),  T_i(x_i) = t_i + a_i * x_i / (1 - x_i/c_i)
% The constant times t_i are not given, so they are taken as t_i = 0.

if any(x >= c)
    T = Inf; % infinite travel time when a road reaches its capacity
    return;
end

Ti = a .* x ./ (1 - x ./ c);
T = sum(x .* Ti) / V;

end
