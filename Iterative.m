function R = Iterative(fname, d, eps)

% getting the number of nodes

num = dlmread(fname, ' ', [0 0 0 0]);

% putting the rest of the data from the file in a matrix

M = dlmread(fname, ' ', 1, 0);

% these are the last two values at the end of the file which we will nod
% use for now

values = dlmread(fname, ' ', num+1, 0);

[n, ~] = size(M);

% n now is equal to num

n = n - 2;

A = zeros(n);

% calculating the adjacency matrix
for i = 1 : n
    % getting each node
    node = M(i, 1);
    num_neighbors = M(i, 2);
    nr = 0;
    col = 3;
    % adding 1 for each link our node has
    while nr ~= num_neighbors
        A(node, M(i, col)) = 1;
        col = col + 1;
        nr = nr + 1;
    end
end

for i = 1 : n
    A(i, i) = 0;
end


out_degrees = ones(1, n);
out_degrees = out_degrees';
onesVector = ones(1,n);
onesVector = onesVector';

% calculating the out degrees of our graph

for i = 1 : n
    sum_d = 0;
    for j = 1 : n
        sum_d = sum_d + A(i,j);
    end
    out_degrees(i) = sum_d;
end

% the next matrix is part of the iterative formula we need to use

Mat = zeros(n);
for i = 1 : n
    for j = 1 : n
        if A(j, i) == 1
            Mat(i, j) = 1/out_degrees(j);
        end
    end
end

R = zeros(n,1);
delta = (1 - d)/n;
% R_0 is our first step of the iterative
R_0 = 1/n;
for i = 1 : n
    R(i) = R_0;
end

R_t = d * Mat * R_0 + delta * onesVector;

while norm(R - R_t) >= eps
    R_t = R;
    R = d * Mat * R_t + delta * onesVector;
end
R = R_t;
end