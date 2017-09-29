% Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
% Created: 2017-09-25

% Rigid-Body-Transform
% Input: (P denotes pose, M denotes marker)
  % ( [P1M1x, P1M1y, P1M1z], [P1M2x, P1M2y, P1M2z], [P1M3x, P1M3y, P1M3z],
  %  [P2M1x, P2M1y, P2M1z], [P2M2x, P2M2y, P2M2z], [P2M3x, P2M3y, P2M3z],
% Output:
  % transformation: 4x4 matrix of numbers
  % error metric: avgFLE, avgFRE, CtrTRE
  
function [Transform, AvgFLE, AvgFRE, CtrTRE] = Rigid_Body_Transform (pose1M1, pose1M2, pose1M3, pose2M1, pose2M2, pose2M3)

    %Validate inputs
    Verify_Numerical_Inputs(pose1M1, pose1M2, pose1M3, pose2M1, pose2M2, pose2M3);
    Verify_3d_Inputs(pose1M1, pose1M2, pose1M3, pose2M1, pose2M2, pose2M3);
    
    %Gather base vectors and average centre points for each system.
    [eX, eY, eZ, eO] = Orthonormal_Coordinate_System(pose1M1, pose1M2, pose1M3);
    [vX, vY, vZ, vO] = Orthonormal_Coordinate_System(pose2M1, pose2M2, pose2M3);
    
    %camera situated at origin
    cX = [1,0,0];
    cY = [0,1,0];
    cZ = [0,0,1];
    camO = [0,0,0];
    
    dE = [(camO - eO) 1]';
    %first translation matrix
    eO_hO = eye(4);
    eO_hO(:,4) = dE;
      
    dO = [(vO - camO) 1]';
    %second translation matrix
    camO_vO = eye(4);
    camO_vO(:, 4) = dO;
    
    %generate a rotation matrix
    rotation_mat = ...
        [dot(vX,eX), dot(vX,eY), dot(vX, eZ), 0;...
        dot(vY,eX), dot(vY,eY), dot(vY, eZ), 0;... 
        dot(vZ,eX), dot(vZ,eY), dot(vZ, eZ), 0;...
        0,0,0,1];
    
    %Sequential multiplication will give us our transform matrix
    Transform = camO_vO*(rotation_mat*eO_hO);
    
    product1 = Transform*[pose1M1, 1]';
    product2 = Transform*[pose1M2, 1]';
    product3 = Transform*[pose1M3, 1]';
    
    product1 = product1(1:3);
    product2 = product2(1:3);
    product3 = product3(1:3);
    
    %AvgFLE 
    %Measure congruency by taking difference of length of triangle sides.
    %in both poses.
    AB = norm(pose1M2 - pose1M1);
    AC = norm(pose1M3 - pose1M1);
    BC = norm(pose1M3 - pose1M2);
    
    AB2 = norm(pose2M2 - pose2M1);
    AC2 = norm(pose2M3 - pose2M1);
    BC2 = norm(pose2M3 - pose2M2);
    
    AvgFLE = round((abs(AB2 - AB) + abs(AC2 - AC) + abs(BC2 - BC))/3, 4);
    %AvgFRE
    %Change in fiducial position from expected to the computed with the
    %shaky F matrix.
    
    dA = norm(product1 - pose2M1');
    dB = norm(product2 - pose2M2');
    dC = norm(product3 - pose2M3');
    
    AvgFRE = round((dA + dB + dC)/3, 4);
    
    %CtrTRE
    %Change in expected centre vs the actual of centre of produced fiducials
    mean_product = mean([product1' ; product2' ; product3']);
    
    CtrTRE = round(norm(mean_product - vO), 4);2
end
    
