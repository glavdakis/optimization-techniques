function updated = adaptToChange(current, newValues)
% function for adapting to the mutation changes on x1, x2, x3, x4
% adjusts the rest xi (i from 5 to 17) to ensure constraints are satisfied

% upper and lower bounds for x1, x2, x3, x4
upperLimits = [54.13, 21.56, 34.08, 49.19];
lowerLimits = zeros(1, 4);

% x1, x2, x3, x4 are within bounds
if all(newValues(1:4) >= lowerLimits & newValues(1:4) < upperLimits)
    
    % adjust x5, x6 (directly dependents on x1)
    if current(1) ~= newValues(1)
        while true
            newValues(5) = rand * newValues(1);
            newValues(6) = newValues(1) - newValues(5);
            if newValues(5) < 33.03 && newValues(6) < 21.84 && newValues(5) >= 0 && newValues(6) >= 0
                break;
            end
        end
    end

    % adjust x7, x8 (directly dependents on x2)
    if current(2) ~= newValues(2)
        while true
            newValues(7) = rand * newValues(2);
            newValues(8) = newValues(2) - newValues(7);
            if newValues(7) < 29.96 && newValues(8) < 24.87 && newValues(7) >= 0 && newValues(8) >= 0
                break;
            end
        end
    end

    % adjust x9, x10 (directly dependents on x4)
    if current(4) ~= newValues(4)
        while true
            newValues(10) = rand * newValues(4);
            newValues(9) = newValues(4) - newValues(10);
            if newValues(9) < 47.24 && newValues(10) < 33.97 && newValues(9) >= 0 && newValues(10) >= 0
                break;
            end
        end
    end

    % % adjust the remaining xi
    if any(current([9, 3, 8]) ~= newValues([9, 3, 8]))
        while true
            sumDependent1 = sum(newValues([9, 3, 8]));
            newValues(11) = rand * sumDependent1;
            newValues(12) = rand * sumDependent1;
            newValues(13) = sumDependent1 - newValues(11) - newValues(12);
            newValues(17) = newValues(10) + newValues(11);
            if newValues(11) < 26.89 && newValues(12) < 32.76 && newValues(13) < 39.98 && newValues(17) < 59.73 && all(newValues([11, 12, 13, 17]) >= 0)
                break;
            end
        end
    end

    % adjust the remaining xi
    if any(current([7, 6, 13]) ~= newValues([7, 6, 13]))
        while true
            sumDependent2 = sum(newValues([6, 7, 13]));
            newValues(14) = rand * 37.12;
            newValues(15) = sumDependent2 - newValues(14);
            newValues(16) = newValues(5) + newValues(14);
            if newValues(14) < 37.12 && newValues(15) < 53.83 && newValues(16) < 61.65 && all(newValues([14, 15, 16]) >= 0)
                break;
            end
        end
    end

    if current(10) ~= newValues(10) || current(11) ~= newValues(11)
        newValues(17) = newValues(10) + newValues(11);
    end
end

updated = newValues;

end

