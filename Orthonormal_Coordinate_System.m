% Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
% Created: 2017-09-25

% Orthonormal-Coordinate-System
% Intput:
  % Points:
  %[point1x, point1y, point1z]
  %[point2x, point2y, point2z]
  %[point3x, point3y, point3z]
%Output:
  %[base1x, base1y, base1z]
  %[base2x, base2y, base2z]
  %[base3x, base3y, base3z]
  %[ctrx, ctry, ctrz] 

% Orthonormal_Coordinate_System([0,0,0], [5,-3,6], [-3, -2, 5])
% Orthonormal_Coordinate_System([8,-2,3], [3,4,7], [-3, 1, 2])

function [x, y, z, Centre] = Orthonormal_Coordinate_System (pA, pB, pC)
  Centre = mean([pA; pB; pC]);
  
  x = pB - pA;
  z = cross(x, pC - pA);
  y = cross(z, x);
  
  x = x/norm(x);
  z = z/norm(z);
  y = y/norm(y);
end
