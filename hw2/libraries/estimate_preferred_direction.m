%% estimate preferred direction
parameter=zeros(2,1); 
parameter=fmincon(@(param) sum(sum((model_fun(param, theta) - firing).^2)), [1, 0], [], [], [], [], [0,-2*pi],[2,2*pi]);
if parameter(2)<0
    parameter(2)=parameter(2)+2*pi;
end

