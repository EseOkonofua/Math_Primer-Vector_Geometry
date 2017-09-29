% This is the testing script that will run problems with known ground truths
% testing each Math primer module.

fID = fopen('output.txt','w');

fprintf(fID, '----MATH PRIMER by Ese Okonofua - 10107285----\n\n');
%
% Distance-of-Line-and-Point
%
fprintf(fID, '### Distance-of-Line-and-Point ###\n');
fprintf(fID, '--- Test 1:\n');
fprintf(fID, 'Input:\n\tlinePoint1: [4,2,4], linePoint2: [5,5,9], point: [1,1,2]\n');
fprintf(fID, 'Expected:\n\t 2.5857\n');
Distance = Distance_of_Line_and_Point([4,2,4],[5,5,9],[1,1,2]);
fprintf(fID, 'Distance:\n\t%.4f\n', Distance);

fprintf(fID, '\n--- Test 2:\n');
fprintf(fID, 'Input:\n\tlinePoint1: [1,1,2], linePoint2: [6,1,3], point: [2,3,1]\n');
fprintf(fID, 'Expected:\n\t 2.3205\n');
Distance = Distance_of_Line_and_Point([1,1,2],[6,1,3],[2,3,1]);
fprintf(fID, 'Distance:\n\t%.4f\n', Distance);

%
% Intersect-Two-Lines 
%
fprintf(fID, '\n\n### Intersect-Two-Lines ###\n');
fprintf(fID, '--- Test 1 (Intersecting lines):\n');
fprintf(fID, 'Input:\n\tline1Point1: [5,5,4], line1Point2: [10,10,6], line2Point1: [5,5,5], line2Point2: [10,10,3]\n');
fprintf(fID, 'Expected:\n\t Should Interesect at [25/4, 25/4, 9/2]\n');
[Point, Distance, Std] = Intersect_Two_Lines ([5,5,4], [10,10,6], [5,5,5], [10,10,3]);
fprintf(fID, 'Intersect:\n\t[%.4f,%.4f,%.4f]\n', Point);
fprintf(fID, 'Distance:\n\t%.4f\nStandard Deviation:\n\t%.4f', Distance, Std);

fprintf(fID, '\n\n--- Test 2 (Non intersecting lines):\n');
fprintf(fID, 'Input:\n\tline1Point1: [2,1,4], line1Point2: [1,2,4], line2Point1: [-1,0,2], line2Point2: [4,1,4]\n');
fprintf(fID, 'Expected:\n\tShould not Interesect & Midpoint at [2.5455, 0.6364, 3.7273]\n');
fprintf(fID, '\tDistance between lines: %.4f\n',0.3015);  
[Point, Distance, Std] = Intersect_Two_Lines ([2,1,4], [1,2,4], [-1,0,2], [4,1,4]);
fprintf(fID, 'Intersect:\n\t[%.4f,%.4f,%.4f]\n', Point);
fprintf(fID, 'Distance:\n\t%.4f\nStandard Deviation:\n\t%.4f', Distance, Std);

%
% Intersect-N-Lines
%
fprintf(fID, '\n\n### Intersect-N-Lines ###\n');
fprintf(fID, '--- Test 1 (2 lines that intersect):\n');
fprintf(fID, 'Input:\n\t([5,5,4],[10,10,6],[5,5,5],[10,10,3])\n');
fprintf(fID, 'Expected:\n\t Should Interesect at [25/4, 25/4, 9/2]\n');
[Point, Distance, Std] = Intersect_N_Lines ([5,5,4], [10,10,6], [5,5,5], [10,10,3]);
fprintf(fID, 'Intersect:\n\t[%.4f,%.4f,%.4f]\n', Point);
fprintf(fID, 'Distance:\n\t%.4f\nStandard Deviation:\n\t%.4f', Distance, Std);

fprintf(fID, '\n\n--- Test 2 (3 lines that do not intersect):\n');
fprintf(fID, 'Input:\n\t([-6.13,7.57,-2.66],[-1.89,1.64,0],[4.94,-1.36,-3.45],[1.71,-0.39,0],[0.49,1.18,4.38],[2.18,-0.35,0])\n');
fprintf(fID, 'Expected:\n\tShould not Interesect & Midpoint at [1.1328,-0.4704,0.5647]\n');
fprintf(fID, '\tAverage Distance between lines: %.4f\n',0.8365);  
[Point, Distance, Std] = Intersect_N_Lines([-6.13,7.57,-2.66],[-1.89,1.64,0],[4.94,-1.36,-3.45],[1.71,-0.39,0],[0.49,1.18,4.38],[2.18,-0.35,0]);
fprintf(fID, 'Intersect:\n\t[%.4f,%.4f,%.4f]\n', Point);
fprintf(fID, 'Distance:\n\t%.4f\nStandard Deviation:\n\t%.4f', Distance, Std);

%
% Intersect-Line-and-Ellipsoid
%
fprintf(fID, '\n\n### Intersect-Line-and-Ellipsoid ###\n');
fprintf(fID, '--- Test 1 (2 Points of intersection):\n');
fprintf(fID, 'Input:\n\t(linePoint1:[5,6,0],Linepoint2:[15,16,0],elCentre:[0,0,0],a:2,b:2,c:2)\n');
fprintf(fID, 'Expected:\n\t Should Interesect at 2 points: [-1.8229,-0.8229,0] & [0.8229,1.8229,0]\n');
[numOfIntersections, Point1, Point2] = Intersect_Line_and_Ellipsoid([5,6,0],[15,16,0],[0,0,0],2,2,2);
fprintf(fID, 'Intersections:\n\t%d\n', numOfIntersections);
fprintf(fID, 'Point1:\n\t[%.4f,%.4f,%.4f]\n', Point1);
fprintf(fID, 'Point2:\n\t[%.4f,%.4f,%.4f]\n', Point2);

fprintf(fID, '\n\n--- Test 2 (1 Points of intersection | Tangent):\n');
fprintf(fID, 'Input:\n\t(linePoint1:[0,-2,0],Linepoint2:[2,-2,0],elCentre:[0,0,0],a:2,b:2,c:2)\n');
fprintf(fID, 'Expected:\n\t Should Interesect at 1 point: [0,-2,0].\n');
[numOfIntersections, Point1, Point2] = Intersect_Line_and_Ellipsoid([0,-2,0],[2,-2,0],[0,0,0],2,2,2);
fprintf(fID, 'Intersections:\n\t%d\n', numOfIntersections);
fprintf(fID, 'Point1:\n\t[%.4f,%.4f,%.4f]\n', Point1);
fprintf(fID, 'Point2:\n\t%.4f\n', isempty(Point2));

fprintf(fID, '\n\n--- Test 3 (No intersections):\n');
fprintf(fID, 'Input:\n\t(linePoint1:[5,10,0],Linepoint2:[5,20,0],elCentre:[0,0,0],a:2,b:2,c:2)\n');
fprintf(fID, 'Expected:\n\t Should not intersect.\n');
[numOfIntersections, Point1, Point2] = Intersect_Line_and_Ellipsoid([5,10,0],[5,20,0],[0,0,0],2,2,2);
fprintf(fID, 'Intersections:\n\t%d\n', numOfIntersections);
fprintf(fID, 'Point1:\n\t%.4f\n', isempty(Point1));
fprintf(fID, 'Point2:\n\t%.4f\n', isempty(Point2));

%
% Sphere-Reconstruction
%

fprintf(fID, '\n\n### Sphere-Reconstruction ###\n');
fprintf(fID, 'Expected:\n\tIncreasing Standard Deviation and Average Distance with increasing MaxOffset.\n');
fprintf(fID, '\tAlso expect to see more skewed reconstructed of sphere on plot.\n');

sphere_error_std = [];
for i = 0:36
    fprintf(fID, 'Max Offset: %d\n', i);
    [Point, Vector, AvgDistance, Std] = Sphere_Reconstruction ([0,0,0], 100, 100, i);
    fprintf(fID, '\tStd: %.4f, AvgDistance: %.4f\n\n', Std, AvgDistance);
    sphere_error_std = [sphere_error_std; [i, Std]];
end

figure
plot(sphere_error_std(:,1), sphere_error_std(:,2));
title('Sphere Reconstruction - Error Metrics');
xlabel('Max Offset');
ylabel('Standard Deviation');

%
% Line-Reconstruction
%
line_error = [];
fprintf(fID, '\n\n### Line-Reconstruction ###\n');
fprintf(fID, 'Expected:\n\tIncreasing Standard Deviation and Average Distance with increasing MaxOffset.\n');
fprintf(fID, '\tAlso expect to see more skewed reconstructed line on plot.\n');
for i = 0:36
    fprintf(fID, 'Max Offset: %d\n', i);
    [Point, Vector, AvgDistance, Std] = Line_Reconstruction ([0,0,0], [100,100,100], 100, i);
    fprintf(fID, '\tStd: %.4f, AvgDistance: %.4f\n\n', Std, AvgDistance);
    line_error = [line_error; [i, Std]];
end

figure
plot(line_error(:,1), line_error(:,2));
title('Line Reconstruction - Error Metrics');
xlabel('Max Offset');
ylabel('Standard Deviation');


%
% Orthonormal-Coordinate-System
%

fprintf(fID, '\n### Orthonormal-Coordinate-System ###\n');
fprintf(fID, '--- Test 1:\n');
fprintf(fID, 'Input:\n\t(pA:[0,0,0],pB:[1,0,0],pC:[0,1,0])\n');
fprintf(fID, 'Expected:\n\tx:[1,0,0], y:[0,1,0], z:[0,0,1]\n');
[x, y, z, Centre] = Orthonormal_Coordinate_System ([0,0,0], [1,0,0], [0,1,0]);
fprintf(fID, 'x:\n\t[%.4f,%.4f,%.4f]\n', x);
fprintf(fID, 'y:\n\t[%.4f,%.4f,%.4f]\n', y);
fprintf(fID, 'z:\n\t[%.4f,%.4f,%.4f]\n', z);

fprintf(fID, '\n\n--- Test 2:\n');
fprintf(fID, 'Input:\n\t(pA:[2,0,1],pB:[1,0,0],pC:[0,0,1])\n');
fprintf(fID, 'Expected:\n\tx:[-0.7071,0,-0.7071], y:[-0.7071,0,0.7071], z:[0,1,0]\n');
[x, y, z, Centre] = Orthonormal_Coordinate_System ([2,0,1], [1,0,0], [0,0,1]);
fprintf(fID, 'x:\n\t[%.4f,%.4f,%.4f]\n', x);
fprintf(fID, 'y:\n\t[%.4f,%.4f,%.4f]\n', y);
fprintf(fID, 'z:\n\t[%.4f,%.4f,%.4f]\n', z);

%
% Rigid-Body-Transform
%

fprintf(fID, '\n### Rigid-Body-Transform ###\n');
fprintf(fID, '--- Test 1(Translate Only - FLE = 0:)\n');
Marker1 = Generate_Random_Transform;
Marker2 = Generate_Random_Transform;
Marker3 = Generate_Random_Transform;
[~,Translate] = Generate_Random_Transform;

M1P2 = Translate*[Marker1; 1];
M2P2 = Translate*[Marker2; 1];
M3P2 = Translate*[Marker3; 1];
fprintf(fID, 'Input:\n\t');
fprintf(fID, 'Pose 1 Markers:\n\t');
fprintf(fID, '[%.4f %.4f %.4f %.4f] ', Marker1);
fprintf(fID, '[%.4f %.4f %.4f %.4f] ', Marker2);
fprintf(fID, '[%.4f %.4f %.4f %.4f] ' , Marker3);

fprintf(fID, '\nPose 2 Markers:\n\t');
fprintf(fID, '[%.4f %.4f %.4f %.4f] ', M1P2(1:3));
fprintf(fID, '[%.4f %.4f %.4f %.4f] ', M2P2(1:3));
fprintf(fID, '[%.4f %.4f %.4f %.4f] ' , M3P2(1:3));

fprintf(fID, '\nExpected:\n');
fprintf(fID, '\n\t%.4f %.4f %.4f %.4f', Translate');
Trans = Rigid_Body_Transform(Marker1', Marker2', Marker3', M1P2(1:3)', M2P2(1:3)', M3P2(1:3)');
fprintf(fID, '\nOutput:\n');
fprintf(fID, '\n\t%.4f %.4f %.4f %.4f', Trans');

fprintf(fID, '\n\n--- Test 2(Rotate Only - FLE = 0:)\n');
Marker1 = Generate_Random_Transform;
Marker2 = Generate_Random_Transform;
Marker3 = Generate_Random_Transform;
[~,~,Rotate] = Generate_Random_Transform;

m1_mat = [Marker1 Marker2 Marker3];
centre = mean(m1_mat, 2);
t1 = eye(4);
t1(1:3, 4) = -centre;

t2 = eye(4);
t2(1:3, 4) = centre;

r_ab_or = t2*Rotate*t1
M1P2 = t2*Rotate*t1*[Marker1; 1];
M2P2 = t2*Rotate*t1*[Marker2; 1];
M3P2 = t2*Rotate*t1*[Marker3; 1];

m2_mat = [M1P2(1:3) M2P2(1:3) M3P2(1:3)];
centre2 = mean(m2_mat, 2);

fprintf(fID, 'Input:\n\t');
fprintf(fID, 'Pose 1 Markers:\n\t');
fprintf(fID, '[%.4f %.4f %.4f] ', Marker1);
fprintf(fID, '[%.4f %.4f %.4f] ', Marker2);
fprintf(fID, '[%.4f %.4f %.4f] ' , Marker3);

fprintf(fID, '\nPose 2 Markers:\n\t');
fprintf(fID, '[%.4f %.4f %.4f] ', M1P2(1:3));
fprintf(fID, '[%.4f %.4f %.4f] ', M2P2(1:3));
fprintf(fID, '[%.4f %.4f %.4f] ', M3P2(1:3));

fprintf(fID, '\nExpected:\n');
fprintf(fID, '\n\t%.4f %.4f %.4f %.4f', Rotate');
Rote = Rigid_Body_Transform(Marker1', Marker2', Marker3', M1P2(1:3)', M2P2(1:3)', M3P2(1:3)');
fprintf(fID, '\nOutput:\n');
fprintf(fID, '\n\t%.4f %.4f %.4f %.4f', Rote');

fprintf(fID, '\n\n--- Test 3(Translate & Rotate - FLE = 0:)\n');
Marker1 = Generate_Random_Transform;
Marker2 = Generate_Random_Transform;
Marker3 = Generate_Random_Transform;
[~,Translate,Rotate] = Generate_Random_Transform;

F = Rotate*Translate;
M1P2 = F*[Marker1; 1];
M2P2 = F*[Marker2; 1];
M3P2 = F*[Marker3; 1];
fprintf(fID, 'Input:\n\t');
fprintf(fID, 'Pose 1 Markers:\n\t');
fprintf(fID, '[%.4f %.4f %.4f %.4f] ', Marker1);
fprintf(fID, '[%.4f %.4f %.4f %.4f] ', Marker2);
fprintf(fID, '[%.4f %.4f %.4f %.4f] ' , Marker3);

fprintf(fID, '\nPose 2 Markers:\n\t');
fprintf(fID, '[%.4f %.4f %.4f %.4f] ', M1P2(1:3));
fprintf(fID, '[%.4f %.4f %.4f %.4f] ', M2P2(1:3));
fprintf(fID, '[%.4f %.4f %.4f %.4f] ' , M3P2(1:3));

fprintf(fID, '\nExpected:\n');
fprintf(fID, '\n\t%.4f %.4f %.4f %.4f', F');
f = Rigid_Body_Transform(Marker1', Marker2', Marker3', M1P2(1:3)', M2P2(1:3)', M3P2(1:3)');
fprintf(fID, '\nOutput:\n');
fprintf(fID, '\n\t%.4f %.4f %.4f %.4f', f');

fclose(fID);
