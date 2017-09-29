%This function will find the line of best fit when given points in 3d
% Returns start point (Point). Direction vector(Vector), 
% Average distance of Points to generated line(AvgDistance), Standard Deviation of distances (Std)
% and matrix of all distances (D)
function [Point, Vector, AvgDistance, Std, D] =  Line_Fit(points)
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
