clear all

ns = logspace(2, 4, 25);
nCount = length(ns);
nLogs = zeros(1, nCount);

arrays = cell(1, nCount);
for i = 1 : nCount
    nInt = round(ns(i));
    arrays{i} = randn(nInt);
    nLogs(i) = log10(nInt);
end

timeTaken = zeros(1, nCount);

for i = 1 : nCount
    tic
    det(arrays{i});
    timeTaken(i) = log10(toc);
end

plot(nLogs, timeTaken)
title('Matlab determinant calculation time vs. matrix size')
xlabel('Matrix size, log10')
ylabel('Time taken in seconds, log10')
grid on