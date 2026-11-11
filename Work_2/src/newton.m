% Newton: d_k = -(hessian f(x_k))^(-1) grad f(x_k)

%% define function

syms f(x,y);
f(x,y)=(x^5)*exp(-x^2-y^2);
gradf=gradient(f);
h=hessian(f);
epsilon=0.001; % epsilon for all runs

% the hessian is not positive definite at the starting points of the other methods
for p = [0 0; -1 1; 1 -1; -1.7 0.2]'
    disp("eigenvalues of the hessian at (" + p(1) + "," + p(2) + "): " + mat2str(double(eig(h(p(1), p(2)))).', 4));
end

%% constant step

% start from (-1.7, 0.2)
points_zero_const=descent(f, gradf, h, [-1.7 0.2], 'newton', 'const', epsilon);

figure
plot_trajectory(f, points_zero_const, 'constant step=0.1, starting point (-1.7, 0.2)', "x", "y");

figure
size_zr=size(points_zero_const);
plot(1:size_zr(1), f(points_zero_const(:, 1), points_zero_const(:, 2)));
title('constant step=0.1, starting point (-1.7, 0.2)')
xlabel("number of iterations");
ylabel("function value");

%% step that minimizes f(x_k + gamma_k d_k)

% start from (-1.7, 0.2)
points_zero_min=descent(f, gradf, h, [-1.7 0.2], 'newton', 'min', epsilon);

figure
plot_trajectory(f, points_zero_min, 'minimizing step, starting point (-1.7, 0.2)', "x", "y");

figure
size_zr=size(points_zero_min);
plot(1:size_zr(1), f(points_zero_min(:, 1), points_zero_min(:, 2)));
title('minimizing step, starting point (-1.7, 0.2)')
xlabel("number of iterations");
ylabel("function value");

%% armijo rule

% start from (-1.7, 0.2)
points_zero_armijo=descent(f, gradf, h, [-1.7 0.2], 'newton', 'armijo', epsilon);

figure
plot_trajectory(f, points_zero_armijo, 'armijo rule step, starting point (-1.7, 0.2)', "x", "y");

figure
size_zr=size(points_zero_armijo);
plot(1:size_zr(1), f(points_zero_armijo(:, 1), points_zero_armijo(:, 2)));
title('armijo rule step, starting point (-1.7, 0.2)')
xlabel("number of iterations");
ylabel("function value");
