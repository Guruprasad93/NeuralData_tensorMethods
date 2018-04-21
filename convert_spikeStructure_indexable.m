%% Convert the structure with all sessions, trials, sessions INTO a more indexable structure

% Converting the N x 2 structure to a more indexable structure: where the
% elements (matrices{96xT}) are indexed by 3 numbers: 
% struct_spike {SessionNum, task, trialNum}

struct_spike = {};
ctr = 1;
trialNum = 1;
check = 1;

for sessionNum = 1:14
    trialNum = 1;
    for task = 1:8
        trialNum = 1;
        expression = sprintf('Session:%d.*task:%d',sessionNum, task);
        check = regexp(spikeData(ctr).trialId, expression);
        
        while (check == 1)
            
            struct_spike{sessionNum, task, trialNum} = spikeData(ctr).spikes;
            ctr = ctr+1;
            trialNum = trialNum + 1;
            expression = sprintf('Session:%d.*task:%d',sessionNum, task);
            check = regexp(spikeData(ctr).trialId, expression);
            
        end
    end
end

save('spikeData_1msbins_rawSpikes.mat','struct_spike','-v7.3');
