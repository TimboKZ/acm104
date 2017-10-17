n = 3;

% Generating A
A = zeros(n);
for i = 1:n
    for j = 1:n
        A(i,j) = i * n - (n - j);
    end
end

A = eye(3)

[K, I, cK, cI] = ps2problem5Kuzhagaliyev(A)
