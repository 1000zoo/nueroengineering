%변경 전 (맨 처음 코드)

clear; clf; hold on
w=[0.1;0.4];
a=-pi/6; rot=[cos(a) sin(a); -sin(a) cos(a)];

for i=1:1000
    rPre=0.05*randn(2,1).*[4;1]; rPre=rot*rPre;
    plot(rPre(1),rPre(2),'.')
    rPost=w'*rPre;
    w=w+0.1*rPost*(rPre-rPost*w);
    w_traj(:,i)=w;
end

plot(w_traj(1,:), w_traj(2,:),'r')
plot([0 w(1)], [0 w(2)], 'k', 'linewidth', 2)
plot([-1 1], [0 0], 'k');
plot([0 0], [-1 1], 'k')
axis([-1 1 -1 1]);
