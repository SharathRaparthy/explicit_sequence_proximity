function state = transition(state, action, grid_world)

angles=[0 90 180 270];

for i=1:size(angles,2)
    if state(1,1)==angles(1,i)
        j=i;
    end
end

% left turn
if action==1
   if j==size(angles,2)
      theta = angles(1,1);
   else
       theta = angles(1,j+1);
   end
   loc = [state(1,2) state(1,3)];
end

% forward
if action==2
   theta = angles(1,j);
   
   if theta==0
      if size(grid_world,2)==state(1,3)
         loc = [state(1,2) state(1,3)];
      elseif grid_world(state(1,2),(state(1,3)+1))==0
          loc = [state(1,2) state(1,3)];
      else
          loc = [state(1,2) (state(1,3)+1)];
      end
   end
   
   if theta==90
      if state(1,2)==1
         loc = [state(1,2) state(1,3)];
      elseif grid_world((state(1,2)-1),state(1,3))==0
          loc = [state(1,2) state(1,3)];
      else
          loc = [(state(1,2)-1) state(1,3)];
      end
   end
   
   if theta==180
      if state(1,3)==1
         loc = [state(1,2) state(1,3)];
      elseif grid_world(state(1,2),(state(1,3)-1))==0
          loc = [state(1,2) state(1,3)];
      else
          loc = [state(1,2) (state(1,3)-1)];
      end
   end
   
   if theta==270
      if size(grid_world,1)==state(1,2)
         loc = [state(1,2) state(1,3)];
      elseif grid_world((state(1,2)+1),state(1,3))==0
          loc = [state(1,2) state(1,3)];
      else
          loc = [(state(1,2)+1) state(1,3)];
      end
   end
   
   theta = state(1,1);
end

%right turn
if action==3
   if j==1
      theta = angles(1,size(angles,2));
   else
       theta = angles(1,j-1);
   end
   loc = [state(1,2) state(1,3)];
end

state = [theta loc];

end