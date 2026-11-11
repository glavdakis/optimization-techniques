function [result] = constraints(d, c, N) 
% function that checks if constraints are satisfied 

result = 0;
constraint1 = 0;
constraint2 = 0;

% check if any d(i) exceeds c(i)
for i = 1:17
    if d(i) < c(i)
        constraint1 = 1;
        break;
    end
end

% floating-point error
tolerance = 1e-8;

% check all other constraints
if d(1) + d(2) + d(3) + d(4) - N < tolerance && d(1) - d(5) - d(6) < tolerance && d(2) - d(8) - d(7) < tolerance && d(4) - d(9) - d(10) < tolerance && ...
   d(3) + d(8) + d(9) - d(13) - d(11) - d(12) < tolerance && d(13) + d(7) + d(6) - d(14) - d(15) < tolerance && d(14) + d(5) - d(16) < tolerance && ...
   d(11) + d(10) - d(17) < tolerance && d(17) + d(12) + d(15) + d(16) - N < tolerance
    constraint2 = 1;
end

% result if both checks pass
if constraint1 == 1 && constraint2 == 1
    result = 1;
end

end