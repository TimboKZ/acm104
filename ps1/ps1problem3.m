n = 10;
A = zeros(n);
for i = 1:n
    for j = 1:n
        if i == j
            A(i, j) = 2;
        end
        if i == j + 1 || i == j - 1
            A(i, j) = -1;
        end
    end
end
    
[L, U, P] = lu(A)