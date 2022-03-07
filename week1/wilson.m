clear; clf;

y0 = zeros(1,4); y0(4) = -1; param = 0; I_ext = 0; tspan = [0 100];
[t,y] = ode45('wilson_ode', tspan, y0, [], I_ext);
y0 = y(size(t,1), :); param=0; I_ext=1; tspan = [0 200];
[t,y] = ode45('wilson_ode', tspan, y0, [], I_ext);
plot(t, 100*y(:,4)); xlabel('Time'); ylabel('Membrane');