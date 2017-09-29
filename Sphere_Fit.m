function [Centre, Radius, AvgDistance, Std, D] = Sphere_Fit(U)
    [m, n] = size(U);
    U = U';
    D = [];
    % generate m matrices
    M = ones(m,4);
    b = zeros(m,1);
    M = [-2*U' ones(m,1)];
    
    % compute b vector
    for i = 1:m
        xj = [U(1,i); U(2,i); U(3,i)];
        b(i) = -(xj' * xj);
    end
    
    % use QR decomposition to solve c using least squares
    [Q, R] = qr(M, 0);
    qtb = Q' * b;
    c = back_sub(R, qtb);
    
    % extract g vector and radius data from c
    Centre = c(1:3);
    Radius = sqrt(-1*(c(4) - (Centre' * Centre)));
    
    %Distances
    d = Centre - U;
    for i = 1:m
       D = [D; norm(d(:, i))];
    end
    
    AvgDistance = mean(D);
    Std = std(D);   
end

function X = back_sub(A,B)
    %Input    - A is an n x n upper-triangular nonsingular matrix
    %	         - B is an n x 1 matrix
    %Output - X is the solution to the linear system AX = B

    %  NUMERICAL METHODS: Matlab Programs
    % (c) 2004 by John H. Mathews and Kurtis D. Fink
    %  Complementary Software to accompany the textbook:
    %  NUMERICAL METHODS: Using Matlab, Fourth Edition
    %  ISBN: 0-13-065248-2
    %  Prentice-Hall Pub. Inc.
    %  One Lake Street
    %  Upper Saddle River, NJ 07458

    %Find the dimension of B and initialize X
    n=length(B);
    X=zeros(n,1);
    X(n)=B(n)/A(n,n);

    for k=n-1:-1:1
        X(k)=(B(k)-A(k,k+1:n)*X(k+1:n))/A(k,k);
    end
end
  