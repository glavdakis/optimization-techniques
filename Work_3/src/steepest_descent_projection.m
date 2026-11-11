%% define function 

syms f(x,y);
f(x,y)=(1/3)*x^2+3*y^2;
gradf=gradient(f);
epsilon=0.01; % epsilon for all runs
% optimization constraints
xlimits=[-10 5]; 
ylimits=[-8 12];

%% Exercise 2

sk=5;
step=0.5;
starting_point=[5 -5];
points_2=zeros([1 2]);
points_2(1,:)=starting_point;
k=1;

gradf_value=double(gradf(starting_point(1), starting_point(2)))';

while (norm(gradf_value) >= epsilon) && (k <= 50)
    z=starting_point-sk*gradf_value;
    [xbar, ybar]=projection(z, xlimits, ylimits);
    starting_point=starting_point+step*([xbar, ybar]-starting_point);
    points_2(end+1,:)=starting_point;
    gradf_value=double(gradf(starting_point(1), starting_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_2, 'constant \gamma_{k}=0.5, s_{k}=5, starting point=(5, -5)', "x_{1}", "x_{2}", [xlimits ylimits]);

figure
size_zr=size(points_2(:, :));
plot(1:size_zr(1), f(points_2(:, 1), points_2(:, 2)));
title('constant \gamma_{k}=0.5, s_{k}=5, starting point=(5, -5)')
xlabel("number of iterations");
ylabel("function value");

%% Exercise 3

sk=15;
step=0.1;
starting_point=[-5 10];
points_3=zeros([1 2]);
points_3(1,:)=starting_point;
k=1;

gradf_value=double(gradf(starting_point(1), starting_point(2)))';

while (norm(gradf_value) >= epsilon) 
    z=starting_point-sk*gradf_value;
    [xbar, ybar]=projection(z, xlimits, ylimits);
    starting_point=starting_point+step*([xbar, ybar]-starting_point);
    points_3(end+1,:)=starting_point;
    gradf_value=double(gradf(starting_point(1), starting_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_3, 'constant \gamma_{k}=0.1, s_{k}=15, starting point=(-5, 10)', "x_{1}", "x_{2}", [xlimits ylimits]);

figure
size_zr=size(points_3(:, :));
plot(1:size_zr(1), f(points_3(:, 1), points_3(:, 2)));
title('constant \gamma_{k}=0.1, s_{k}=15, starting point=(-5, 10)')
xlabel("number of iterations");
ylabel("function value");

%% Exercise 4

sk=0.1;
step=0.2;
starting_point=[8 -10];
points_4=zeros([1 2]);
points_4(1,:)=starting_point;
k=1;

gradf_value=double(gradf(starting_point(1), starting_point(2)))';

while (norm(gradf_value) >= epsilon) 
    z=starting_point-sk*gradf_value;
    [xbar, ybar]=projection(z, xlimits, ylimits);
    starting_point=starting_point+step*([xbar, ybar]-starting_point);
    points_4(end+1,:)=starting_point;
    gradf_value=double(gradf(starting_point(1), starting_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_4, 'constant \gamma_{k}=0.2, s_{k}=0.1, starting point=(8, -10)', "x_{1}", "x_{2}", [xlimits ylimits]);

figure
size_zr=size(points_4(:, :));
plot(1:size_zr(1), f(points_4(:, 1), points_4(:, 2)));
title('constant \gamma_{k}=0.2, s_{k}=0.1, starting point=(8, -10)')
xlabel("number of iterations");
ylabel("function value");



