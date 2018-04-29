%% Make structure for multi-class logistic regression in R (from raw spikes)

response = [];
z = [];
ctr = 1;


for sessionNum = 1:4
    for trialNum = 1:5
        for task = 1:8
        
            v = struct_rawSpikeData{sessionNum, task, trialNum};

            if (length(v) ~=0)
                z = vertcat(v',z);
                response(ctr:ctr+size(v,2)-1) = repmat(task,1,size(v,2));
                ctr = ctr + size(v,2);
            end
        end
    end
end

save('data_regression.mat','z')
save('Response.mat','response')

%% Make structure for multi-class logistic regression in R (from latent model (after FA))

response = [];
z = [];
ctr = 1;


for sessionNum = 1:1
    for trialNum = 1:14
        for task = 1:8
        
            v = struct_xorth{sessionNum, task, trialNum};

            if (length(v) ~=0)
                z = vertcat(v',z);
                response(ctr:ctr+size(v,2)-1) = repmat(task,1,size(v,2));
                ctr = ctr + size(v,2);
            end
        end
    end
end

save('data_regression.mat','z')
save('Response.mat','response')   
            
%% Make structure for multi-class logistic regression (across time) in R (from latent model (after FA))

response = [];
z = [];
ctr = 1;


for sessionNum = 1:1
    for trialNum = 1:14
        for task = 1:8
        
            v = struct_xorth{sessionNum, task, trialNum};

            if (length(v) ~=0)
                z = vertcat(v(:,1:60),z);
                response(ctr:ctr+size(v,1)-1) = repmat(task,1,size(v,1));
                ctr = ctr + size(v,1);
            end
        end
    end
end

save('data_regression.mat','z')
save('Response.mat','response')            
        
        
        
        