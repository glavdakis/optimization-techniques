function distributeChange(mutated, dx, indices, caseOfChange)
% function for distributing mutation changes among x1, x2, x3, x4  

switch caseOfChange
    case 1
        mutated(indices(1)) = mutated(indices(1)) - dx;
    case 2
        mutated(indices(2)) = mutated(indices(2)) - dx;
    case 3
        mutated(indices(2)) = mutated(indices(2)) - dx;
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
        k1 = rand;
        k2 = rand;
        k3 = rand;
        sum = k1 + k2+ k3;
        k1 = k1 / sum;
        k2 = k2 / sum;
        k3 = k3 / sum;
        mutated(indices(1)) = mutated(indices(1)) - k1 * dx;
        mutated(indices(2)) = mutated(indices(2)) - k2 * dx;
        mutated(indices(3)) = mutated(indices(1)) - k3 * dx;
end

end