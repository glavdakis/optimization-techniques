function [selectionCount, indices] = rouletteSelection(fit)
% function for the roulette wheel selection

totalFitness = 0;
for j = 1:10
    totalFitness = totalFitness + fit(j); % total fitness
end

probabilities = zeros(1, 10);
for k = 1:10    
    probabilities(k) = fit(k) / totalFitness; % probabilities
end

[sortedProbabilities, indices] = sort(probabilities); % sort probabilities and retain original indices

cumulativeProbabilities = zeros(1, 10);
cumulativeProbabilities(1) = sortedProbabilities(1);
for i = 2:10
    cumulativeProbabilities(i) = cumulativeProbabilities(i - 1) + sortedProbabilities(i); % calculate cumulative probabilities
end

selectionCount = zeros(10, 1);
% roulette wheel selection
for ii = 1:10 
    randomValue = rand; % random number between 0 and 1

    % check against cumulative probabilities
    if randomValue < cumulativeProbabilities(1)
        selectionCount(1) = selectionCount(1) + 1;
    elseif randomValue >= cumulativeProbabilities(1) && randomValue < cumulativeProbabilities(2)
        selectionCount(2) = selectionCount(2) + 1;
    elseif randomValue >= cumulativeProbabilities(2) && randomValue < cumulativeProbabilities(3)
        selectionCount(3) = selectionCount(3) + 1;
    elseif randomValue >= cumulativeProbabilities(3) && randomValue < cumulativeProbabilities(4)
        selectionCount(4) = selectionCount(4) + 1;
    elseif randomValue >= cumulativeProbabilities(4) && randomValue < cumulativeProbabilities(5)
        selectionCount(5) = selectionCount(5) + 1;
    elseif randomValue >= cumulativeProbabilities(5) && randomValue < cumulativeProbabilities(6)
        selectionCount(6) = selectionCount(6) + 1;
    elseif randomValue >= cumulativeProbabilities(6) && randomValue < cumulativeProbabilities(7)
        selectionCount(7) = selectionCount(7) + 1;
    elseif randomValue >= cumulativeProbabilities(7) && randomValue < cumulativeProbabilities(8)
        selectionCount(8) = selectionCount(8) + 1;
    elseif randomValue >= cumulativeProbabilities(8) && randomValue < cumulativeProbabilities(9)
        selectionCount(9) = selectionCount(9) + 1;
    elseif randomValue >= cumulativeProbabilities(9) && randomValue < cumulativeProbabilities(10)
        selectionCount(10) = selectionCount(10) + 1;
    end
end
    
end
