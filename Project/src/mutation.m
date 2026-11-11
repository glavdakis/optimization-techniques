function [mutated] = mutation(d, c)
% function for the mutation process: one of x1, x2, x3, x4 changes by a Gaussian amount
% dx ~ N(0, stdDev^2), the change is distributed among the other three, and the rest x_i are adapted

stdDev = 1; % standard deviation of the change [veh./min]

caseOfChange = randi([1, 7]); % 7 cases of changes
vectorToMutate = randi([1, 4]); % which of the x1, x2, x3, x4 is mutated
others = setdiff(1:4, vectorToMutate); % the other three

mutationAmount = stdDev * randn; % Gaussian change

mutated = d;
mutated(vectorToMutate) = d(vectorToMutate) + mutationAmount;
mutated = distributeChange(mutated, mutationAmount, others, caseOfChange);

mutated = adaptToChange(d, mutated); % adjust the rest x_i (i from 5 to 17)

if constraints(mutated, c) == 0 % if constraints are not satisfied
    mutated = d; % change rejected
end

end
