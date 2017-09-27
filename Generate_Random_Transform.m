function [Markers, Translate, Rotate] = Generate_Random_Transform()
% This function will generate a random transformation matrix
    x = 2*pi*rand - pi;
    y = pi*rand - pi*0.5;
    z = 2*pi*rand - pi;
    
    X = eye(3);
    Y = eye(3);
    Z = eye(3);
    
    X(2,2) = cos(x);
    X(2,3) = -sin(x);
    X(3,2) = sin(x);
    X(3,3) = cos(x);

    Y(1,1) = cos(y);
    Y(1,3) = sin(y);
    Y(3,1) = -sin(y);
    Y(3,3) = cos(y);

    Z(1,1) = cos(z);
    Z(1,2) = -sin(z);
    Z(2,1) = sin(z);
    Z(2,2) = cos(z);

	R = Z*Y*X;
    
    Rotate = eye(4);
    Rotate(1:3,1:3) = R;
    
    Translate = eye(4);
    Translate(1:3, 4) = 100*rand(3,1) - 50;
    
    Markers = 20*rand(3,1) - 10;
end

