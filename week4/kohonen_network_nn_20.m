clear; nn=20; lambda=0.2; sig=2; sig2=1/(2*sig^2);
[X,Y]=meshgrid(1:nn,1:nn); ntrial=0;

c1=0.5-.1*(2*rand(nn)-1);
c2=0.5-.1*(2*rand(nn)-1);

while(true)
    if(mod(ntrial,100)==0)
        clf; hold on; axis square; axis([0 2 0 2]);
        plot(c1,c2,'k'); plot(c1',c2','k');
        tstring=[int2str(ntrial) 'examples']; title(tstring);
        waitforbuttonpress;
    end
    r_in=[rand;rand];
    if ntrial>2000
        r_in(1)=r_in(1)+1;
        r_in(2)=r_in(2)+1;
    end
    r=exp(-(c1-r_in(1)).^2-(c2-r_in(2)).^2);
    [rmax,x_winner]=max(max(r)); [rmax,y_winner]=max(max(r'));
    r=exp(-((X-x_winner).^2+(Y-y_winner).^2)*sig2);
    c1=c1+lambda*r.*(r_in(1)-c1);
    c2=c2+lambda*r.*(r_in(2)-c2);
    ntrial=ntrial+1;
end


