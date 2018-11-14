%Do not give grid_world and state as input arguments if you are running for only a single trial 
function [LTM, LTM_all_ep, mean_episode_steps, std_episode_steps, actual_LTM, episode_steps, state] = NSMTrial(episodes_numof, state, grid_world)

actual_LTM=[];
LTM_all_ep=[];
LTM = [];
episode_steps = [];

%grid_world=world(); %use this if you are running only a single trial
%[state s] = startState(); %use this if you are running only a single trial

for eidx = 1:episodes_numof
    %disp(eidx);
    %disp(state);
    [steps_numof episode actual_episode state] = NSMEpisode(LTM, state, grid_world);
    
    
    actual_LTM = [actual_LTM; actual_episode];
    LTM=cat(3, LTM, episode);
    LTM_all_ep = cat(3, LTM_all_ep, episode); %to check proximity of last 20 steps of all the episodes
    %LTM size=20
    if size(LTM,3)>20
       for i=2:21
           LTM(:,:,i-1)=LTM(:,:,i);
       end
       LTM(:,:,21) = [];
    end
    episode_steps = [episode_steps; steps_numof];
 
    mean_episode_steps = mean(episode_steps);
    std_episode_steps = std(episode_steps);
end
end