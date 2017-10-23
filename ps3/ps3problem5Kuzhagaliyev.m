% Problem 5
%
% Using 10 most frequently appearing non-trivial words:
% w1  = president
% w2  = laws
% w3  = united states
% w4  = citizens
% w5  = power
% w6  = constitution
% w7  = duties
% w8  = congress
% w9  = senators
% w10 = executive

constitution = [ 120 13 86 18 36 27 16 60 13 13 ];
constitution = constitution/norm(constitution);
bernie = [ 62 3 45 6 5 1 0 39 10 0 ];
bernie = bernie/norm(bernie);
hilary = [ 146 2 51 10 31 4 2 27 10 0 ];
hilary = hilary/norm(hilary);
trump = [ 216 14 61 9 10 1 0 9 0 30 ];
trump = trump/norm(trump);
tedcruz = [ 82 7 46 18 9 11 0 26 15 2 ];
tedcruz = tedcruz/norm(tedcruz);
kasich = [ 58 9 18 7 9 5 0 26 2 9 ];
kasich = kasich/norm(kasich);

Z = zeros(0, 10);
Z = [Z; constitution];
Z = [Z; bernie];
Z = [Z; hilary];
Z = [Z; trump];
Z = [Z; tedcruz];
Z = [Z; kasich];
Z = Z';

G = Z' * Z;

index = 0;
max = 0;
for i = 2:6
    cos = G(i, 1);
    if cos > max
        max = cos;
        index = i;
    end
end

if index == 2
    fprintf('Bernie\n');
end
if index == 3
    fprintf('Hillary\n');
end
if index == 4
    fprintf('Trump\n');
end
if index == 5
    fprintf('Ted Cruz\n');
end
if index == 6
    fprintf('Kasich\n');
end