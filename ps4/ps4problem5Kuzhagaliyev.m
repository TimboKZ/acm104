clear deltav;
clear deltau;
deltav = zeros(10, 1);
deltau = zeros(10, 1);
for n = 10:10:100
    V = gram_schmidt(hilb(n));
    A1 = eye(n) - V' * V;
    deltav(n/10) = norm(A1, Inf);
    
    U = gram_schmidt_stable(hilb(n));
    A2 = eye(n) - U' * U;
    deltau(n/10) = norm(A2, Inf);
end
ns = 10:10:100;
plot(ns, deltav, '-+r');
title('Problem 5 (e), stability of Gram-Schmidt process');
grid on;
hold on;
plot(ns, deltau, '-*b');
legend({'$\delta_v(n)$', '$\delta_u(n)$'},'Interpreter','latex');
ylabel('$\delta(n)$','Interpreter','latex');
xlabel('n');