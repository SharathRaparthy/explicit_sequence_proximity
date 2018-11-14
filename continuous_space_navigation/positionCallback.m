function pos=positionCallback(pos,~)

 global pos_x
 global pos_y
 global pos_z
 global theta


pos_y=pos.LatestMessage.Pose.Pose.Position.Y;
pos_x=pos.LatestMessage.Pose.Pose.Position.X;
pos_z=pos.LatestMessage.Pose.Pose.Position.Z;
quat=pos.LatestMessage.Pose.Pose.Orientation;
angles = quat2eul([quat.W quat.X quat.Y quat.Z]);
theta = rad2deg(angles(1));
pos=[pos_x pos_y pos_z theta];


end
