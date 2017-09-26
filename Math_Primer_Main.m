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
%Intersect-Two-Lines 
%
fprintf(fID, '\n\n### Intersect-Two-Lines ###\n');
fprintf(fID, '--- Test 1:\n');
fprintf(fID, 'Input:\n\tline1Point1: [5,5,4], line1Point2: [10,10,6], line2Point1: [5,5,5], line2Point2: [10,10,3]\n');
fprintf(fID, 'Expected:\n\t Should Interesect at [25/4, 25/4, 9/2]\n');
[Point, Distance, Std] = Intersect_Two_Lines ([5,5,4], [10,10,6], [5,5,5], [10,10,3]);
fprintf(fID, 'Intersect:\n\t[%.4f,%.4f,%.4f]\n', Point);
fprintf(fID, 'Distance:\n\t%.4f\nStandard Deviation:\n\t%.4f', Distance, Std);

fprintf(fID, '\n\n--- Test 2:\n');
fprintf(fID, 'Input:\n\tline1Point1: [2,1,4], line1Point2: [1,2,4], line2Point1: [-1,0,2], line2Point2: [4,1,4]\n');
fprintf(fID, 'Expected:\n\tShould not Interesect & Midpoint at [2.5455, 0.6364, 3.7273]\n');
fprintf(fID, '\tDistance between lines: %.4f\n',0.3015);  
[Point, Distance, Std] = Intersect_Two_Lines ([2,1,4], [1,2,4], [-1,0,2], [4,1,4]);
fprintf(fID, 'Intersect:\n\t[%.4f,%.4f,%.4f]\n', Point);
fprintf(fID, 'Distance:\n\t%.4f\nStandard Deviation:\n\t%.4f', Distance, Std);

%
%Intersect-N-Lines
%
fclose(fID);