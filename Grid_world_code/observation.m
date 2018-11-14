function o = observation(state, grid_world)

sensor1=0;
sensor2=0;
sensor3=0;
sensor4=0;
% 0 degree sensor
if state(1,3)==size(grid_world,2)
   sensor1 = 1;
elseif grid_world(state(1,2),(state(1,3)+1))==0
    sensor1 = 1;
end
% 90 degree sensor
if state(1,2)==1 
   sensor2 = 1;
elseif grid_world((state(1,2)-1),state(1,3))==0
    sensor2 = 1;
end
% 180 degree sensor
if state(1,3)==1 
   sensor3 = 1;
elseif grid_world(state(1,2),(state(1,3)-1))==0
    sensor3 = 1;
end
% 270 degree sensor
if state(1,2)==size(grid_world,1) 
    sensor4 = 1;
elseif grid_world((state(1,2)+1),state(1,3))==0
    sensor4 = 1;
end

% assigning values to the sensors
if state(1,1)==0
   left_sensor = sensor2;
   centre_sensor = sensor1;
   right_sensor = sensor4;
elseif state(1,1)==90
    left_sensor = sensor3;
    centre_sensor = sensor2;
    right_sensor = sensor1;
elseif state(1,1)==180
    left_sensor = sensor4;
    centre_sensor = sensor3;
    right_sensor = sensor2;
elseif state(1,1)==270
    left_sensor = sensor1;
    centre_sensor = sensor4;
    right_sensor = sensor3;
end
sensor_readings = [left_sensor centre_sensor right_sensor];

% getting the observation value
if sensor_readings==[0 0 0]
    obs_sensors = 1;
elseif sensor_readings==[0 0 1]
    obs_sensors = 2;
elseif sensor_readings==[0 1 0]
    obs_sensors = 3;
elseif sensor_readings==[0 1 1]
    obs_sensors = 4;
elseif sensor_readings==[1 0 0]
    obs_sensors = 5;    
elseif sensor_readings==[1 0 1]
    obs_sensors = 6;
elseif sensor_readings==[1 1 0]
    obs_sensors = 7;
elseif sensor_readings==[1 1 1]
    obs_sensors = 8;
end   
o = obs_sensors*grid_world(state(1,2),state(1,3));

end