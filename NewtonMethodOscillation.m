close all; clear; clc;

syms t;
f = @(t) 4*t.^4 -6*t.^2 - 11/4;
f_prime = eval(['@(t)' char(diff(f(t)))]);

fplot(f,[-2, 2],'--k','Linewidth', 2)
grid on
hold on
a = 0.5; plot(a, f(a), 'ro', 'LineWidth', 2, 'MarkerSize', 10)
hold on
tangent_a = @(t) f_prime(a)*(t - a) + f(a);
fplot(tangent_a,[-2, 2],'-r','Linewidth', 1)
hold on
b = -0.5; plot(b, f(b), 'ro', 'LineWidth', 2, 'MarkerSize', 10)
hold on
tangent_b = @(t) f_prime(b)*(t - b) + f(b);
fplot(tangent_b,[-2, 2],'-r','Linewidth', 1)
set(gca,'FontSize',30)
xlabel('$x$','FontSize',25); ylabel('$f(x)$','FontSize',25,'rotation',0);

numIter = 20; % number of iterations
x0 = -1.6; % initial guess

x = [x0; zeros(numIter,1)]; % initialize

for k=1:numIter
    x(k+1) = (12*(x(k))^4 - 6*(x(k))^2 + 11/4)/(16*(x(k))^3 -12*x(k));
end

x