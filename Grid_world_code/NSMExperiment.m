function f=NSMExperiment(no_of_trials,no_of_episodes)

%grid_world = world(); %use this for T-maze world
grid_world = sutton_world(); %use this for sutton's world
%[state s] = startState(); %use this for T-maze world
[state s] = startState_suttonworld(); %use this for sutton's world

for tidx=1:no_of_trials
    disp(tidx);
    
    [LTM, LTM_all_ep, mean_episode_steps, std_episode_steps, actual_LTM, episode_steps, state] = NSMTrial(no_of_episodes, state, grid_world);
    filename=['results_LTM' num2str(tidx) '.mat'];
    save(filename,'LTM','LTM_all_ep');
    filename=['statistics' num2str(tidx) '.mat'];
    save(filename,'mean_episode_steps','std_episode_steps','actual_LTM','episode_steps');
end
end
