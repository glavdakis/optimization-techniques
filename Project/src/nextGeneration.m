function [chr2] = nextGeneration(chr1, selectionCount, I)
% function that creates the next generation from the result of the roulette selection:
% chromosome chr1(I(i), :) is copied selectionCount(i) times

chr2 = zeros(size(chr1));
count = 1;
for i = 1:numel(selectionCount)
    for j = 1:selectionCount(i)
        chr2(count, :) = chr1(I(i), :);
        count = count + 1;
    end
end

end
