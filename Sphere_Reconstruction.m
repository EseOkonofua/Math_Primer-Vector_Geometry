% Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
% Created: 2017-09-23

function [retval] = Sphere_Reconstruction (centre, radius, n, maxOff)
  [points, offsetPoints] = Sphere_Simulation(centre, radius, n, maxOff);
  
  for i = 1:n
    for j = i+1:n
      midPoint = (offsetPoints(i,:) + offsetPoints(j,:))/2;
      
    end
  end
end

function [points, offsetPoints] =  Sphere_Simulation(centre, radius, n, maxOff)
  points = [];
  offsetPoints = [];
  
  for i = 1:n
     p = GetRandomPointOnSphere(centre, radius, 'north');
     points = [points; p];
     
     offsetP = GetRandomPointOnSphere(p, maxOff*rand, 'all');
     offsetPoints = [offsetPoints; offsetP];
     
     scatter3(p(1),p(2),p(3));
     hold on;
  end

  hold off;
end