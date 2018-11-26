function s = rndStartState1(gazebo)

global pos_x
global pos_y
global pos_z

s = 0;
random_x=pos_x;
random_y=pos_y;
while (((random_x^2)+(random_y^2))<((0.075)^2))
     fprintf('Goal Reached\n');
     s = 1;
     random_angle = (2*rand(1,1))*pi; 
     random_x=-0.10+0.2*rand(1,1);
     random_y=-0.10+0.2*rand(1,1);
         
end
if s==1
%      gazebo = ExampleHelperGazeboCommunicator();
     models = getSpawnedModels(gazebo);
     epuck = ExampleHelperGazeboSpawnedModel('epuck2',gazebo);
     setState(epuck,'position',[random_x random_y pos_z],'orientation',[0 0 random_angle]);
     pause(0.1);
end

end
