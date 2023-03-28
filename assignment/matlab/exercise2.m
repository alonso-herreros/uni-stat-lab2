%% Probability function
disp('== 2. Probability function ==');
% s |  1  |  2  |  3  |  4  |  5
% p | 0.3 | 0.2 | 0.2 | 0.2 | 0.1
X_values = [1 2 3 4 5];
X_weights = [0.3 0.2 0.2 0.2 0.1];
p_ranges = [0 0.3 0.5 0.7 0.9];

mean_theor = X_weights * X_values';
var_theor = X_weights * (X_values - mean_theor).^2';

n = 1000;
[~, x1] = max((rand(1, n)' >= p_ranges) .* X_values, [], 2);
[~, x2] = max((rand(1, n)' >= p_ranges) .* X_values, [], 2);

disp("a) Mean and variance");
disp("Theoretical: mean = " + mean_theor + ", variance = " + var_theor);
disp("X1:          mean = " + mean(x1) + ", variance = " + var(x1));
disp("X2:          mean = " + mean(x2) + ", variance = " + var(x2));
disp(" ");

disp("b) Probability tables and bar charts");
tab1 = tabulate(x1);
array2table(tab1, VariableNames={'X1', 'Count', 'Probability'})
tab2 = tabulate(x2);
array2table(tab2, VariableNames={'X2', 'Count', 'Probability'})

figure;
bar(X_values, histcounts(X1)/numel(X1));
title("X1 probabilities (n = " + n + ")");
figure;
bar(X_values, histcounts(X2)/numel(X1));
title("X2 probabilities (n = " + n + ")");

disp("c) Probability of 2*X1 = X2");

prob_theoretical = 0;
for i = X_values
    prob_theoretical = prob_theoretical + sum(X_weights(X_values == i) .* X_weights(X_values == 2*i));
end

prob = mean(2*x1 == x2);

disp("Theoretical: " + prob_theoretical);
disp("Simulation:  " + prob);

