function mutated = distributeChange(mutated, dx, indices, caseOfChange)
% function for distributing the mutation change dx of one of x1, x2, x3, x4 among the other three,
% so that x1 + x2 + x3 + x4 = V still holds (indices: the other three flows)

switch caseOfChange
    case 1
        mutated(indices(1)) = mutated(indices(1)) - dx;
    case 2
        mutated(indices(2)) = mutated(indices(2)) - dx;
    case 3
        mutated(indices(3)) = mutated(indices(3)) - dx;
    case 4
        k = rand;
        mutated(indices(1)) = mutated(indices(1)) - k * dx;
        mutated(indices(2)) = mutated(indices(2)) - (1 - k) * dx;
    case 5
        k = rand;
        mutated(indices(1)) = mutated(indices(1)) - k * dx;
        mutated(indices(3)) = mutated(indices(3)) - (1 - k) * dx;
    case 6
        k = rand;
        mutated(indices(2)) = mutated(indices(2)) - k * dx;
        mutated(indices(3)) = mutated(indices(3)) - (1 - k) * dx;
    case 7
        k = rand(1, 3);
        k = k / sum(k);
        mutated(indices(1)) = mutated(indices(1)) - k(1) * dx;
        mutated(indices(2)) = mutated(indices(2)) - k(2) * dx;
        mutated(indices(3)) = mutated(indices(3)) - k(3) * dx;
end

end
