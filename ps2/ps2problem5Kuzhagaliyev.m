function [K, I, cK, cI] = ps2problem5Kuzhagaliyev(A)

    [m, n] = size(A);
    r = rank(A);
    
    if r == 0
        I = zeros(m, 1);
        cI = zeros(n, 1);
        
        K = eye(n);
        cK = eye(m);
        return;
    end
    
    if r == n
        K = zeros(n, 1);
        cK = zeros(m, 1);
        
        I = eye(m);
        cI = eye(n);
        return;
    end
    
    K = null(A);
    cK = null(A');
    
    rowEchelon = rref(A)';
    I = zeros(n, r);
    for i = 1:r
        I(:, i) = rowEchelon(:, i);
    end
    
    rowEchelonTrans = rref(A')';
    cI = zeros(m, r);
    for i = 1:r
        cI(:, i) = rowEchelonTrans(:, i);
    end
    
    
end