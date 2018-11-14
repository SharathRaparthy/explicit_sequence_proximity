function grid_world=sutton_world()
rows=11;
columns=11;
grid_world=ones(rows,columns);
for i=1:5
    grid_world(6,i)=0;
end
for i=1:11
    grid_world(i,6)=0;
end
for i=7:11
    grid_world(7,i)=0;
end
grid_world(3,6)=1;
grid_world(6,2)=1;
grid_world(10,6)=1;
grid_world(7,9)=1;
grid_world(9,9)=2;
end