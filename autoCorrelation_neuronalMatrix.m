% Autocorrelation function of raw spike data (to see timescale of
% evolution for each neuron)


load('spikeData_20msbins_rawSpikes.mat')

for task = 1:8


ctr = 0;
z = zeros(96,150);

for sessionNum = 1:1
    for trialNum = 1:14
        
        v = struct_rawSpikeData{sessionNum, task, trialNum};

        if (length(v) ~=0)
            
            z = z + v(:,1:150);
            
            ctr = ctr + 1;
            
        end
    end
end

z = z/ctr;

taskCorr = z'*z;
neuronCorr = z*z';

vec = [];
ctr = 1;

for j = -size(taskCorr,1)+1:size(taskCorr,1)-1
    
    if j~=0
        vec(end+1) = mean(diag(taskCorr, j));
    else
        vec(end+1) = NaN;
    end
    %ctr + 1;
end

ctr = -size(taskCorr,1)+1:size(taskCorr,1)-1;

figure;
plot(ctr, vec)
title(sprintf('Reach-direction = %d',task))
xlabel('Time-Delay')
ylabel('Autocorrelation')

end
