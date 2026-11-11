function [result] = constraints(d, c)
% function that checks if all the constraints are satisfied (returns 1) or not (returns 0)
% d is a chromosome: the 17 flows x_i, and for the second Genetic Algorithm also V as 18th element

if numel(d) >= 18
    N = d(18); % variable inflow V (Genetic Algorithm 2)
else
    N = 100;   % constant inflow V (Genetic Algorithm 1)
end

% floating-point error
tolerance = 1e-8;

% every flow must be non-negative and below the capacity of its road: 0 <= x_i < c_i
constraint1 = all(d(1:17) >= 0) && all(d(1:17) < c);

% flow conservation at every node (equalities, checked as |left side - right side| < tolerance)
equalities = [d(1) + d(2) + d(3) + d(4) - N, ...
              d(1) - d(5) - d(6), ...
              d(2) - d(7) - d(8), ...
              d(3) + d(8) + d(9) - d(11) - d(12) - d(13), ...
              d(4) - d(9) - d(10), ...
              d(6) + d(7) + d(13) - d(14) - d(15), ...
              d(10) + d(11) - d(17), ...
              d(5) + d(14) - d(16), ...
              d(12) + d(15) + d(16) + d(17) - N];
constraint2 = all(abs(equalities) < tolerance);

% the inflow may vary up to +-15% of 100 (Genetic Algorithm 2)
constraint3 = (N >= 85 - tolerance) && (N <= 115 + tolerance);

result = double(constraint1 && constraint2 && constraint3);

end
