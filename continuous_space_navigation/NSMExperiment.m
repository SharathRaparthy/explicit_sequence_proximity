function f=NSMExperiment(no_of_trials,no_of_episodes)

%trial_steps=[];
Median=[];
UQ=[];
LQ=[];
Mean=[];
Std=[];

pos = rossubscriber('/position',@positionCallback)
scan = rossubscriber('/scan',@scanCallback);
robot = rospublisher('/epuck2/cmd_vel');
gazebo = ExampleHelperGazeboCommunicator();


% timerHandles.scan = rossubscriber('/scan')
% scan = timer('TimerFcn',{@scanCallback,timerHandles},'Period',1);
s=rndStartState1(gazebo);
pause(1);

for i=1:no_of_trials
%     [episode_steps, LTM, performance] = NSMTrial(no_of_episodes)
    [LTM, LTM_all_ep, actual_LTM, forward_blocked, episode_steps, position_stat, time_stat_action, time_stat_episode] = NSMTrial(gazebo, robot, no_of_episodes);
    filename=['results_LTM' num2str(i) '.mat'];
    save(filename,'LTM','LTM_all_ep');
    filename=['statistics' num2str(i) '.mat'];
    save(filename,'actual_LTM','forward_blocked','episode_steps','position_stat','time_stat_action','time_stat_episode');
   
end
end
