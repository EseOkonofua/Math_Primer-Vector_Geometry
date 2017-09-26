% Author: Eseoghene Okonofua
% Created: 2017-09-11

% Distance-of-Line-and-Point
% Input:
  % ([linePoint1x, linePoint1y, linePoint1z], [linePoint2x, linePoint2y, linePoint2z],
  % [PointX, PointY, PointZ])
% Output: 
  % Distance

function Distance = Distance_of_Line_and_Point (linePoint1, linePoint2, point)

  % Check to make sure that values are 3d and numerical
  Verify_Numerical_Inputs(linePoint1, linePoint2, point);
  Verify_3d_Inputs(linePoint1, linePoint2, point);
  
  %Our starting line
  line = linePoint2 - linePoint1;
  
  %v is the normalized line vector
  v = line/norm(line);
  
  %c is the line from the target point to the start point.
  c = point - linePoint1;
  
  %lena is the magnitude of the line a which is then used to find the actual a vector.
  lena = dot(v,c);
  a = v * lena;
  
  %d is the vector perpendicular to the line and the point. Which is the shortest distance to the line.
  d = c - a;
  
  %the norm of d is the distance.
  Distance = norm(d);
end
