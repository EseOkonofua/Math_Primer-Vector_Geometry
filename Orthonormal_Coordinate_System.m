## Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
## Created: 2017-09-25

## Orthonormal-Coordinate-System
## Intput:
  ## Points:
  ##[point1x, point1y, point1z]
  ##[point2x, point2y, point2z]
  ##[point3x, point3y, point3z]
##Output:
  ##[base1x, base1y, base1z]
  ##[base2x, base2y, base2z]
  ##[base3x, base3y, base3z]
  ##[ctrx, ctry, ctrz] 

% Orthonormal_Coordinate_System([0,0,0], [5,-3,6], [-3, -2, 5])
% Orthonormal_Coordinate_System([8,-2,3], [3,4,7], [-3, 1, 2])

function [Base1, Base2, Base3, Centre] = Orthonormal_Coordinate_System (point1, point2, point3)
  Centre = mean([point1; point2; point3]);
  
  Base1 = point1 - Centre;
  Base2 = point2 - Centre;
  Base3 = point3 - Centre;
endfunction
