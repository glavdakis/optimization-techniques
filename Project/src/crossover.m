function [offspring1, offspring2] = crossover(parent1, parent2, c)
% function for the crossover process, arithmetic crossover: offspring = (parent1+parent2)/2 (average)
% works for both chromosome sizes (17 flows, or 17 flows and V)

offspring1 = (parent1 + parent2) / 2;
offspring2 = offspring1;

if constraints(offspring1, c) == 0 % if constraints are not satisfied
    offspring1 = parent1; % change rejected
    offspring2 = parent2; % change rejected
end

end
