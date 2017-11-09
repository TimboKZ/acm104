function U = gram_schmidt_stable(H) 
    n = size(H);
    U = zeros(n);
    
    % Apply Gram-Schmidt process
    for i = 1:n
        u = H(:, i) / norm(H(:, i));
        U(:, i) = u;
        for j = i + 1:n
            H(:, j) = H(:, j) - dot(H(:, j), u) * u;
        end
    end
    
    % Normalise each vector
    for i = 1:n
        u = U(:, i);
        U(:, i) = u/norm(u);
    end
end