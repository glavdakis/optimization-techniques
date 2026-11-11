%% define function 

syms f(x,y);
f(x,y)=(1/3)*x^2+3*y^2;
gradf=gradient(f);
epsilon=0.001; % epsilon for all runs

fsurf(f);
colormap("winter")
xlabel('x_{1}');
ylabel('x_{2}');
zlabel('f(x_{1},x_{2})');
title('$f(x_{1},x_{2})=\frac{1}{3}x_{1}^2+3x_{2}^2$','Interpreter','latex','FontSize',15);
grid on;

%% step=0.1;

step=0.1;
starting_point=[-4 4]; % starting point (-4, 4)
points_i=zeros([1 2]);
points_i(1,:)=starting_point;
k=1;

gradf_value=double(gradf(starting_point(1),starting_point(2)))';

while norm(gradf_value)>=epsilon
    starting_point=starting_point-step*gradf_value;
    points_i(end+1,:)=starting_point;
    gradf_value=double(gradf(starting_point(1),starting_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_i, 'constant \gamma_{k}=0.1, starting point (-4,4)', "x_{1}", "x_{2}");

figure
size_zr=size(points_i);
plot(1:size_zr(1), f(points_i(:, 1), points_i(:, 2)));
title('constant \gamma_{k}=0.1, starting point (-4,4)')
xlabel("number of iterations");
ylabel("function value");

%% step=0.3;

step=0.3;
starting_point=[-4 4]; % starting point (-4, 4)
points_ii=zeros([1 2]);
points_ii(1,:)=starting_point;
k=1;

gradf_value=double(gradf(starting_point(1),starting_point(2)))';

while norm(gradf_value)>=epsilon
    starting_point=starting_point-step*gradf_value;
    points_ii(end+1,:)=starting_point;
    gradf_value=double(gradf(starting_point(1),starting_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_ii, 'constant \gamma_{k}=0.3, starting point (-4,4)', "x_{1}", "x_{2}");

figure
size_zr=size(points_ii);
plot(1:size_zr(1),f(points_ii(:, 1),points_ii(:, 2)));
title('constant \gamma_{k}=0.3, starting point (-4,4)')
xlabel("number of iterations");
ylabel("function value");

%% step=3;

step=3;
starting_point=[-4 4]; % starting point (-4, 4)
points_iii=zeros([1 2]);
points_iii(1,:)=starting_point;
k=1;

gradf_value=double(gradf(starting_point(1),starting_point(2)))';

while norm(gradf_value)>=epsilon
    starting_point=starting_point-step*gradf_value;
    points_iii(end+1,:)=starting_point;
    gradf_value=double(gradf(starting_point(1),starting_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_iii, 'constant \gamma_{k}=3, starting point (-4,4)', "x_{1}", "x_{2}");

figure
size_zr=size(points_iii);
plot(1:size_zr(1),f(points_iii(:, 1),points_iii(:, 2)));
title('constant \gamma_{k}=3, starting point (-4,4)')
xlabel("number of iterations");
ylabel("function value");

%% step=5;

step=5;
starting_point=[-4 4]; % starting point (-4, 4)
points_iv=zeros([1 2]);
points_iv(1,:)=starting_point;
k=1;

gradf_value=double(gradf(starting_point(1),starting_point(2)))';

while norm(gradf_value)>=epsilon
    starting_point=starting_point-step*gradf_value;
    points_iv(end+1,:)=starting_point;
    gradf_value=double(gradf(starting_point(1),starting_point(2)))';
    k=k+1;
end

figure
plot_trajectory(f, points_iv, 'constant \gamma_{k}=5, starting point (-4,4)', "x_{1}", "x_{2}");

figure
size_zr=size(points_iv);
plot(1:size_zr(1),f(points_iv(:, 1),points_iv(:, 2)));
title('constant \gamma_{k}=5, starting point (-4,4)')
xlabel("number of iterations");
ylabel("function value");



