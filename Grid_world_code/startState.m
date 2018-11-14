function [state s] = startState()
start = randi([2,3]);
s=1;
if start==2
    theta = 180;
    loc = [2 11];
    state = [theta loc];
end
if start==3
   theta = 0;
   loc = [2 1];
   state = [theta loc];
end
end