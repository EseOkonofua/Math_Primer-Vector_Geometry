% Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
% Created: 2017-09-25

% Rigid-Body-Transform (20 pts)
% Input: (P denotes pose, M denotes marker)
  % ( [P1M1x, P1M1y, P1M1z], [P1M2x, P1M2y, P1M2z], [P1M3x, P1M3y, P1M3z],
  %  [P2M1x, P2M1y, P2M1z], [P2M2x, P2M2y, P2M2z], [P2M3x, P2M3y, P2M3z],
% Output:
  % transformation: 4x4 matrix of numbers
  % error metric: avgFLE, avgFRE, CtrTRE
  
% Rigid_Body_Transform([1,2,3],[4,-4,10],[7,8,9],[2,3,4],[5,3,-3],[1,2,10])
function [retval] = Rigid_Body_Transform (pose1M1, pose1M2, pose1M3, pose2M1, pose2M2, pose2M3)
    [eX, eY, eZ, eO] = Orthonormal_Coordinate_System(pose1M1, pose1M2, pose1M3);
    [vX, vY, vZ, vO] = Orthonormal_Coordinate_System(pose2M1, pose2M2, pose2M3);
    
    camO = [0,0,0];
    
    dE = [(camO - eO) 1]';
    %first translation matrix
    eO_hO = eye(4);
    eO_hO(:,4) = dE;

    % testing
    % [cX, cY, cZ, cO] = Orthonormal_Coordinate_System(p1M1c(1:3)', p1M2c(1:3)', p1M3c(1:3)')
      
    dO = [(vO - camO) 1]';
    %second translation matrix
    camO_vO = eye(4);
    camO_vO(:, 4) = dO;
    

    rotation = eye(4);
    rotation_mat = ...
        [dot(vX, eX), dot(vX, eY), dot(vX, eZ);...
        dot(vY, eX), dot(vY, eY), dot(vY, eZ);... 
        dot(vZ, eX), dot(vZ, eY), dot(vZ, eZ)];
    rotation(1:3, 1:3) = rotation_mat
    
    fe_v = camO_vO*rotation*eO_hO;
    
    val = fe_v*[ 1]'
    pose2M1
    
  
end
    
