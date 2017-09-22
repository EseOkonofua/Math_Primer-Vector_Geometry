## Author: Eseoghene Okonofua
## Created: 2017-09-11

## Distance-of-Line-and-Point
## Input:
  ## ([linePoint1x, linePoint1y, linePoint1z], [linePoint2x, linePoint2y, linePoint2z],
  ## [PointX, PointY, PointZ])
## Output: Distance

function Distance = Distance_of_Line_and_Point (linePoint1, linePoint2, point)
  line = linePoint2 - linePoint1;
  v = line/norm(line);
  
  c = point - linePoint1;
  
  lena = dot(v,c);
  a = v * lena;
  
  d = c - a;
  
  Distance = norm(d);
endfunction
