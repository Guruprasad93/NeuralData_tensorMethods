function [spikeData, stateData] = neuronRaster_acrossSessions(binWidth)

%% INPUTS:

% binWidth: This is the time-span of each bin (measured in seconds) - to
% count number of spikes fired by neurons within that time-bin. 

%% OUTPUTS

% spikeData: It is an Nx2 structure - with the first field labelling the
% SessionNumber, Task number and Trial number AND second field is the
% matrix of (Neurons x Time (~3s) after spike binning) associated with each
% session/trial.

% stateData: It is an Nx2 structure - with the first field labelling the
% SessionNumber, Task number and Trial number AND second field is the
% matrix of (cursorState(4 features) x Time (~3s) after spike binning) associated with each
% session/trial.

%% 
load('SharedData.mat');
spikeData = {};
stateData = {};
noUseSessions = [10,11,14];

for sessionNum = 1:14

    if (length(find(noUseSessions==sessionNum))==1)
        continue;
    end
    %sessionNum
    a = trialTimes{sessionNum};
    trialLength = a(:,2)-a(:,1);
    timeBins = ceil(max(trialLength)/binWidth);

    for task = 1:8
    
        rel_trials = find(target{sessionNum}==task);
        %length(rel_trials)
        %task, sessionNum
        for i = 1:length(rel_trials)
            
            %Create Array
            neuron_raster = zeros(96, timeBins);
            stateMatrix = zeros(3000, 2);
            
            trial = rel_trials(i);
            v = sdata{sessionNum, trial, 1};
            task = target{sessionNum}(trial);
            %zero time at the start of every trial.
            Timestamps = v.Timestamps - trialTimes{sessionNum}(trial);

            row = v.Electrodes;
            col = ceil(Timestamps/binWidth);
            col(find(col==0))= 1;
            indices = sub2ind(size(neuron_raster), row, col);
    
            % Finding number of spikes within a time-bin (if any)
            [C,ia,ic] = unique(indices);
            a_counts = accumarray(ic,1);
            neuron_raster(C) = a_counts;
            
            
            ts = state{sessionNum, trial}(:,1) - trialTimes{sessionNum}(trial);
            row_state = ceil(ts/binWidth);
            row_state(find(row_state==0)) = 1;
            
            yq = interp1(row_state, state{sessionNum, trial}(:,[2 4]), 1:3000,'spline');
            
            stateMatrix = yq;
            
            
            %state{sessionNum, trial}(:,1) = state{sessionNum, trial}(:,1) - trialTimes{sessionNum}(trial);
            stateData(end+1).trialId = sprintf('Session:%d, trial:%d, task:%d',sessionNum, trial, task);
            stateData(end).cursorState = stateMatrix; %state{sessionNum,trial};
            
            spikeData(end+1).trialId = sprintf('Session:%d, trial:%d, task:%d',sessionNum, trial, task);
            spikeData(end).spikes = neuron_raster;
            
        end
    end
end

