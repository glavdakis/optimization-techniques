function [f] = fitnessFunction(a, c, chr)
% fitness function: 1 / (total travel time of the network per vehicle)
% chr has one chromosome per row: the 17 flows x_i and, for the second Genetic Algorithm, V as 18th column

popSize = size(chr, 1);
f = zeros(popSize, 1);

for j = 1:popSize
    x = chr(j, 1:17);
    if size(chr, 2) >= 18
        V = chr(j, 18);
    else
        V = 100;
    end
    f(j) = 1 / totalTime(a, c, x, V);
end

end
