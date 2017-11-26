% Finding the largest eigenvalue and the corresponding eigen vector using
% the power method (aka Von Mises iteration).
function [ e, v ] = ps6problem1Kuzhagaliyev( A )
    [m, n] = size(A);
    x = rand(n, 1);
    threshold = 0.0000001;
    while true
        temp = A * x;
        temp = temp / norm(temp, Inf);
        if (norm(temp - x, Inf) < threshold)
            x = temp;
            break;
        end
        x = temp;
    end
    ev = A*x;
    e = ev(1) / x(1);
    v = x / norm(x);
end

