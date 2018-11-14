

%Note: Comment the startState1() checking if statement according to the
%      world used
function [steps_numof episode actual_episode pos_stat t_stat_action t_stat_episode blocked] = NSMEpisode(LTM)

global pos_x
global pos_y
global pos_z
global theta
global v
global w
global x
global y
global z

STEPS_NUMOF_MAX = 20;

% Loop until the goal state is reached
actual_episode=[];
episode = [];
X=[];
Y=[];
right_angleturned=[];
left_angleturned=[];
angleturned=[];
X_forward=[];
Y_forward=[];
st1_act=[];
st2_act=[];
rt1_act=[];
rt2_act=[];
blocked=[];
t_stat_action=[];
pos_stat=[];
t_stat_episode=[];

X_forward=pos_x;
Y_forward=pos_y;
angleturned=theta;
i=1;

s=0;

%real time
t= datestr(now,'HH:MM:SS.FFF');
formatIn = 'HH:MM:SS.FFF';
DateVector = datevec(t,formatIn);
rt1_ep=DateVector(1,6) + DateVector(1,5)*60 + DateVector(1,4)*3600;

%sim time
time=rostime('now');
st1_ep=seconds(time);

while s ~= 1
    o = observation();% in simulation use this
    % use this in real world
    %o = getobs();
    
    pos_stat = [pos_stat; [pos_x pos_y theta]];
    

    [action total_p max_p_action] = NSMSelectAction(LTM, episode, o);%use this for learning
%    action = NSMrndAction();%use this for no learning i.e.,for only random actions

    [st1 st2 rt1 rt2 b] = NSMAction(action);% in simulation use this
  
    t_stat_action = [t_stat_action; [st1 st2 rt1 rt2]];
    blocked = [blocked; b];
   
    pos_stat = [pos_stat; [pos_x pos_y theta]];% in simulation use this
    %sim time
    time=rostime('now');
    st2_ep=seconds(time);
    %real time
    t= datestr(now,'HH:MM:SS.FFF');
    formatIn = 'HH:MM:SS.FFF';
    DateVector = datevec(t,formatIn);
    rt2_ep=DateVector(1,6) + DateVector(1,5)*60 + DateVector(1,4)*3600;
        
        s = rndStartState1();% in simulation use this
    end
    episode = [episode; [o action 10 total_p max_p_action]];
    
end
[steps_numof, ~] = size(episode);
actual_episode=episode;
t_stat_episode = [t_stat_episode; [st1_ep st2_ep rt1_ep rt2_ep]];

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
