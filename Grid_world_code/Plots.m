function [Mean, Median] = Plots(trials) % we enter no of trials as input for trials 


trial_steps=[];
max_p_last_step_trial=[];
max_p_last_step=[];
Median=[];
UQ=[];
LQ=[];
Mean=[];
Std=[];
Prox=[];
X_err=[];


for i=1:trials
    fileName=['statistics' num2str(i)];
    dataStruct.(fileName) = load([fileName '.mat']);
    trial_steps = cat(3,trial_steps,dataStruct.(fileName).episode_steps);
    %disp(dataStruct.(fileName).episode_steps(2,1));
end

for i=1:trials
    fileName=['results_LTM' num2str(i)];
    dataStruct.(fileName) = load([fileName '.mat']);
    max_p_last_step_trial=[];
    for j=1:size(dataStruct.('statistics1').episode_steps)
        max_p_last_step_trial = [max_p_last_step_trial; dataStruct.(fileName).LTM_all_ep(20,5,j)];
    end
    max_p_last_step = cat(3, max_p_last_step, max_p_last_step_trial); 
end
% for i=1:trials
%     fileName=['statistics' num2str(i)]
%     trial_steps = cat(3,trial_steps,dataStruct.(fileName).episode_steps);
% end

for i=1:size(dataStruct.('statistics1').episode_steps)
    X=[];
    Y=[];
    Z=[];
    for j=1:trials
        y=trial_steps(i,1,j);
        Y=[Y; y];
        z=max_p_last_step(i,1,j);
        Z=[Z; z];
        j=j+1;
    end
    X=sort(Y);
    Mean = [Mean; mean(X)];
    Std = [Std; std(X)+mean(X)];
    Median = [Median; median(X)];
    UQ = [UQ; median(X(find(X>median(X))))];
    LQ = [LQ; median(X(find(X<median(X))))];
    Prox = [Prox; mean(Z)];
    X_err = [X_err; X];
end
x = [1:100]'; % enter [1:no_of_episodes]
x2 = [x; flipud(x)];
figure('Name','Median_UQ_LQ')
plot(x,Median)
hold on
plot(x,UQ,'r-.')
hold on
plot(x,LQ,'r-.')
hold on
inBetween = [Median;flipud(UQ)];
f=fill(x2, inBetween, 'magenta');
f.FaceColor = [1 0 0];
alpha(f,0.1)
inBetween = [Median;flipud(LQ)];
 h = fill(x2, inBetween,'w');
h.FaceColor = [0 0 1];
alpha(h,0.1)
figure('Name','Mean_Std')
plot(Mean,'k')
hold on

plot(Std,'--')
hold on
inBetween = [Mean;flipud(Std)];
h = fill(x2, inBetween,'w');
h.FaceColor = [255/255 225/255 255/255];

figure('Name','Avg last step max proximity')
plot(Prox,'k--')

 x1 = Mean
% shadedErrorBar([],Median,UQ,'-r',1);
% hold on
% shadedErrorBar([],Median,LQ,'-b',1);
% hold off
% save('Mean_plots.mat','x1');

% figure('Name' ,'Mean_Std')
% x=1:size(Std,1);
% shadedErrorBar(x,X_err,{@mean,@std},'-r',1); 
end
