%% define function 

syms f(x,y);
f(x,y)=(x^5)*exp(-x^2-y^2);
h=hessian(f);
gradf=gradient(f);
epsilon=0.001; % epsilon for all runs
f_point=[1 -1];
e=eig(h(f_point(1), f_point(2)));

%% constant step

step=0.1;

% start from (-1.7, 0.2)
f_point=[-1.7 0.2];
points_zero_const=zeros([1 2]);
points_zero_const(1,:)=f_point;
k=1;

gradf_value=double(gradf(f_point(1), f_point(2)))';

while norm(gradf_value)>=epsilon
    f_point=f_point-step*(double(inv(h(f_point(1), f_point(2))))*gradf_value')';
    points_zero_const(end+1,:)=f_point;
    gradf_value=double(gradf(f_point(1), f_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_zero_const, 'constant step=0.1, starting point (-1.7, 0.2)', "x", "y");

figure
size_zr=size(points_zero_const);
plot(1:size_zr(1), f(points_zero_const(:, 1), points_zero_const(:, 2)));
title('constant step=0.1, starting point (-1.7, 0.2)')
xlabel("number of iterations");
ylabel("function value");

%% step that minimizes condition

% start from (-1.7, 0.2)
f_point=[-1.7 0.2];
points_zero_min=zeros([1 2]);
points_zero_min(1, :)=f_point;
k=1;

gradf_value=double(gradf(f_point(1), f_point(2)))';
[step, ~]=minimize_gammafunction(f, f_point, gradf_value);

while norm(gradf_value)>=epsilon
    f_point=f_point-step*(double(inv(h(f_point(1), f_point(2))))*gradf_value')';
    points_zero_min(end+1,:)=f_point;
    gradf_value=double(gradf(f_point(1), f_point(2)))';
    [step, ~]=minimize_gammafunction(f, f_point,( double(inv( h(f_point(1), f_point(2))) )*gradf_value')');
    k=k+1;
end

figure
plot_trajectory(f, points_zero_min, 'minimizing step, starting point (-1.7, 0.2)', "x", "y");

figure
size_zr=size(points_zero_min);
plot(1:size_zr(1), f(points_zero_min(:, 1), points_zero_min(:, 2)));
title('minimizing step, starting point (-1.7, 0.2)')
xlabel("number of iterations");
ylabel("function value");


%% armijo rule

% constants 
a=0.0001;
b=0.4;
s=1;

% start from (-1.7, 0.2)
f_point=[-1.7 0.2];
points_zero_arm=zeros([1 2]);
points_zero_arm(1,:)=f_point;
k=1;
step=1; % initial step

gradf_value=double(gradf(f_point(1), f_point(2)))';

while norm(gradf_value)>=epsilon
    f_point_old=f_point;
    f_point=f_point-step*(double(inv(h(f_point(1), f_point(2))))*gradf_value')';
    mk=1;
    while f(f_point_old(1), f_point_old(2)) - f(f_point(1), f_point(2)) < -a*b^mk*s * (step*gradf_value*(gradf_value')) 
          mk=mk+1; % recompute step
    end
    step=s*b^mk;
    points_zero_arm(end+1,:)=f_point;
    gradf_value=double(gradf(f_point(1), f_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_zero_arm, 'armijo rule step, starting point (-1.7, 0.2)', "x", "y");

figure
size_zr=size(points_zero_arm);
plot(1:size_zr(1), f(points_zero_arm(:, 1), points_zero_arm(:, 2)));
title('armijo rule step, starting point (-1.7, 0.2)')
xlabel("number of iterations");
ylabel("function value");

