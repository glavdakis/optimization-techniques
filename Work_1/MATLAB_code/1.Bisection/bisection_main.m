syms x

f_1 = (x-2)^2+x*log(x+3);
f_2 = exp(-2*x)+(x-2)^2;
f_3 = exp(x)*(x^3-1)+(x-1)*sin(x);

%% constant l

% func1
size=50;
k=zeros(size,1); 
e=zeros(size,1); 
i=0;
for epsilon=linspace(0.00009,0.0049,size)
    i=i+1;
    [a,b,k(i),e(i),lambda]=bisection(f_1,epsilon,0.01,-1,3);
end
subplot(3,1,1)
plot(e,2*(k-1),'-r','LineWidth',1)
title('$f_1(x)=(x-2)^2+x\cdot ln(x+3)$','Interpreter','latex','FontSize',20);
xlabel('distance \epsilon');
ylabel('number of iterations');

% func2
k=zeros(size,1); 
e=zeros(size,1);
i=0;
for epsilon=linspace(0.00009,0.0049,size)
    i=i+1;
    [a,b,k(i),e(i),lambda]=bisection(f_2,epsilon,0.01,-1,3);
end
subplot(3,1,2)
plot(e,2*(k-1),'-r','LineWidth',1)
title('$f_2(x)=e^{-2x}+(x-2)^2$','Interpreter','latex','FontSize',20);
xlabel('distance \epsilon');
ylabel('number of iterations');

% func3
k=zeros(size,1); 
e=zeros(size,1);
i=0;
for epsilon=linspace(0.00009,0.0049,size)
    i=i+1;
    [a,b,k(i),e(i),lambda]=bisection(f_3,epsilon,0.01,-1,3);
end
subplot(3,1,3)
plot(e,2*(k-1),'-r','LineWidth',1)
title('$f_3(x)=e^x\cdot (x^3-1)+(x-1)\cdot sin(x)$','Interpreter','latex','FontSize',20);
xlabel('distance \epsilon');
ylabel('number of iterations');

%% constant e

% func1
size=100;
k=zeros(size,1); 
l=zeros(size,1);
e=0.001; 
i=0;
for lamda=linspace(0.005,0.1,size)
    i=i+1;
    [a,b,k(i),e,l(i)]=bisection(f_1,e,lamda,-1,3);
end
subplot(3,1,1)
plot(l,2*(k-1),'-r','LineWidth',1)
title('$f_1(x)=(x-2)^2+x\cdot ln(x+3)$','Interpreter','latex','FontSize',20);
xlabel('final search range l');
ylabel('number of iterations');

% func2
k=zeros(size,1); 
l=zeros(size,1);
e=0.001; 
i=0;
for lamda=linspace(0.005,0.1,size)
    i=i+1;
    [a,b,k(i),e,l(i)]=bisection(f_2,e,lamda,-1,3);
end
subplot(3,1,2)
plot(l,2*(k-1),'-r','LineWidth',1)
title('$f_2(x)=e^{-2x}+(x-2)^2$','Interpreter','latex','FontSize',20);
xlabel('final search range l');
ylabel('number of iterations');

% func3
k=zeros(size,1); 
l=zeros(size,1);
e=0.001; 
i=0;
for lamda=linspace(0.005,0.1,size)
    i=i+1;
    [a,b,k(i),e,l(i)]=bisection(f_3,e,lamda,-1,3);
end
subplot(3,1,3)
plot(l,2*(k-1),'-r','LineWidth',1)
title('$f_3(x)=e^x\cdot (x^3-1)+(x-1)\cdot sin(x)$','Interpreter','latex','FontSize',20);
xlabel('final search range l');
ylabel('number of iterations');

%% change of intervals

% func1

% l=0.005
epsilon=0.001;
figure;
subplot(3,1,1)
[a,b,k] = bisection(f_1,epsilon,0.005,-1,3);
for i=0:1:k-1
    plot(i,a(i+1),'o','Color','blue')
    hold on
    plot(i,b(i+1),'*','Color','red')
end
xlim([0 16]);
title('$f_1(x)=(x-2)^2+x\cdot ln(x+3)$','Interpreter','latex','FontSize',20);
xlabel('number of iterations, l=0.005');
ylabel('intervals [a,b]');
legend('a_k','b_k');

% l=0.01
subplot(3,1,2)
[a,b,k] = bisection(f_1,epsilon,0.01,-1,3);
for i=0:1:k-1
    plot(i,a(i+1),'o','Color','blue')
    hold on
    plot(i,b(i+1),'*','Color','red')
end
xlim([0 16])
xlabel('number of iterations, l=0.01');
ylabel('intervals [a,b]');
legend('a_k','b_k');

% l=0.02
subplot(3,1,3)  
[a,b,k] = bisection(f_1,epsilon,0.02,-1,3);
for i=0:1:k-1
    plot(i,a(i+1),'o','Color','blue')
    hold on
    plot(i,b(i+1),'*','Color','red')
end
xlim([0 16])
xlabel('number of iterations, l=0.02');
ylabel('intervals [a,b]');
legend('a_k','b_k');

% func2

% l=0.005
figure;
subplot(3,1,1)
[a,b,k] = bisection(f_2,epsilon,0.005,-1,3);
for i=0:1:k-1
   plot(i,a(i+1),'o','Color','blue')
    hold on
    plot(i,b(i+1),'*','Color','red')
end
xlim([0 16])
title('$f_2(x)=e^{-2x}+(x-2)^2$','Interpreter','latex','FontSize',20);
xlabel('number of iterations, l=0.005');
ylabel('intervals [a,b]');
legend('a_k','b_k');

% l=0.01
subplot(3,1,2)
[a,b,k] = bisection(f_2,epsilon,0.01,-1,3);
for i=0:1:k-1
    plot(i,a(i+1),'o','Color','blue')
    hold on
    plot(i,b(i+1),'*','Color','red')
end
xlim([0 16])
xlabel('number of iterations, l=0.01');
ylabel('intervals [a,b]');
legend('a_k','b_k');

% l=0.02
subplot(3,1,3)  
[a,b,k] = bisection(f_2,epsilon,0.02,-1,3);
for i=0:1:k-1
   plot(i,a(i+1),'o','Color','blue')
   hold on
   plot(i,b(i+1),'*','Color','red')
end   
xlim([0 16])
xlabel('number of iterations, l=0.02');
ylabel('intervals [a,b]');
legend('a_k','b_k');

% func3

% l=0.005
epsilon = 0.001;
figure;
subplot(3,1,1)
[a,b,k] = bisection(f_3,epsilon,0.005,-1,3);
for i=0:1:k-1
    plot(i,a(i+1),'o','Color','blue')
    hold on
    plot(i,b(i+1),'*','Color','red')
end
xlim([0 16])
title('$f_3(x)=e^x\cdot (x^3-1)+(x-1)\cdot sin(x)$','Interpreter','latex','FontSize',20);
xlabel('number of iterations, l=0.005');
ylabel('intervals [a,b]');
legend('a_k','b_k');

% l=0.01
subplot(3,1,2)
[a,b,k] = bisection(f_3,epsilon,0.01,-1,3);
for i=0:1:k-1
    plot(i,a(i+1),'o','Color','blue')
    hold on
    plot(i,b(i+1),'*','Color','red')
end
xlim([0 16])
xlabel('number of iterations, l=0.01');
ylabel('intervals [a,b]');
legend('a_k','b_k');

% l=0.02
subplot(3,1,3)  
[a,b,k] = bisection(f_3,epsilon,0.02,-1,3);
for i=0:1:k-1
    plot(i,a(i+1),'o','Color','blue')
    hold on
    plot(i,b(i+1),'*','Color','red')
end
xlim([0 16])
xlabel('number of iterations, l=0.02');
ylabel('intervals [a,b]');
legend('a_k','b_k');