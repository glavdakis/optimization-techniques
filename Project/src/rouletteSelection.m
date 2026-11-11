function [selectionCount, indices] = rouletteSelection(fit)
% function for the roulette wheel selection
% fit: fitness values of the current generation (one per chromosome)
% selectionCount(k): how many times the chromosome indices(k) is selected for the next generation

popSize = numel(fit);

probabilities = fit(:)' / sum(fit); % probability of each chromosome, proportional to its fitness
[sortedProbabilities, indices] = sort(probabilities); % sort probabilities and retain original indices
cumulativeProbabilities = cumsum(sortedProbabilities);

selectionCount = zeros(popSize, 1);

% roulette wheel selection: spin the wheel once for every place of the next generation
for ii = 1:popSize
    randomValue = rand; % random number between 0 and 1
    k = find(randomValue < cumulativeProbabilities, 1);
    if isempty(k)
        k = popSize; % rounding error in the last cumulative probability
    end
    selectionCount(k) = selectionCount(k) + 1;
end

end
