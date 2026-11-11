syms f(x,y);
f(x,y)=(x^5)*exp(-x^2-y^2);

fsurf(f);
colormap("winter")
xlabel('x');
ylabel('y');
zlabel('f(x,y)');
title('$f(x,y)=x^5 e^{-x^2-y^2}$','Interpreter','latex','FontSize',20);
grid on;