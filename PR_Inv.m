function B = PR_Inv(A)
% applying modified gram-schmidt
n = size(A);
Q = zeros(n);
R = zeros(n);

for i = 1 : n
    R(i, i) = norm(A(:, i), 2);
    Q(:, i) = A(:, i) / R(i, i);
    for j = i + 1 : n
        R(i, j) = Q(:, i)' * A(:, j);
        A(:, j) = A(:, j) - Q(:, i) * R(i, j);
    end
end

% as the gram schmidt algorithm split our T matrix into Q and R, so we will
% need to solve the ecuation T = Q * R => R * inv(T) = inv(Q) => R * inv(T)
% = Q';

Q = Q';
[new_size, ~] = size(R);
B = zeros(new_size);

for i = new_size : -1 : 1
    for j = new_size: -1 : 1
        s = 0;
        for k = i + 1 : new_size
            s = s + R(i, k) * B(k, j);
        end
        B(i, j) = (Q(i, j) - s) / R(i, i);
    end
end