function laser=scanCallback(scan,~)

global v
global w
global x
global y
global z
global laser



laser=scan.LatestMessage.Ranges;
z=laser(1,1); %right most when seen from behind
y=laser(2,1); %second from right when seen from behind
x=laser(3,1); %centre
w=laser(4,1); %second from left when seen from behind
v=laser(5,1); %left most when seen from behind
% v
% w
% x
% y
% z



end
