function [LTM, LTM_all_ep, stat_steps, stat_ep, mean_episode_steps, std_episode_steps, actual_LTM, forward_blocked, episode_steps, position_stat, time_stat_action, time_stat_episode] = NSMTrial(episodes_numof)

actual_LTM=[];
LTM_all_ep=[];
LTM = [];
episode_steps = [];
position_stat=[];
time_stat_action=[];
time_stat_episode=[];
forward_blocked=[];

for eidx = 1:episodes_numof
    disp(eidx);
    
    [steps_numof episode actual_episode pos_stat t_stat_action t_stat_episode blocked] = NSMEpisode(LTM);
    actual_LTM = [actual_LTM; actual_episode];
    LTM=cat(3, LTM, episode);
    LTM_all_ep = cat(3, LTM_all_ep, episode); %to check proximity
    %LTM size=20
    if size(LTM,3)>20
       for i=2:21
           LTM(:,:,i-1)=LTM(:,:,i);
       end
       LTM(:,:,21) = [];
    end
    episode_steps = [episode_steps; steps_numof];
    
    position_stat = [position_stat; pos_stat];
    time_stat_action = [time_stat_action; t_stat_action];
    time_stat_episode = [time_stat_episode; t_stat_episode];
    forward_blocked = [forward_blocked; blocked];

end



end
