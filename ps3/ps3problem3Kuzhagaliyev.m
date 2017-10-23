load('clustering_data.mat');
[m, n] = size(x);
rng(2016);
K = 3;

clust_assignment = zeros(m, 1);
clust1 = zeros(0, 2);
clust2 = zeros(0, 2);
clust3 = zeros(0, 2);

trajectory1 = zeros(0, 2);
trajectory2 = zeros(0, 2);
trajectory3 = zeros(0, 2);

objective_per_iteration = zeros(0, 2);

% Problem 3a
figure
subplot_id = 1;
rs = datasample(x, K);
iteration = 1;
while 1
    clust1 = zeros(0, 2);
    clust2 = zeros(0, 2);
    clust3 = zeros(0, 2);
    
    change_occured = 0;
    % Cluster using representatives
    p_sum = 0;
    for i = 1:m
        vector = x(i, :);
        norm1 = norm(vector - rs(1, :));
        norm2 = norm(vector - rs(2, :));
        norm3 = norm(vector - rs(3, :));
        % Add vector to cluster with smallest norm
        min_norm = min([norm1, norm2, norm3]);
        p_sum = p_sum + min_norm;
        new_clust = 0;
        if min_norm == norm1
            new_clust = 1;
            clust1 = [clust1; vector];
        end
        if min_norm == norm2
            new_clust = 2;
            clust2 = [clust2; vector];
        end
        if min_norm == norm3
            new_clust = 3;
            clust3 = [clust3; vector];
        end
        if new_clust ~= clust_assignment(i)
            change_occured = 1;
        end
        clust_assignment(i) = new_clust;
    end
    p_row = [iteration p_sum];
    objective_per_iteration = [objective_per_iteration; p_row];
    
    % Plot data on relevant iterations
    if iteration == 1 || iteration == 3 || iteration == 5 || change_occured == 0
        sp = subplot(2, 2, subplot_id);
        subplot_id = subplot_id + 1;
        plot(sp, clust1(:, 1), clust1(:, 2), '.r', clust2(:, 1), clust2(:, 2), '.g', clust3(:, 1), clust3(:, 2), '.b', rs(:, 1), rs(:, 2), 'or', rs(:, 1), rs(:, 2), '*k');
        legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Representatives')
        title(strcat('Problem 3a, iteration #', int2str(iteration)));
    end
    iteration = iteration + 1;
    
    % Update representative
    mean1 = mean(clust1);
    mean2 = mean(clust2);
    mean3 = mean(clust3);
    if isequal(rs(1), mean1) || isequal(rs(2), mean2) || isequal(rs(3), mean3)
        change_occured = 1;
    end
    trajectory1 = [trajectory1; rs(1, :)];
    trajectory2 = [trajectory2; rs(2, :)];
    trajectory3 = [trajectory3; rs(3, :)];
    rs(1, :) = mean1;
    rs(2, :) = mean2;
    rs(3, :) = mean3;
    
    % Stop the loop if convergence occurred
    if change_occured == 0
        break;
    end
end

% Problem 3b
figure
plot(x(:, 1), x(:, 2), '.c', trajectory1(:, 1), trajectory1(:, 2), '-.r', trajectory2(:, 1), trajectory2(:, 2), '--b', trajectory3(:, 1), trajectory3(:, 2), '-k')
legend('Data', 'Cluster 1 representative', 'Cluster 2 representative', 'Cluster 3 representative');
title('Problem 3b, trajectories of representatives')

% Problem 4c
objective_per_iteration
figure
plot(objective_per_iteration(:, 1), objective_per_iteration(:, 2))
title('Problem 3c, objective function p versus iteration number')
xlabel('Iteration')
ylabel('Objective function p')
last_row = objective_per_iteration(end, :);
text(9, 2200, strcat('Smallest value = ', num2str(last_row(2))));

% Problem 3d
figure
sp = subplot(1, 2, 1);
plot(sp, clust1(:, 1), clust1(:, 2), '.r', clust2(:, 1), clust2(:, 2), '.g', clust3(:, 1), clust3(:, 2), '.b');
legend('Cluster 1', 'Cluster 2', 'Cluster 3')
title('Problem 3d, final clustering of my algorithm');
sp = subplot(1, 2, 2);
idx = kmeans(x, K);
clust1x = zeros(0, 2);
clust2x = zeros(0, 2);
clust3x = zeros(0, 2);
for i = 1:m
    vector = x(i, :);
    if idx(i) == 1
        clust1x = [clust1x; vector];
    end
    if idx(i) == 2
        clust2x = [clust2x; vector];
    end
    if idx(i) == 3
        clust3x = [clust3x; vector];
    end
end
plot(sp, clust1x(:, 1), clust1x(:, 2), '.r', clust2x(:, 1), clust2x(:, 2), '.g', clust3x(:, 1), clust3x(:, 2), '.b');
legend('Cluster 1', 'Cluster 2', 'Cluster 3')
title('Problem 3d, final clustering of Matlab kmeans() function');
