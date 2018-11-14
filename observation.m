function o = observation()

global v
global w
global x
global y
global z
left_centre_right_obstacle = (v<0.075 & x<0.075 & z<0.075);
left_centre_obstacle = (v<0.075 & x<0.075 & z>0.075);
left_right_obstacle = (v<0.075 & x>0.075 & z<0.075);
left_obstacle = (v<0.075 & x>0.075 & z>0.075);
centre_right_obstacle = (v>0.075 & x<0.075 & z<0.075);
centre_obstacle = (v>0.075 & x<0.075 & z>0.075);
right_obstacle = (v>0.075 & x>0.075 & z<0.075);
no_obstacle = (v>0.075 & x>0.075 & z>0.075);

if left_centre_right_obstacle == 1
    o=1;

elseif left_centre_obstacle ==1
    o=2;
    
elseif left_right_obstacle == 1
    o=3;
    
elseif left_obstacle == 1
    o=4;
    
elseif centre_right_obstacle == 1
    o=5;
    
elseif centre_obstacle == 1
    o=6;
    
elseif right_obstacle == 1
    o=7;
    
elseif no_obstacle == 1
    o=8;
end
end
