function [best, bestTime] = GeneticAlgorithm2()
% main function for the second Genetic Algorithm (inflow V within +-15% of 100, as 18th gene)

% a and c values
a = [1.25 1.25 1.25 1.25 1.25 1.5 1.5 1.5 1.5 1.5 1 1 1 1 1 1 1];
c = [54.13 21.56 34.08 49.19 33.03 21.84 29.96 24.87 47.24 33.97 26.89 32.76 39.98 37.12 53.83 61.65 59.73];

% parameters
popSize = 10;          % chromosomes per generation
epsilon = 1e-6;        % termination accuracy
patience = 500;        % generations with relative change of the best fitness < epsilon before stopping
maxGenerations = 20000;
pm = 0.3;              % mutation probability of each chromosome
pc = 0.6;              % crossover probability of each pair of chromosomes

% initial population, with random V in [85, 115]
chr = zeros(popSize, 18);
for i = 1:popSize
    chr(i, :) = firstGeneration2(85 + 30 * rand);
end

bestFitness = zeros(maxGenerations, 1);
meanFitness = zeros(maxGenerations, 1);
stall = 0;

for gen = 1:maxGenerations
    % evaluation
    fit = fitnessFunction(a, c, chr);
    [bestFitness(gen), iBest] = max(fit);
    meanFitness(gen) = mean(fit);
    elite = chr(iBest, :);

    % termination condition: |f_best(k-1) - f_best(k)| / f_best(k-1) < epsilon for patience generations
    if gen > 1
        if abs((bestFitness(gen - 1) - bestFitness(gen)) / bestFitness(gen - 1)) < epsilon
            stall = stall + 1;
        else
            stall = 0;
        end
        if stall >= patience
            break;
        end
    end

    % roulette selection
    [selectionCount, I] = rouletteSelection(fit);
    chr = nextGeneration(chr, selectionCount, I);

    % mutation: every chromosome is mutated with probability pm
    for k = 1:popSize
        if rand < pm
            chr(k, :) = mutation2(chr(k, :), c);
        end
    end

    % crossover: random pairs of chromosomes are crossed with probability pc
    pairs = randperm(popSize);
    for k = 1:2:popSize - 1
        if rand < pc
            k1 = pairs(k);
            k2 = pairs(k + 1);
            [chr(k1, :), chr(k2, :)] = crossover(chr(k1, :), chr(k2, :), c);
        end
    end

    % elitism: the best chromosome replaces the worst one, so it is never lost
    newFit = fitnessFunction(a, c, chr);
    [~, iWorst] = min(newFit);
    chr(iWorst, :) = elite;
end

bestFitness = bestFitness(1:gen);
meanFitness = meanFitness(1:gen);
best = elite;
bestTime = totalTime(a, c, best(1:17), best(18));

disp("The number of generations is " + gen);
disp("The best chromosome is");
disp(round(best(1:17), 2));
disp("V is " + best(18));
disp("The total travel time per vehicle is " + bestTime + " min");

% last check that all constraints are satisfied
if constraints(best, c) == 1
    disp("Solution is valid.");
else
    disp("Solution is invalid.");
end

% plot
figure
plot(1:gen, bestFitness, 'LineWidth', 1.2);
hold on
plot(1:gen, meanFitness, '--', 'LineWidth', 1);
hold off
xlabel("Generation");
ylabel("Fitness value");
legend("best chromosome", "population mean", 'Location', 'southeast');
grid on

end
