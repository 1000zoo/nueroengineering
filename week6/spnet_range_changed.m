clear; clc; close all;
rand('seed',1);
% Created by Eugene M.Izhikevich.                February 3, 2004
% Modified to allow arbitrary delay distributions.  April 16,2008
M=100;                 % number of synapses per neuron
D=20;                  % maximal conduction delay 
% excitatory neurons   % inhibitory neurons      % total number 
Ne=800;                Ni=200;                   N=Ne+Ni;
a=[0.02*ones(Ne,1);    0.1*ones(Ni,1)];
d=[   8*ones(Ne,1);    2*ones(Ni,1)];
sm=10;                 % maximal synaptic strength

% post=ceil([N*rand(Ne,M);Ne*rand(Ni,M)]); 
% Take special care not to have multiple connections between neurons
delays = cell(N,D);

% selecting range
for_range_1_400 = [1:400, 801:900];
for_range_401_800 = [4ㅋ01:800, 901:1000];
% shuffle range
idx1 = randperm(500);
idx2 = randperm(500);
for_range_1_400(:) = for_range_1_400(idx1);
for_range_401_800(:) = for_range_401_800(idx2);


for i=1:400
    p=randperm(N);
    post(i,:)=for_range_1_400(1:M);
    for j=1:M
        delays{i, ceil(D*rand)}(end+1) = j;  % Assign random exc delays
    end;
end;
for i=401:Ne
    p=randperm(N);
    post(i,:)=for_range_401_800(1:M);
    for j=1:M
        delays{i, ceil(D*rand)}(end+1) = j;  % Assign random exc delays
    end;
end
for i=Ne+1:N
    p=randperm(N);
    post(i,:)=p(1:M);
    delays{i,1}=1:M;                    % all inh delays are 1 ms.
end;

s=[6*ones(Ne,M);-5*ones(Ni,M)];         % synaptic weights
sd=zeros(N,M);                          % their derivatives

% Make links at postsynaptic targets to the presynaptic weights
pre = cell(N,1);
aux = cell(N,1);
for i=1:Ne
    for j=1:D
        for k=1:length(delays{i,j})
            pre{post(i, delays{i, j}(k))}(end+1) = N*(delays{i, j}(k)-1)+i;             % 1dim index of 1000byN
            aux{post(i, delays{i, j}(k))}(end+1) = N*(D-1-j)+i; % takes into account delay
        end;
    end;
end;
  

STDP = zeros(N,1001+D);
v = -65*ones(N,1);                      % initial values
u = 0.2.*v;                             % initial values
firings=[-D 0];                         % spike timings

for sec=1:1                    % simulation of 1 day
  for t=1:1000                          % simulation of 1 sec
    I=zeros(N,1);        
    I(ceil(N*rand))=20;                 % random thalamic input 
    fired = find(v>=30);                % indices of fired neurons
    v(fired)=-65;  
    u(fired)=u(fired)+d(fired);
    STDP(fired,t+D)=0.1;
    for k=1:length(fired)
      sd(pre{fired(k)})=sd(pre{fired(k)})+STDP(N*t+aux{fired(k)});      % decay.(trace) 
    end;
    firings=[firings;t*ones(length(fired),1),fired];
    k=size(firings,1);
    while firings(k,1)>t-D
      del=delays{firings(k,2),t-firings(k,1)+1};
      ind = post(firings(k,2),del);
      I(ind)=I(ind)+s(firings(k,2), del)';
      sd(firings(k,2),del)=sd(firings(k,2),del)-1.2*STDP(ind,t+D)';
      k=k-1;
    end;
    v=v+0.5*((0.04*v+5).*v+140-u+I);    % for numerical 
    v=v+0.5*((0.04*v+5).*v+140-u+I);    % stability time 
    u=u+a.*(0.2*v-u);                   % step is 0.5 ms
    STDP(:,t+D+1)=0.95*STDP(:,t+D);     % tau = 20 ms
  end;
  plot(firings(:,1),firings(:,2),'.');
  axis([0 1000 0 N]); drawnow;
  STDP(:,1:D+1)=STDP(:,1001:1001+D);
  ind = find(firings(:,1) > 1001-D);
  firings=[-D 0;firings(ind,1)-1000,firings(ind,2)];
  s(1:Ne,:)=max(0,min(sm,0.01+s(1:Ne,:)+sd(1:Ne,:)));
  sd=0.9*sd;
end;
