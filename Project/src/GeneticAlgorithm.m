function [] = GeneticAlgorithm()
% main function for the first Genetic Algorithm

clear;
clc;

% a and c values
a = [1.25 1.25 1.25 1.25 1.25 1.5 1.5 1.5 1.5 1.5 1 1 1 1 1 1 1];
c = [54.13 21.56 34.08 49.19 33.03 21.84 29.96 24.87 47.24 33.97 26.89 32.76 39.98 37.12 53.83 61.65 59.73];

% initial population
for i = 1:1:10 
     chr1(i, :) = firstGeneration;
end

% fitness function;
fitnessfunction = fitnessFunction(a, c, chr1);

% roulette selection
[sum, I] = rouletteSelection(fitnessfunction);

% next Generation
i = 0;
while true
    i = i + 1;
    chr2 = nextGeneration(chr1, sum, I, 1, 100);
    
    % evaluation
    fitnessfunction2(i, :) = fitnessFunction(a, c, chr2);
    
    % mutation
    int = randi([1 10]);
    chr2(int, :) = mutation(chr2(int, :), c);
    
    % crossover
    int2 = randi([1 10]);
    int3 = randi([1 10]);
    d1 = chr2(int2, :);
    d2 = chr2(int3, :);
    [chr2(int2, :), chr2(int3, :)] = crossover(d1, d2, c, 1, 100);
    
    % termination condition
    if i > 1
        if norm((fitnessfunction2(i - 1, :) - fitnessfunction2(i, :))/fitnessfunction2(i - 1, :)) < 1e-20
            break;
        end
    end
    
    % roulette selection
    [sum, I] = rouletteSelection(fitnessfunction2);
    chr1 = chr2;
end

disp("The number of iterations is " + i);
disp("The final chromosome is");
disp(chr2(10, :)); 

% optimal time calculations
time = 0;
for l = 1:1:17
    time = time + a(l) * chr2(10, l)/(1 - (chr2(10, l)/c(l)));
end
disp("Total time is " + time);

% last check that all constraints are satisfied
if constraints(chr2(1, :), c, 100) == 1
    disp("Solution is valid.");
else
    disp("Solution is invalid.");
end

% plot
plot(fitnessfunction2(1, :), '--o');        
xlabel("Generation");
ylabel("Fitness value");

end

