%% 선형 부등식 및 등식 제약 조건
%  https://kr.mathworks.com/help/optim/ug/fmincon.html#d123e40961

fun = @(x) 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;

x0 = [0.5, 0];
A = [1, 2];
b = 1;
Aeq = [2, 1];
beq = 1;
x = fmincon(fun, x0, A, b, Aeq, beq)