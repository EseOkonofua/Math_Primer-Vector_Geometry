## Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
## Created: 2017-09-22

## Intersect-Line-and-Ellipsoid
## Input:
  ## [point1x, point1y, point1z] - linePoint1
  ## [point2x, point2y, point2z] - linePoint2
  ## [pointx, pointy, pointz] - ellipsoid centre
  ## a,b,c - Principal axes
## Output:
  ## Number of intersection points
  ## [point1x, point1y, point1z]
  ## [point2x, point2y, point2z]
function [numIntersections, point1, point2] = Intersect_Line_and_Ellipsoid (linePoint1, linePoint2, elCentre, a, b, c)
  line = linePoint2 - linePoint1;
  v = line/norm(line);
  
  px = linePoint1(1);
  py = linePoint1(2);
  pz = linePoint1(3);
  
  x0 = elCentre(1);
  y0 = elCentre(2);
  z0 = elCentre(3);
  
  vx = v(1);
  vy = v(2);
  vz = v(3);
  
  coefficient1 = (vx^2)*(b^2)*(c^2) + (vy^2)*(a^2)*(c^2) + (vz^2)*(a^2)*(b^2);
  
  coefficient2 = (b^2)*(c^2)*(2*px*vx - 2*x0*vx) + (a^2)*(c^2)*(2*py - 2*y0*vy) + (a^2)*(b^2)*(2*pz - 2*z0*vz);
  
  constant = (a^2)*(b^2)*(c^2) + (b^2)*(c^2)*(-px^2 + 2*px*x0 - x0^2) + (a^2)*(c^2)*(-py^2 + 2*py*y0 - y0^2) + (a^2)*(b^2)*(-pz^2 + 2*pz*z0 - z0^2);
  
  t = roots([coefficient1, coefficient2, constant])
  
  numIntersections = size(t,1);
  
  
endfunction
