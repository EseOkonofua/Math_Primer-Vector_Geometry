## Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
## Created: 2017-09-20

## Intersect-Two-Lines
##Input:
## ([line1point1x, line1point1y, line1point1z], [line1point2x, line1point2y, line1point2z],
## [line2point1x, line2point1y, line2point1z], [line2point2x, line2point2y, line2point2z])
## Ouput:
## Intersection point [x,y,z], avg distance, std
function [Point, Distance, Std] = Intersect_Two_Lines (line1Point1, line1Point2, line2Point1, line2Point2)
  line1 = line1Point2 - line1Point1;
  v1 = line1/norm(line1);
  
  line2 = line2Point2 - line2Point1;
  v2 = line2/norm(line2);

  v3 = cross(v1,v2);
 
  v = [-v1;v2;v3]';
  
  t = inv(v)*[line1Point1 - line2Point1]';
  
  l1 = line1Point1 + t(1)*v1;
  l2 = line2Point1 + t(2)*v2;
  
  Point = (l1 + l2)/2;
  
  Distance = Distance_of_Line_and_Point(line1Point1, line1Point2, Point);
  
  Std = std([Distance, Distance]);
  #todo: Figure out what std is.
endfunction
