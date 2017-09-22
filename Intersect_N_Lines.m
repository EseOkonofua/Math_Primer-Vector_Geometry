## Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
## Created: 2017-09-20

## Intersect-N-Lines
## Input:
## (numOfLines,
## [line1point1x, line1point1y, line1point1z], [line1point2x, line1point2y, line1point2z],
## [line2point1x, line2point1y, line2point1z], [line2point2x, line2point2y, line2point2z],
## [line3point1x, .............)
## Ouput:
## Intersection point: [x,y,z], avg distance, std

function [Point, AvgDistance, Std] = Intersect_N_Lines (numOfLines, varargin)
  if rem(nargin, 2) == 0
    error('Arguments are not valid, first argument is #ofLines & the rest are pairs of line coordinates.')
  end
  
  M = [];
  D = [];
  outliers = [];
  
  for i = 1:nargin-1 
    if mod(i,2) ~= 0 && i ~= nargin-2
      for y = i+2:nargin-1
        if mod(y,2) ~= 0
          line1Point1 = varargin{i};
          line1Point2 = varargin{i+1};
          
          line2Point1 = varargin{y};
          line2Point2 = varargin{y+1};
      
          [m, d] = Intersect_Two_Lines(line1Point1,line1Point2,line2Point1,line2Point2);
          M = [M;m];
          D = [D;d];
        end
      end   
    end
  end
  
  [M, D, Std, AvgDistance, outliers] = Compute_Errors(M, D);
  
  while size(outliers,1) ~= 0
    [M, D, Std, AvgDistance, outliers] = Compute_Errors(M, D);
  end
  
  Point = mean(M);
endfunction

function [M, D, Std, AvgDistance, Outliers] = Compute_Errors(m, d)
  AvgDistance = mean(d);
  Std = std(d);
  Outliers = [];
  
  for j = size(d,1):-1:1
    if abs(AvgDistance - d(j)) > 2*Std
      Outliers = [Outliers;j];
    end
  end
  
  for k = 1:size(Outliers,1)
    d(k) = [];
    m(k) = [];
  end
  
  Std = std(d);
  AvgDistance = mean(d);
  M = m;
  D = d;
end
