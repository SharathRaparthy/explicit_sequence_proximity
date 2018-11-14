function grid_world=world()
rows=2;
columns=11;
grid_world=zeros(rows,columns);
for i=2:(columns-1)
    grid_world(2,i)=1;
end
grid_world(1,6)=4;
grid_world(2,1)=3;
grid_world(2,11)=2;
end