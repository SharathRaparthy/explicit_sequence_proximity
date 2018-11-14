function [state s] = startState_suttonworld(grid_world)
s=1;
theta = randi([0 3]) * 90;
p_row = randi([1 11]);
p_column = randi([1 11]);
while grid_world(p_row,p_column) == 0 || grid_world(p_row,p_column) == 2
      p_row = randi([1 11]);
      p_column = randi([1 11]);
end
loc = [p_row p_column];
state = [theta loc];
end