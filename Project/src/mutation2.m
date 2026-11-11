function [mutated] = mutation2(d, c)
% function for the mutation process of the second Genetic Algorithm (chromosome: 17 flows and V)
% With probability 1/2 the flows are mutated as in the first algorithm (constant V).
% Otherwise V changes by a Gaussian amount dV ~ N(0, stdDev^2) within [85, 115]; the change
% goes to one of x1, x2, x3, x4 and the rest x_i are adapted.

stdDev = 1; % standard deviation of the change [veh./min]

if rand < 0.5
    mutated = mutation(d, c);
    return;
end

dV = stdDev * randn;
mutated = d;
mutated(18) = min(max(d(18) + dV, 85), 115); % V within +-15% of 100
dV = mutated(18) - d(18);

vectorToMutate = randi([1, 4]); % which of the x1, x2, x3, x4 takes the change of V
mutated(vectorToMutate) = d(vectorToMutate) + dV;

mutated = adaptToChange(d, mutated); % adjust the rest x_i (i from 5 to 17)

if constraints(mutated, c) == 0 % if constraints are not satisfied
    mutated = d; % change rejected
end

end
