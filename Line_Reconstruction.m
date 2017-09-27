% Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
% Created: 2017-09-25

% Line-Reconstruction
% Input:
  % ( [ApointX, ApointY, ApointZ], [BpointX, BpointY, BpointZ], numberOfPoints), offset ]
% Output:
  % [pointX, pointY, pointZ], [vectorX, vectorY, vectorZ], avg distance, std
  % * display a graph plot of all the points for visualization
  % * display error metrics

function [Point, Vector, AvgDistance, Std] = Line_Reconstruction (point1, point2, n, maxOff)

  %Handle errors
  Verify_Numerical_Inputs(point1, point2, n, maxOff);
  Verify_3d_Inputs(point1, point2);
  
  %Find direction vector
  line = point2 - point1;
  v = line/norm(line);
  
  % Generate lines and offset them
  [~, offsetPoints] = Line_Simulation(point1, v, n, maxOff);
  
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
  
  reconPointA = Point + 2*n*Vector;
  reconPointB = Point - 2*n*Vector;
  reconLine = [reconPointA; reconPointB];
  
  originPointA = point1 + 2*n*v;
  originPointB = point1 - 2*n*v;
  originLine = [originPointA; originPointB];
  
  figure
  title(strcat('Line Reconstruction - MaxOffset: ', int2str(maxOff)));
  hold on
  reconPlotLine = plot3(reconLine(:,1), reconLine(:,2), reconLine(:,3));
  reconPlotLine.Color = 'red';
  reconPlotLine.LineWidth = 1;
  
  originPlotLine = plot3(originLine(:,1), originLine(:,2), originLine(:,3));
  originPlotLine.Color = 'blue';
  originPlotLine.LineWidth = 1;
  originPlotLine.LineStyle = '-.';

  for i = 1:size(offsetPoints, 1)
    scatter3(offsetPoints(i, 1), offsetPoints(i, 2), offsetPoints(i, 3), 10, 'black', 'filled');
  end
  hold off
  legend('Reconstructed Line', 'Original Line', 'Offset Points');
end

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