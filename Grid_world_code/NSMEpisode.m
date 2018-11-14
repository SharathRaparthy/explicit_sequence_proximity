function [steps_numof episode actual_episode state] = NSMEpisode(LTM, state, grid_world)


STEPS_NUMOF_MAX = 20;

% Loop until the goal state is reached
actual_episode=[];
episode = [];


s=0;
while s ~= 1
    o = observation(state, grid_world);
    [action total_p max_p_action] = NSMSelectAction(LTM, episode, o); %use this for learning
%    action = NSMrndAction(); %use this for running episodes with random actions
    state = transition(state, action, grid_world);
    if grid_world(state(1,2),state(1,3))== 4  %in this condition use the grid_world value given to the goal 
%        [state s] = startState(); %use this for T-maze world
         [state s] = startState_suttonworld(); %use this for sutton's world
    end
  
    episode = [episode; [o action 10 total_p max_p_action]];
    
end
[steps_numof, ~] = size(episode);
actual_episode=episode;


%use the dfr loop below for learning
 dfr = 10.0;
 for sidx=steps_numof:-1:1
     episode(sidx,3) = dfr;
     dfr = dfr * 0.9;
 end
 
 
% % If the number of steps are greater than  "STEPS_NUMOF_MAX = 20" then the episode matrix takes only last 20 readings.
if steps_numof >= STEPS_NUMOF_MAX
    episode = episode([steps_numof-(STEPS_NUMOF_MAX-1):steps_numof],:);
else
    zero_episode = zeros(STEPS_NUMOF_MAX-steps_numof,5);
    episode = [zero_episode; episode];
end

end
