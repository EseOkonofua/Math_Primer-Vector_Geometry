## Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
## Created: 2017-09-20

## Intersect-Two-Lines
##Input:
  ## ([line1point1x, line1point1y, line1point1z], [line1point2x, line1point2y, line1point2z],
  ## [line2point1x, line2point1y, line2point1z], [line2point2x, line2point2y, line2point2z])
## Ouput:
  ## Intersection point [x,y,z], avg distance, std
function [Point, Distance, Std] = Intersect_Two_Lines (line1Point1, line1Point2, line2Point1, line2Point2)

  % Check to make sure arguments are 3d and Numerical
  Verify_Numerical_Inputs(line1Point1, line1Point2, line2Point1, line2Point2);
  Verify_3d_Inputs(line1Point1, line1Point2, line2Point1, line2Point2);
  
  % Normalizing line vectors
  line1 = line1Point2 - line1Point1;
  v1 = line1/norm(line1);
  
  % 2nd line vector
  line2 = line2Point2 - line2Point1;
  v2 = line2/norm(line2);

  % v3 is the direction vector perpendicular to both lines.
  v3 = cross(v1,v2);
  
  %If lines are parallel there are multiple points
  if ~any(v3)
    Distance = Distance_of_Line_and_Point(line1Point1, line1Point2, line2Point1)/2
  else
 
  % We can solve this equation with matrix inversion method.
  % v is the large direction vector matrix.
  v = [-v1;v2;v3]';
  
  %multiplying the inverse of v with the start point matrix will give us the weight matrix t.
  P = [line1Point1 - line2Point1]';
  t = v\P;
  
  % we can plug in our newly calculated t values to get the points of intersect of our v3 vector to the other lines.
  l1 = line1Point1 + t(1)*v1;
  l2 = line2Point1 + t(2)*v2;
  
  % We can find the midpoint of the line with my adding and dividing by 2.
  Point = (l1 + l2)/2;
  end
  
  % We take the distance from 1 of the lines to the calculated point as our distance.
  Distance = Distance_of_Line_and_Point(line1Point1, line1Point2, Point);
  
  Std = std(Distance); %std will always be 0 since the distances are the same between point and lines.
endfunction
