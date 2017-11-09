function [points, coefficients] = find_coefficients(a, n)
    f = @(x) cos(x)/cosh(x);
    points = zeros(n, 2);
    points(:, 1) = linspace(-a, a, n);
    for i = 1:n
        points(i, 2) = f(points(i, 1));
    end
    coefficients = polyfit(points(:, 1), points(:, 2), n - 1);
end
