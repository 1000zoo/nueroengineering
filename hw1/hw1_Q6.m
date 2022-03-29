%% Introduction to Neuro-Engineering (2021, Spring)
%% Homework #1: Understanding an Attractor
%% written by Cheol E. Han
clear; close all;

%% parameters of the model
dt=0.1;       % integration time step [ms]
T=20;         % total simulation time [ms]
tau_v=1;      % time constant [ms]
tau_u=2;      % time constant [ms]

%% simulation
% intial setups
t_step=0;
t_rec=zeros(T/dt+1,1);
v_rec=zeros(T/dt+1,1);
u_rec=zeros(T/dt+1,1);
% initial condition
v=0;
u=1;
% I_ext
I_ext=zeros(T/dt+1,1);
I_ext(10/dt:11/dt)=10;
% Euler's method
for t=0:dt:T
    t_step=t_step+1;
    v=v-((v-10)+u-I_ext(t_step))*dt/tau_v;
    u=u-((u-5)-v)*dt/tau_u;
    t_rec(t_step)=t;
    v_rec(t_step)=v;
    u_rec(t_step)=u;
end
disp("v_peak")
max(v_rec)
disp("u_peak")
max(u_rec)
%% Plotting results
figure(1);clf
plot(t_rec,v_rec,'b'); hold on;
plot(t_rec,u_rec,'r');
xlabel('Time [ms]'); ylabel('v or u [mV]')
legend('v','u')

figure(2);clf
plot(v_rec, u_rec); hold on;
axis equal; axis tight
axis([min([v_rec;0]-1), max([v_rec;0]+1),min([u_rec;0])-1, max([u_rec;0]+1)]);
plot([-100, 100],[0,0],'k--');
plot([0,0],[-100, 100],'k--');
xlabel('v [mv]');ylabel('u [mv]')

t_step=0;
h=plot(v_rec(1), u_rec(1),'o','MarkerSize',10);
for t=1:dt:T
    t_step=t_step+1;
    h.XData=v_rec(t_step);
    h.YData=u_rec(t_step);
    pause(0.1)
end
    
