function [R1, R2] = PageRank(fname, d, eps)
num = dlmread(fname, ' ', [0 0 0 0]);
M = dlmread(fname, ' ', 1, 0);
values = dlmread(fname, ' ', num+1, 0);

% creating my output file

out_file = append(fname, ".out");
fid = fopen(out_file, "w");

%printing the number of nodes we have

fprintf(fid, "%d\n", num);

R1 = Iterative(fname, d, eps);

% printing the iterative PR

for i = 1 : num
    fprintf(fid, "%.06f\n", R1(i));
end

fprintf(fid, "\n");

%printing the Algebraic PR

R2 = Algebraic(fname, d);

for i = 1 : num
    fprintf(fid, "%.06f\n", R2(i));
end

fprintf(fid, "\n");

val1 = values(1);
val2 = values(2);

% sorting the R2 column vector in descending order, along with a vector of
% nodes

nodes = [1 : num];
PR1 = R2;
for i = 1 : num
    for j = i + 1 : num
        if PR1(i) < PR1(j)
            aux = PR1(i);
            PR1(i) = PR1(j);
            PR1(j) = aux;
            
            aux = nodes(i);
            nodes(i) = nodes(j);
            nodes(j) = aux;
        end
    end
end

% getting the value we need with the help of the member function u(x)

for i = 1 : num
    y = Apartenenta(PR1(i), val1, val2);
    fprintf(fid, "%d %d %0.6f\n", i, nodes(i), y);
end
end
