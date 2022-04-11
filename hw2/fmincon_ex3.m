%% 범위 제약 조건이 있는 경우 최소화 하기
%  https://kr.mathworks.com/help/optim/ug/fmincon.html#d123e40961
%  초기점에 따라 다른 해가 생성될 수 있다.

fun = @(x) 1+x(1)/(1+x(2)) - 3*x(1)*x(2) + x(2)*(1+x(1));

lb = [0,0];
ub = [1,2];
A = [];
b = [];
Aeq = [];
beq = [];
x0 = (lb + ub)/2;
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub)