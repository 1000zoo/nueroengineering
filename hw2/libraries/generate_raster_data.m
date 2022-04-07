function [data] = generate_raster_data(varargin) % N, trials, sigma, theta
%GENERATE_RASTER_DATA generates fake spike trains for center-out experiement.
%   data = GENERATE_RASTER_DATA(N, trials, sigma, thetaSet)
%   N: the number of neurons
%   trials: the number of repeated trials for each direction. (default=10)
%   sigma: the base noise level, (default=0.1)
%   thetaSet: if it's not given, 8 center-out direction (default)
%   data: [Len, trials, k, N] where k is the length of thetaSet
%         The Len is the length of raster data set. the frist half of the
%         data is the spikes during the resting state, and the second half 
%         of the spikes during the movement. 
%
% written by Cheol E. Han (2021-04-08)
%

%% checking inputs
switch (nargin)
    case 4
        N=varargin{1};
        trials=varargin{2};
        sigma=varargin{3};
        theta=varargin{4};
    case 3
        N=varargin{1};
        trials=varargin{2};
        sigma=varargin{3};
        theta=[];
    case 2
        N=varargin{1};
        trials=varargin{2};
        sigma=[];
        theta=[];
    case 1
        N=varargin{1};
        trials=[];
        sigma=[];
        theta=[];
end        
if isempty(theta) 
    theta=linspace(0,2*pi,9);theta(end)=[];
end
if isempty(trials)
    trials=10;
end
if isempty(sigma)
    sigma=0.1;
end
len=200;

%% activation level setting
preferred=2*pi*rand(N,1);
act0=randn(N,1)*0.2;
act=cos(theta-preferred)+act0; % + randn(N,8)*sigma;
act=act.*(act>0) ;
% act=act./repmat(max(act,[],2),1,numel(theta))*0.5; % maximum value norm.

%% raster data generation
data=rand(len, trials, numel(theta), N)*2 <sigma;
init=floor(len/2);
for i=1:N
    for j=1:numel(theta)
        data(init+1:len,:,j,i)= rand(len-init, trials)*2 <act(i, j)+sigma;
    end
end

end

