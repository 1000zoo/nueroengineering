clear; clf;

dt=0.1;
tau=10;
E_L=-65;
theta=-55;
RI_ext=24;

t_step=0; v=E_L;
for t=0:dt:100;
    t_step=t_step+1;
    s=v>theta;
    v=(v-dt/tau*((v-E_L)-RI_ext));
    v_rec(t_step)=v;
    t_rec(t_step)=t;
    s_rec(t_step)=s;
end

subplot('Position',[0.13 0.13 1-0.26 0.6])
plot(t_rec, v_rec);
hold on; plot([0 100], [-55 -55], '--');
axis([0 100 -66 -54]);
xlabel('Time [ms]'); ylabel('v [mV]');

subplot('position', [0.13 0.8 1-0.26 0.1])
plot(t_rec, s_rec, '.', 'markersize', 20);
axis([0 100 0.5 1.5]);
set(gca, 'xtick', [], 'ytick', [])
ylabel('Spikes')
