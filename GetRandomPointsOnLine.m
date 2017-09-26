% Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
% Created: 2017-09-25

% This function will generate n random points on a line when given a point and a direction.
% distribution will be how far away the points are from each other
function points = GetRandomPointsOnLine(point, direction, n, distribution)
  %line = p + t*direction 
  %generate random t's for random points.
  
  %normalize direction vector
  direction = direction/norm(direction);
  
  points = [];
  
  lastMagnitude = 0;
  
  %Generate random lines.
  for i = 1:n
    lastMagnitude = rand*distribution + lastMagnitude;
    if rand > 0.5
      newPoint = point + direction*lastMagnitude;
    else 
      newPoint = point - direction*lastMagnitude;
    end
    
    points = [points; newPoint];
  end
end