## Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
## Created: 2017-09-23

function [retval] = Sphere_Reconstruction (centre, radius, n, maxOff)
  [points, offsetPoints] = Sphere_Simulation(centre, radius, n, maxOff);
endfunction

function [points, offsetPoints] =  Sphere_Simulation(centre, radius, n, maxOff)
  points = [];
  offsetPoints = [];
  
  for i = 1:n
     p = GetPointOnSphere(centre, radius, 'north');
     points = [points; p];
     
     offsetP = GetPointOnSphere(p, maxOff, 'all');
     offsetPoints = [offsetPoints; offsetP];
     
     scatter3(p(1),p(2),p(3));
     hold on;
  end

  hold off;
end

function coordinates =  GetPointOnSphere(centre, radius, hemisphere)
  % default
  theta = 2*pi*rand;
  phi = acos(2*rand - 1); 

  if strcmp(hemisphere, 'north')
    phi = acos(rand);
  elseif strcmp(hemisphere, 'south')
    phi = acos(rand - 1);
  end
  
  x = centre(1) + ( radius * sin(phi) * cos(theta) );
  y = centre(2) + ( radius * sin(phi) * sin(theta) );
  z = centre(3) + ( radius * cos(phi) );
     
  coordinates = [x,y,z];
end