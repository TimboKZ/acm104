% Using PageRank to rank 500 US airports.
clc;
load USAirTransportation;
[m, n] = size(A);

% Convert A into a column-stochastic matrix
L = zeros(m, n);
for j = 1:n
    aCol = A(:, j);
    L(:, j) = aCol / sum(aCol);
end

% Prepare other variables
S = zeros(m,n);
S(:) = 1/n;
alphas = [0.1, 0.15, 0.2]';

% Find ranking vectors for different alpha values
for i = 1:size(alphas)
    Lb = (1 - alphas(i)) * L + alphas(i) * S;
    
    % Find the ranking vector
    [e, v] = ps6problem1Kuzhagaliyev(Lb);
    
    % Find top 10 airports
    sortedV = sort(v, 'descend');
    maxValues = sortedV(1:10, 1);
    ids = zeros(0, 1);
    for j = 1:10
        idx = find(v == maxValues(j, 1));
        ids = [ids; idx];
    end
    
    fprintf('IDs of 10 most important airports for alpha = %.2f,\n', alphas(i));
    fprintf('in descending order of importance:\n');
    for j = 1:size(ids)
        fprintf('%i  ', ids(j));
    end
    fprintf('\n\n');
end
