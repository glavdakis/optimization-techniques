function [mutated] = mutation(d, c)
% function for mutation process on Genetic Algorithm 2, applies mutation to an individual based on normal distribution sampling

mutated = d;
mean = 0;
stdDev = 1;

caseOfChange = randi([1, 7]); % 7 cases of changes
vectorToMutate = randi([1, 4]); % which of the x1, x2, x3, x4 is mutated

mutationAmount = (rand - 0.5) * normpdf(d(vectorToMutate), mean, stdDev);

switch vectorToMutate
    case 1 % mutate x1 and change the rest
        mutated(1) = d(1) + mutationAmount;
        distributeChange(mutated, mutationAmount, [2, 3, 4], caseOfChange);
    case 2 % mutate x2 and change the rest
        mutated(2) = d(2) + mutationAmount;
        distributeChange(mutated, mutationAmount, [1, 3, 4], caseOfChange);
    case 3 % mutate x3 and change the rest
        mutated(3) = d(3) + mutationAmount;
        distributeChange(mutated, mutationAmount, [1, 2, 4], caseOfChange);
    case 4 % mutate x4 and change the rest
        mutated(4) = d(4) + mutationAmount;
        distributeChange(mutated, mutationAmount, [1, 2, 3], caseOfChange);    
end

mutated = adaptToChange(d, mutated); % adjust the rest xi (i from 5 to 17)

if constraints(mutated, c, 100) == 0 % if constraints are not satisfied 
    mutated = d; % change rejected
end

end