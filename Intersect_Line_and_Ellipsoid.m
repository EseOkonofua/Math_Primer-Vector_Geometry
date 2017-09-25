## Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
## Created: 2017-09-22
% [x,y,z]=Intersect_Line_and_Ellipsoid([5,10,0],[5,20,0],[0,0,0],2,2,2) - No Intersect
% [x,y,z]=Intersect_Line_and_Ellipsoid([5,6,0],[15,16,0],[0,0,0],2,2,2) - 2 Intersects
% [x,y,z]=Intersect_Line_and_Ellipsoid([0,-2,0],[2,-2,0],[0,0,0],2,2,2) - 1 intersect

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

  %Validate inputs
  Verify_3d_Inputs(linePoint1, linePoint2, elCentre);
  Verify_Numerical_Inputs(linePoint1, linePoint2, elCentre, a, b, c);
  
  point1 = [];
  point2 = [];
  
  % Find and Normalize the line vector
  line = linePoint2 - linePoint1;
  v = line/norm(line);
  
  % Isolate variables for easier use
  px = linePoint1(1);
  py = linePoint1(2);
  pz = linePoint1(3);
  
  x0 = elCentre(1);
  y0 = elCentre(2);
  z0 = elCentre(3);
  
  vx = v(1);
  vy = v(2);
  vz = v(3);
  
  % derived equations for coefficients to solve for t.
  coefficient1 = (vx^2)*(b^2)*(c^2) + (vy^2)*(a^2)*(c^2) + (vz^2)*(a^2)*(b^2);
  
  coefficient2 = (b^2)*(c^2)*(2*px*vx - 2*x0*vx) + (a^2)*(c^2)*(2*py*vy - 2*y0*vy) + (a^2)*(b^2)*(2*pz*vz - 2*z0*vz);
  
  constant = (a^2)*(b^2)*(c^2) + (b^2)*(c^2)*(-px^2 + 2*px*x0 - x0^2) + (a^2)*(c^2)*(-py^2 + 2*py*y0 - y0^2) + (a^2)*(b^2)*(-pz^2 + 2*pz*z0 - z0^2);
  constant = -constant;
  
  % Equation of the format:
  % coefficient1*t^2 + coefficient2*t + constant = 0;
  equation = [coefficient1, coefficient2, constant];
  
  % disc is the discriminant of the equation.
  disc = coefficient2^2 - 4*coefficient1*constant;
  
  % If disc is less than 0 there are no intersections
  if disc < 0
    numIntersections = 0;
  elseif disc == 0; % If disc is 0 there is one intersection and line is a tangent to the ellipsoid
    numIntersections = 1;
    t = -coefficient2 / (2*coefficient1); %find the t value
    point1 = linePoint1 + t*v; % Plug bback in the magnitude t value to get point of intersection
  else % disc > 0 therefore there are 2 intersection points.
    numIntersections = 2;
    t = roots(equation);
    
    % Use the individual t values to find the 2 distinct intersection points.
    point1 = linePoint1 + t(1)*v;
    point2 = linePoint1 + t(2)*v;
  end
endfunction
