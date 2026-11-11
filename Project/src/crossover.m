function [offspring1, offspring2] = crossover(parent1, parent2, c, mode, N)
% function for the crossover process, arithmetic crossover: offspring = (parent1+parent2)/2 (average) 

offspring1 = zeros(1);
offspring2 = zeros(1);

if mode == 1 % Genetic Algorithm 
    for i = 1:17
        offspring1(i) = (parent1(i) + parent2(i)) / 2;
        offspring2(i) = (parent1(i) + parent2(i)) / 2;
    end
elseif mode == 2  % Genetic Algorithm 2
    for i = 1:18
        offspring1(i) = (parent1(i) + parent2(i)) / 2;
        offspring2(i) = (parent1(i) + parent2(i)) / 2;
    end
end

if constraints(offspring1, c, N) == 0 || constraints(offspring2, c, N) == 0 % if constraints are not satisfied 
    offspring1 = parent1; % change rejected
    offspring2 = parent2; % change rejected
end

end