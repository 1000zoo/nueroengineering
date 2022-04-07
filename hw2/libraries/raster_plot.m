function raster_plot(data)
%RESTER_PLOT draws the raster plot of a single neuron (multi-trials)
%   the input data should have the format of [len, trials, direction].
%   If there is only one direction (i.e. size(data,3)==1), it draws a
%   single raster plot. If there are 8 directions (i.e. center-out task),
%   it draws the 8 subplots. 
%
%   Important note. This code took quite much of memories. Thus do not draw
%   multiple neurons at a time; it will freeze your computer!
%   Also too many trials should be prohibited. 10-20 trials, 8 directions
%   would be okay.
%
% written by Cheol E. Han (2021-04-08)
%

%% checking inputs
if ~(ndims(data)==2 || ndims(data)==3)
    error('data size is wrong!')
end
[len, trials, thetaLen]=size(data);

%% raster plot
if size(data,3)==8
    loc=[6,3,2,1,4,7,8,9];
    for i=1:thetaLen
        subplot(3,3,loc(i)); 
        raster(data(:,:,i), trials, len);
    end
else
    raster(data, trials, len);
end

end

%% internal function for raster-plot (actual drawing!)
function raster(data, trials, len)
hold on;
init=floor(len/2);
for j=1:trials
    for k=1:len
        if data(k, j)==1
            plot([1,1]*k, [j+0.1,j+0.9],'k-')
        end
    end
end
axis([0 len, 1 trials+1])
set(gca, 'XTick', [init], 'XTickLabel',{'0'})
set(gca,'YTick',[-1]);
plot([1,1]*init, [1,trials+1], 'r')
hold off
end