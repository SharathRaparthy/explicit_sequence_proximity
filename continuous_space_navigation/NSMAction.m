% Author : Sharath Chandra and Anil Kota
% sharathraparthy@gmail.com	anilkota1997@gmail.com
% In this program the robot communicates with the help of ROS. The robot will take actions according to the input given.
% robot publishes a topic called "/epuck2/cmd_vel". 
function [st1 st2 rt1 rt2 b] = NSMAction(action)
 
global v
global w
global x
global y
global z
global pos_x
global pos_y
global pos_z
st1=0;
st2=0;
rt1=0;
rt2=0;
b=0;

robot = rospublisher('/epuck2/cmd_vel');
vel = rosmessage(robot);


t= datestr(now,'HH:MM:SS.FFF');
formatIn = 'HH:MM:SS.FFF';
DateVector = datevec(t,formatIn);
rt1=DateVector(1,6) + DateVector(1,5)*60 + DateVector(1,4)*3600;

switch action
    case 1
        
        for i=1:3
          
             if x<0.06 || w<0.06 || y<0.06 
             
                vel.Linear.X=0;
                send(robot,vel);
                b=1;

            elseif i==1
                
                vel.Linear.X=-0.08;
                send(robot,vel);
                vel.Angular.Z=0;
                send(robot,vel);

            end
            st2_l=0;
            time=rostime('now');
            st1_l=seconds(time);
            if i==1
               st1=st1_l;     
            end
            while (st2_l-st1_l)<0.16
                pause(0.05);
                time=rostime('now');
                st2_l=seconds(time);
            end
            
        end
        st2=st2_l;
        vel.Linear.X=0;
        send(robot,vel);
    case 2
        vel.Angular.Z=2.3;
        send(robot,vel);
        st2=0;
        time=rostime('now');
        st1=seconds(time);
        while (st2-st1)<0.5
            pause(0.05);
            time=rostime('now');
            st2=seconds(time);
        end
        time=rostime('now');
        st2=seconds(time);
        vel.Angular.Z=0;
        send(robot,vel);
        %Takes Left Turn
    case 3
        vel.Angular.Z=-2.3;
        send(robot,vel);
        st2=0;
        time=rostime('now');
        st1=seconds(time);
        while (st2-st1)<0.5
            pause(0.05);
            time=rostime('now');
            st2=seconds(time);
        end
        time=rostime('now');
        st2=seconds(time);

        vel.Angular.Z=0;
        send(robot,vel);
end

%real time
t= datestr(now,'HH:MM:SS.FFF');
formatIn = 'HH:MM:SS.FFF';
DateVector = datevec(t,formatIn);
rt2=DateVector(1,6) + DateVector(1,5)*60 + DateVector(1,4)*3600;
end

