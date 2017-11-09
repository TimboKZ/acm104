clear all;
f = @(x) cos(x)/cosh(x);

subplot_num = 1;
grid on;

a = 1;
n = 3;
[points, coefficients] = find_coefficients(a, n);
subplot(2, 4, subplot_num);
subplot_num = subplot_num + 1;
fplot(f, [-a a], '-b'); hold on; plot(points(:, 1), points(:, 2), 'xr');
xs = linspace(-a, a, 30);
plot(xs, polyval(coefficients, xs)); hold off;
title(strcat(strcat('Problem 4, a=', int2str(a)), strcat(', n=', int2str(n))));
legend("f(x)", "data points", "interpolating polynomial");

a = 1;
n = 5;
[points, coefficients] = find_coefficients(a, n);
subplot(2, 4, subplot_num);
subplot_num = subplot_num + 1;
fplot(f, [-a a], '-b'); hold on; plot(points(:, 1), points(:, 2), 'xr');
xs = linspace(-a, a, 30);
plot(xs, polyval(coefficients, xs)); hold off;
title(strcat(strcat('Problem 4, a=', int2str(a)), strcat(', n=', int2str(n))));
legend("f(x)", "data points", "interpolating polynomial");

a = 1;
n = 10;
[points, coefficients] = find_coefficients(a, n);
subplot(2, 4, subplot_num);
subplot_num = subplot_num + 1;
fplot(f, [-a a], '-b'); hold on; plot(points(:, 1), points(:, 2), 'xr');
xs = linspace(-a, a, 30);
plot(xs, polyval(coefficients, xs)); hold off;
title(strcat(strcat('Problem 4, a=', int2str(a)), strcat(', n=', int2str(n))));
legend("f(x)", "data points", "interpolating polynomial");

a = 1;
n = 15;
[points, coefficients] = find_coefficients(a, n);
subplot(2, 4, subplot_num);
subplot_num = subplot_num + 1;
fplot(f, [-a a], '-b'); hold on; plot(points(:, 1), points(:, 2), 'xr');
xs = linspace(-a, a, 30);
plot(xs, polyval(coefficients, xs)); hold off;
title(strcat(strcat('Problem 4, a=', int2str(a)), strcat(', n=', int2str(n))));
legend("f(x)", "data points", "interpolating polynomial");

a = 5;
n = 3;
[points, coefficients] = find_coefficients(a, n);
subplot(2, 4, subplot_num);
subplot_num = subplot_num + 1;
fplot(f, [-a a], '-b'); hold on; plot(points(:, 1), points(:, 2), 'xr');
xs = linspace(-a, a, 30);
plot(xs, polyval(coefficients, xs)); hold off;
title(strcat(strcat('Problem 4, a=', int2str(a)), strcat(', n=', int2str(n))));
legend("f(x)", "data points", "interpolating polynomial");

a = 5;
n = 5;
[points, coefficients] = find_coefficients(a, n);
subplot(2, 4, subplot_num);
subplot_num = subplot_num + 1;
fplot(f, [-a a], '-b'); hold on; plot(points(:, 1), points(:, 2), 'xr');
xs = linspace(-a, a, 30);
plot(xs, polyval(coefficients, xs)); hold off;
title(strcat(strcat('Problem 4, a=', int2str(a)), strcat(', n=', int2str(n))));
legend("f(x)", "data points", "interpolating polynomial");

a = 5;
n = 10;
[points, coefficients] = find_coefficients(a, n);
subplot(2, 4, subplot_num);
subplot_num = subplot_num + 1;
fplot(f, [-a a], '-b'); hold on; plot(points(:, 1), points(:, 2), 'xr');
xs = linspace(-a, a, 30);
plot(xs, polyval(coefficients, xs)); hold off;
title(strcat(strcat('Problem 4, a=', int2str(a)), strcat(', n=', int2str(n))));
legend("f(x)", "data points", "interpolating polynomial");

a = 5;
n = 15;
[points, coefficients] = find_coefficients(a, n);
subplot(2, 4, subplot_num);
subplot_num = subplot_num + 1;
fplot(f, [-a a], '-b'); hold on; plot(points(:, 1), points(:, 2), 'xr');
xs = linspace(-a, a, 30);
plot(xs, polyval(coefficients, xs)); hold off;
title(strcat(strcat('Problem 4, a=', int2str(a)), strcat(', n=', int2str(n))));
legend("f(x)", "data points", "interpolating polynomial");