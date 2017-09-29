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
function [x, y, z, Centre] = Orthonormal_Coordinate_System (pA, pB, pC)
    %validate inputs
    Verify_Numerical_Inputs(pA, pB, pC);
    Verify_3d_Inputs(pA, pB, pC);
    
    %Get the average point. Weighted middle.
    Centre = mean([pA; pB; pC]);

    %find base vectors.
    x = pB - pA;
    z = cross(x, pC - pA);
    y = cross(z, x);

    %Normalize base vectors.
    x = x/norm(x);
    z = z/norm(z);
    y = y/norm(y);
end
