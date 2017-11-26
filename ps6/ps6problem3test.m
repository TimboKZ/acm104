clc;
a1 = (1 + sqrt(5))/2;
a2 = (1 - sqrt(5))/2;
A = [
    a1 0;
    0 a2;
];
V = [(1 + sqrt(5))/2 (1 - sqrt(5))/2; 1 1];
Vinv = [
    1/sqrt(5) -(1-sqrt(5))/(2*sqrt(5));
    -1/sqrt(5) (1+sqrt(5))/(2*sqrt(5))
];
V * A * Vinv