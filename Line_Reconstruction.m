## Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
## Created: 2017-09-25

%Line_Reconstruction([0,0,0],[2,1,1], 100, 10)
function [Point, Vector, AvgDistance, Std] = Line_Reconstruction (point1, point2, n, maxOff)

  %Handle errors
  Verify_Numerical_Inputs(point1, point2, n, maxOff);
  Verify_3d_Inputs(point1, point2);
  
  %Find direction vector
  line = point2 - point1;
  v = line/norm(line);
  
  % Generate lines and offset them
  [points, offsetPoints] = Line_Simulation(point1, v, n, maxOff);
  
  %Find the line of best fit with generated points
  [Point, Vector, AvgDistance, Std, D] = findLineOfBestFit(offsetPoints);
  
  %calculate errors and remove outlier points
  errors = abs(AvgDistance - D) > 2*Std;
  while sum(errors)
    for i = size(errors, 1):-1:1
      if errors(i)
        offsetPoints(i, :) = []; % delete outlier points
      end
    end
    
    %recalculate line of best fit with deleted outliers
    [Point, Vector, AvgDistance, Std, D] = findLineOfBestFit(offsetPoints);
    
    %find if there are anymore errors
    errors = abs(AvgDistance - D) > 2*Std;
  end
  
  reconPoints = GetRandomPointsOnLine(Point, Vector, n, 3);
  
  figure
  hold on
  for i = 1:n
    if i <= size(offsetPoints, 1)
      scatter3(offsetPoints(i, 1), offsetPoints(i, 2), offsetPoints(i, 3), 'filled');
    end
    scatter3(reconPoints(i, 1), reconPoints(i, 2), reconPoints(i, 3), 5, 'red', 'filled');
    %scatter3(points(i, 1), points(i, 2), points(i, 3), 5, 'yellow', 'filled');
  end
  hold off
  
endfunction

%This function will find the line of best fit when given points in 3d
% Returns start point (Point). Direction vector(Vector), 
% Average distance of Points to generated line(AvgDistance), Standard Deviation of distances (Std)
% and matrix of all distances (D)
function [Point, Vector, AvgDistance, Std, D] =  findLineOfBestFit(points)
  Point = mean(points);
  
  subtracted = points - Point;
  
  [~, ~, V] = svd(subtracted);
  
  Vector = V(:, 1)';
  
  D = [];
  
  for i = 1:size(points, 1)
    D = [D; Distance_of_Line_and_Point(Point + Vector, Point + rand*Vector, points(i, :))];
  end
  
  AvgDistance = mean(D);
  Std = std(D);
end

%This is the line simulation function that will generate lines and them offset them at a maxOff distance.
function [points, offsetPoints] = Line_Simulation(point, direction, n, maxOff)
  direction =  direction/norm(direction);
  
  %Generate random points.
  points = GetRandomPointsOnLine(point, direction, n, 3);
  offsetPoints = [];

  %Offset them about a random radius: maxOff.
  for i = 1:n        
    offsetPoint = GetRandomPointOnSphere(points(i, :), maxOff*rand, 'all');
    offsetPoints = [offsetPoints; offsetPoint];
  end
end