%초기값 변경

clear; clf; hold on
w=[-0.1;-0.4];
a=-pi/6; rot=[cos(a) sin(a); -sin(a) cos(a)];

for i=1:2000
    rPre=0.05*randn(2,1).*[4;1]; rPre=rot*rPre;
    rPost=w'*rPre;
    w=w+0.1*rPost*(rPre-rPost*w);
    w_traj(:,i)=w;
end
plot([1:2000], w_traj(1,:), 'LineWidth', 2)
plot([1:2000], w_traj(2,:), 'LineWidth', 2)
axis([1 2000 -1 1]);
norm(w_traj)
norm(w)