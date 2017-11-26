clc;
n = 4;
A = rand(n, n);
[V, D] = eig(A);
expectedE = D(1, 1);
expectedV = V(:, 1);
[e, v] = ps6problem1Kuzhagaliyev(A);

expectedE, e
comparison = [ expectedV'; v']'