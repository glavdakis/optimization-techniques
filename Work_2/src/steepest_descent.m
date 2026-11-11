%% define function 

syms f(x,y);
f(x,y)=(x^5)*exp(-x^2-y^2);
gradf=gradient(f);
epsilon=0.001; % epsilon for all runs

%% constant step

step=0.1;

% start from (0, 0)
f_point=[0 0];
points_zero_const=zeros([1 2]);
points_zero_const(1,:)=f_point;
k=1;

gradf_value=double(gradf(f_point(1),f_point(2)))';

while norm(gradf_value)>=epsilon
    f_point=f_point-step*gradf_value;
    points_zero_const(end+1,:)=f_point;
    gradf_value=double(gradf(f_point(1),f_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_zero_const, 'constant step=0.1, starting point (0,0)', "x", "y");

figure
size_zr=size(points_zero_const);
plot(1:size_zr(1), f(points_zero_const(:, 1), points_zero_const(:, 2)));
title('constant step=0.1, starting point (0,0)')
xlabel("number of iterations");
ylabel("function value");
sd_const_step_zero_iter=size_zr;

% start from (-1, 1)
f_point=[-1 1];
points_one_const=zeros([1 2]);
points_one_const(1,:)=f_point;
k=1;

gradf_value=double(gradf(f_point(1),f_point(2)))';

while norm(gradf_value)>=epsilon
    f_point=f_point-step*gradf_value;
    points_one_const(end+1,:)=f_point;
    gradf_value=double(gradf(f_point(1),f_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_one_const, 'constant step=0.1, starting point (-1,1)', "x", "y");

figure
size_zr=size(points_one_const);
plot(1:size_zr(1),f(points_one_const(:, 1),points_one_const(:, 2)));
title('constant step=0.1, starting point (-1,1)')
xlabel("number of iterations");
ylabel("function value");
sd_const_step_one_iter=size_zr;

% start from (1, -1)
f_point = [1 -1];
points_two_const=zeros([1 2]);
points_two_const(1,:)=f_point;
k=1;

gradf_value=double(gradf(f_point(1),f_point(2)))';

while norm(gradf_value)>=epsilon
    f_point=f_point-step*gradf_value;
    points_two_const(end+1,:)=f_point;
    gradf_value=double(gradf(f_point(1), f_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_two_const, 'constant step=0.1, starting point (1,-1)', "x", "y");

figure
size_zr=size(points_two_const);
plot(1:size_zr(1), f(points_two_const(:, 1), points_two_const(:, 2)));
title('constant step=0.1, starting point (1,-1)')
xlabel("number of iterations");
ylabel("function value");
sd_const_step_two_iter=size_zr;

%% step that minimizes condition

% start from (0, 0)
f_point=[0 0];
points_zero_min=zeros([1 2]);
points_zero_min(1,:)=f_point;
k=1;

gradf_value=double(gradf(f_point(1),f_point(2)))';
[step, ~]=minimize_gammafunction(f,f_point, gradf_value);

while norm(gradf_value)>=epsilon
    f_point=f_point-step*gradf_value;
    points_zero_min(end+1,:)=f_point;
    gradf_value = double(gradf(f_point(1),f_point(2)))';
    [step,~]=minimize_gammafunction(f,f_point,gradf_value);
    k=k+1;
end

figure
plot_trajectory(f, points_zero_min, 'minimizing step, starting point (0,0)', "x", "y");

figure
size_zr=size(points_zero_min);
plot(1:size_zr(1), f(points_zero_min(:, 1), points_zero_min(:, 2)));
title('minimizing step, starting point (0,0)')
xlabel("number of iterations");
ylabel("function value");
sd_min_step_zero_iter=size_zr;

% start from (-1, 1)
f_point=[-1 1];
points_one_min=zeros([1 2]);
points_one_min(1,:)=f_point;
k=1;

gradf_value=double(gradf(f_point(1), f_point(2)))';
[step, ~]=minimize_gammafunction(f, f_point, gradf_value);

while norm(gradf_value)>=epsilon
    f_point=f_point-step*gradf_value;
    points_one_min(end+1,:)=f_point;
    gradf_value=double(gradf(f_point(1),f_point(2)))';
    [step, ~]=minimize_gammafunction(f,f_point,gradf_value);
    k=k+1;
end

figure
plot_trajectory(f, points_one_min, 'minimizing step, starting point (-1,1)', "x", "y");

figure
size_zr=size(points_one_min);
plot(1:size_zr(1), f(points_one_min(:, 1), points_one_min(:, 2)));
title('minimizing step, starting point (-1,1)')
xlabel("number of iterations");
ylabel("function value");
xlim([0 15]);
sd_min_step_one_iter=size_zr;

% start from (1, -1)
f_point=[1 -1];
points_two_min=zeros([1 2]);
points_two_min(1,:)=f_point;
k=1;

gradf_value=double(gradf(f_point(1),f_point(2)))';
[step,~]=minimize_gammafunction(f,f_point,gradf_value);

while norm(gradf_value)>=epsilon
    f_point=f_point-step*gradf_value;
    points_two_min(end+1,:)=f_point;
    gradf_value=double(gradf(f_point(1),f_point(2)))';
    [step,~]=minimize_gammafunction(f,f_point,gradf_value);
    k=k+1;
end

figure
plot_trajectory(f, points_two_min, 'minimizing step, starting point (1,-1)', "x", "y");

figure
size_zr=size(points_two_min);
plot(1:size_zr(1), f(points_two_min(:, 1), points_two_min(:, 2)));
title('minimizing step, starting point (1,-1)')
xlabel("number of iterations");
ylabel("function value");
sd_min_step_two_iter=size_zr;

%% armijo rule

% constants 
a=0.0001;
b=0.4;
s=1; % initial step

% start from (0, 0)
f_point=[0 0];
points_zero_arm=zeros([1 2]);
points_zero_arm(1,:)=f_point;
k=1;
step=1; % gamma

gradf_value=double(gradf(f_point(1),f_point(2)))';

while norm(gradf_value)>=epsilon
    f_point_old=f_point;
    f_point=f_point-step*gradf_value;
    mk=1; % recompute step
    while f(f_point_old(1), f_point_old(2)) - f(f_point(1), f_point(2)) < -a*b^mk*s * (step*gradf_value*(gradf_value'))
          mk=mk+1; 
    end

    step=s*b^mk;
    points_zero_arm(end+1,:)=f_point;
    gradf_value=double(gradf(f_point(1),f_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_zero_arm, 'armijo rule step, starting point (0,0)', "x", "y");

figure
size_zr=size(points_zero_arm);
plot(1:size_zr(1), f(points_zero_arm(:, 1), points_zero_arm(:, 2)));
title('armijo rule step, starting point (0,0)')
xlabel("number of iterations");
ylabel("function value");
sd_armijo_step_zero_iter=size_zr;

% start from (-1, 1)
f_point=[-1 1];
points_one_arm=zeros([1 2]);
points_one_arm(1,:)=f_point;
k=1;
step=1; % gamma 

gradf_value=double(gradf(f_point(1),f_point(2)))';

while norm(gradf_value)>=epsilon
    f_point_old=f_point;
    f_point=f_point-step*gradf_value;
    mk=1; % recompute step
    while f(f_point_old(1), f_point_old(2)) - f(f_point(1), f_point(2)) < -a*b^mk*s * (step*gradf_value*(gradf_value')) 
        mk=mk+1; 
    end

    step=s*b^mk;
    points_one_arm(end+1,:)=f_point;
    gradf_value=double(gradf(f_point(1), f_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_one_arm, 'armijo rule step, starting point (-1,1)', "x", "y");

figure
size_zr=size(points_one_arm);
plot(1:size_zr(1), f(points_one_arm(:, 1), points_one_arm(:, 2)));
title('armijo rule step, starting point (-1,1)')
xlabel("number of iterations");
ylabel("function value");
xlim([0 12]);
sd_armijo_step_one_iter=size_zr;

% start from (1, -1)
f_point=[1 -1];
points_two_arm=zeros([1 2]);
points_two_arm(1, :)=f_point;
k=1;
step=1; % gamma 

gradf_value=double(gradf(f_point(1), f_point(2)))';

while norm(gradf_value)>=epsilon
    f_point_old=f_point;
    f_point=f_point-step*gradf_value;
    mk=1; % recompute step
    while f(f_point_old(1), f_point_old(2)) - f(f_point(1), f_point(2)) < -a*b^mk*s * (step*gradf_value*(gradf_value'))
        mk=mk+1; 
    end

    step=s*b^mk;
    points_two_arm(end+1,:)=f_point;
    gradf_value = double(gradf(f_point(1), f_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_two_arm, 'armijo rule step, starting point (1,-1)', "x", "y");

figure
size_zr=size(points_two_arm);
plot(1:size_zr(1), f(points_two_arm(:, 1), points_two_arm(:, 2)));
title('armijo rule step, starting point (1,-1)')
xlabel("number of iterations");
ylabel("function value");
sd_armijo_step_two_iter=size_zr;



