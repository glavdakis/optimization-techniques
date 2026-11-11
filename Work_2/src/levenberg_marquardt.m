% Levenberg-Marquardt: d_k = -(hessian f(x_k) + mu_k I)^(-1) grad f(x_k)

%% define function

syms f(x,y);
f(x,y)=(x^5)*exp(-x^2-y^2);
gradf=gradient(f);
h=hessian(f);
epsilon=0.001; % epsilon for all runs

%% constant step

% start from (0,0)
points_zero_const=descent(f, gradf, h, [0 0], 'lm', 'const', epsilon);

figure
plot_trajectory(f, points_zero_const, 'constant step=0.1, starting point (0,0)', "x", "y");

figure
size_zr=size(points_zero_const);
plot(1:size_zr(1), f(points_zero_const(:, 1), points_zero_const(:, 2)));
title('constant step=0.1, starting point (0,0)')
xlabel("number of iterations");
ylabel("function value");
lm_const_step_zero_iter=size_zr;

% start from (-1,1)
points_one_const=descent(f, gradf, h, [-1 1], 'lm', 'const', epsilon);

figure
plot_trajectory(f, points_one_const, 'constant step=0.1, starting point (-1,1)', "x", "y");

figure
size_zr=size(points_one_const);
plot(1:size_zr(1), f(points_one_const(:, 1), points_one_const(:, 2)));
title('constant step=0.1, starting point (-1,1)')
xlabel("number of iterations");
ylabel("function value");
lm_const_step_one_iter=size_zr;

% start from (1,-1)
points_two_const=descent(f, gradf, h, [1 -1], 'lm', 'const', epsilon);

figure
plot_trajectory(f, points_two_const, 'constant step=0.1, starting point (1,-1)', "x", "y");

figure
size_zr=size(points_two_const);
plot(1:size_zr(1), f(points_two_const(:, 1), points_two_const(:, 2)));
title('constant step=0.1, starting point (1,-1)')
xlabel("number of iterations");
ylabel("function value");
lm_const_step_two_iter=size_zr;

%% step that minimizes f(x_k + gamma_k d_k)

% start from (0,0)
points_zero_min=descent(f, gradf, h, [0 0], 'lm', 'min', epsilon);

figure
plot_trajectory(f, points_zero_min, 'minimizing step, starting point (0,0)', "x", "y");

figure
size_zr=size(points_zero_min);
plot(1:size_zr(1), f(points_zero_min(:, 1), points_zero_min(:, 2)));
title('minimizing step, starting point (0,0)')
xlabel("number of iterations");
ylabel("function value");
lm_min_step_zero_iter=size_zr;

% start from (-1,1)
points_one_min=descent(f, gradf, h, [-1 1], 'lm', 'min', epsilon);

figure
plot_trajectory(f, points_one_min, 'minimizing step, starting point (-1,1)', "x", "y");

figure
size_zr=size(points_one_min);
plot(1:size_zr(1), f(points_one_min(:, 1), points_one_min(:, 2)));
title('minimizing step, starting point (-1,1)')
xlabel("number of iterations");
ylabel("function value");
lm_min_step_one_iter=size_zr;

% start from (1,-1)
points_two_min=descent(f, gradf, h, [1 -1], 'lm', 'min', epsilon);

figure
plot_trajectory(f, points_two_min, 'minimizing step, starting point (1,-1)', "x", "y");

figure
size_zr=size(points_two_min);
plot(1:size_zr(1), f(points_two_min(:, 1), points_two_min(:, 2)));
title('minimizing step, starting point (1,-1)')
xlabel("number of iterations");
ylabel("function value");
lm_min_step_two_iter=size_zr;

%% armijo rule

% start from (0,0)
points_zero_armijo=descent(f, gradf, h, [0 0], 'lm', 'armijo', epsilon);

figure
plot_trajectory(f, points_zero_armijo, 'armijo rule step, starting point (0,0)', "x", "y");

figure
size_zr=size(points_zero_armijo);
plot(1:size_zr(1), f(points_zero_armijo(:, 1), points_zero_armijo(:, 2)));
title('armijo rule step, starting point (0,0)')
xlabel("number of iterations");
ylabel("function value");
lm_armijo_step_zero_iter=size_zr;

% start from (-1,1)
points_one_armijo=descent(f, gradf, h, [-1 1], 'lm', 'armijo', epsilon);

figure
plot_trajectory(f, points_one_armijo, 'armijo rule step, starting point (-1,1)', "x", "y");

figure
size_zr=size(points_one_armijo);
plot(1:size_zr(1), f(points_one_armijo(:, 1), points_one_armijo(:, 2)));
title('armijo rule step, starting point (-1,1)')
xlabel("number of iterations");
ylabel("function value");
lm_armijo_step_one_iter=size_zr;

% start from (1,-1)
points_two_armijo=descent(f, gradf, h, [1 -1], 'lm', 'armijo', epsilon);

figure
plot_trajectory(f, points_two_armijo, 'armijo rule step, starting point (1,-1)', "x", "y");

figure
size_zr=size(points_two_armijo);
plot(1:size_zr(1), f(points_two_armijo(:, 1), points_two_armijo(:, 2)));
title('armijo rule step, starting point (1,-1)')
xlabel("number of iterations");
ylabel("function value");
lm_armijo_step_two_iter=size_zr;
