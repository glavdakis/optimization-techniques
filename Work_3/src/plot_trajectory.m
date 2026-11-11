function plot_trajectory(f, points, titleText, xLabel, yLabel, box)
% Contour plot of f(x,y) with the iterates of an optimization method on top.
%   f       symbolic function f(x,y)
%   points  Nx2 matrix of iterates
%   box     (optional) [xmin xmax ymin ymax] of a rectangular feasible set

fh = matlabFunction(f);
points = points(all(isfinite(points), 2), :); % drop overflowed iterates

% plotting range: default window, extended to include the iterates and the box
% (iterates of a diverging run that are far away are left outside the window)
far = find(any(abs(points) > 1e4, 2), 1);
if ~isempty(far)
    points = points(1:far, :); % stop drawing once the run has clearly diverged
end
shown = points(all(abs(points) <= 50, 2), :);
lo = min([shown; -2.5 -2.5], [], 1);
hi = max([shown; 2.5 2.5], [], 1);
if nargin > 5
    lo = min(lo, box([1 3]));
    hi = max(hi, box([2 4]));
end
pad = 0.05 * (hi - lo);
lo = lo - pad;
hi = hi + pad;

[X, Y] = meshgrid(linspace(lo(1), hi(1), 400), linspace(lo(2), hi(2), 400));
contour(X, Y, fh(X, Y), 30, 'DisplayName', 'level sets of f');
colormap("winter")
colorbar;
hold on

if nargin > 5
    plot(box([1 2 2 1 1]), box([3 3 4 4 3]), 'k--', 'LineWidth', 1.2, 'DisplayName', 'feasible set');
end

plot(points(:, 1), points(:, 2), 'r.-', 'MarkerSize', 12, 'LineWidth', 1, 'DisplayName', 'iterates');
plot(points(1, 1), points(1, 2), 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 8, 'DisplayName', 'start');
plot(points(end, 1), points(end, 2), 'kp', 'MarkerFaceColor', 'r', 'MarkerSize', 12, 'DisplayName', 'end');
hold off

xlim([lo(1) hi(1)]);
ylim([lo(2) hi(2)]);
daspect([1 1 1]);
title(titleText);
xlabel(xLabel);
ylabel(yLabel);
legend('Location', 'best');

end
