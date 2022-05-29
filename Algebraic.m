function R = Algebraic(fname, d)
% the first steps are the same as the Iterative function
num = dlmread(fname, ' ', [0 0 0 0]);
M = dlmread(fname, ' ', 1, 0);
values = dlmread(fname, ' ', num+1, 0);
[n, ~] = size(M);
n = n - 2;
A = zeros(n);

for i = 1 : n
    node = M(i, 1);
    num_neighbors = M(i, 2);
    nr = 0;
    col = 3;
    while nr ~= num_neighbors
        A(node, M(i, col)) = 1;
        col = col + 1;
        nr = nr + 1;
    end
end

% we need to cover the case if a page i links to itself, as we do not need
% it

for i = 1 : n
    A(i, i) = 0;
end

%initializing a column vector of ones

onesVector = ones(1,n);
onesVector = onesVector';

% creating a vector to store the out degrees of each node

out_degrees = zeros(1, n);
out_degrees = out_degrees';

for i = 1 : n
    sum_d = 0;
    for j = 1 : n
        sum_d = sum_d + A(i,j);
    end
    out_degrees(i) = sum_d;
end

% this matrix has the elements equal to 1/out_degree_of_node(j) if the page
% j links to page i

Mat = zeros(n);
for i = 1 : n
    for j = 1 : n
        if A(j, i) == 1
            Mat(i, j) = 1/out_degrees(j);
        end
    end
end

delta = (1 - d)/n;

I = eye(n);

% this is part of the formula, and we will need the inverse of T

T = I - d * Mat;

T_inv = PR_Inv(T);

% applying the algebraic formula

R = T_inv * (delta * onesVector);
end