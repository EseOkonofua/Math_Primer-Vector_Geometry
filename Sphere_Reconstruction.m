% Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
% Created: 2017-09-23

function [Centre, Radius, AvgDistance, Std] = Sphere_Reconstruction (centre, radius, n, maxOff)

    %Verify and validate inputs
    Verify_Numerical_Inputs(centre, radius, n, maxOff);
    Verify_3d_Inputs(centre);
    
    %Making sure these values are positive
    n = abs(n);
    maxOff = abs(maxOff);
    radius = abs(radius);
    
    [points, offsetPoints] = Sphere_Simulation(centre, radius, n, maxOff); %generate points and offset them

    %fit the sphere based on the offset points
    [Centre, Radius, AvgDistance, Std, D] = Sphere_Fit(offsetPoints);

    %Check for outliers and remove them for better fit
    errors = abs(AvgDistance - D) > 2*Std;
    while sum(errors)
        for i = size(errors, 1):-1:1
          if errors(i)
            offsetPoints(i, :) = []; % delete outlier points
          end
        end
        
        [Centre, Radius, AvgDistance, Std, D] = Sphere_Fit(offsetPoints);
        
        errors = abs(AvgDistance - D) > 2*Std;
    end
    
    %This portion will Graph the original sphere vs the Reconstructed sphere
    if maxOff == 0 || maxOff == 10   
        figure
        title(strcat('Sphere Reconstruction - MaxOffset:', int2str(maxOff)));
        hold on

        for i = 1:100
            p = GetRandomPointOnSphere(centre, radius, 'all');

            rP = GetRandomPointOnSphere(Centre, Radius, 'all');        
         
            scatter3(p(1), p(2), p(3), 10, 'blue', 'filled');
            scatter3(rP(1), rP(2), rP(3), 10, 'red', 'filled');
            if i <= size(offsetPoints, 1)
                offsetP = offsetPoints(i,:);
                scatter3(offsetP(1), offsetP(2), offsetP(3), 20, 'black', 'filled');
            end
        end
        legend('True Sphere', 'Reconstructed Sphere', 'Offset Points');
        hold off
    end
end

function [points, offsetPoints] =  Sphere_Simulation(centre, radius, n, maxOff)
  points = [];
  offsetPoints = [];
  
  %generate n Points and then offset them.
  for i = 1:n
     p = GetRandomPointOnSphere(centre, radius, 'north');
     points = [points; p];
     
     offsetP = GetRandomPointOnSphere(p, maxOff*rand, 'all');
     offsetPoints = [offsetPoints; offsetP]; 
  end
end