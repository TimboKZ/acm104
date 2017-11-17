function V = gram_schmidt(H) 
    n = size(H);
    V = zeros(n);
    
    % Apply Gram-Schmidt process
    for i = 1:n
        v = H(:, i);
        for j = 1:i-1
            vj = V(:, j);
            v = v - (dot(v, vj)/power(norm(vj), 2)) * vj;
        end
        V(:, i) = v;
    end
    
    % Normalise each vector
    for i = 1:n
        u = V(:, i);
        V(:, i) = u/norm(u);
    end
end