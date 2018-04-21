%% Convert the structure with all sessions, trials, sessions INTO a more indexable structure

% Converting the N x 2 structure to a more indexable structure: where the
% elements (matrices {4xT}) are indexed by 3 numbers: 
% struct_state {SessionNum, task, trialNum}

struct_state = {};
ctr = 1;
trialNum = 1;
check = 1;

for sessionNum = 1:14
    trialNum = 1;
    for task = 1:8
        trialNum = 1;
        expression = sprintf('Session:%d.*task:%d',sessionNum, task);
        check = regexp(stateData(ctr).trialId, expression);
        %check = regexp(stateData(ctr).trialId, expression);
        while (check == 1)
            
            struct_state{sessionNum, task, trialNum} = stateData(ctr).cursorState; 
            ctr = ctr+1;
            trialNum = trialNum + 1;
            expression = sprintf('Session:%d.*task:%d',sessionNum, task);
            check = regexp(stateData(ctr).trialId, expression);
            
        end
    end
end

