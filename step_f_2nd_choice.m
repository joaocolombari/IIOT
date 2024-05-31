% -------------------------------------- % 
%      IIOT - Step f 2st choice          %
%      Joao Victor Colombari Carlet      %
%      jvccarlet@usp.br                  %
% -------------------------------------- % 

% This is not a standalone script and runs depending on the user's choice
% within main.m!

% Calculate the mean and std for each signal
Y.mean_dressPass0001 = calculate_mean(Y.dressPass0001, block_size);
Y.std_dressPass0001 = calculate_std(Y.dressPass0001, block_size);

Y.mean_dressPass0050 = calculate_mean(Y.dressPass0050, block_size);
Y.std_dressPass0050 = calculate_std(Y.dressPass0050, block_size);

Y.mean_dressPass0150 = calculate_mean(Y.dressPass0150, block_size);
Y.std_dressPass0150 = calculate_std(Y.dressPass0150, block_size);

Y.mean_filtered_dressPass0001 = calculate_mean(Y.filtered_dressPass0001, block_size);
Y.std_filtered_dressPass0001 = calculate_std(Y.filtered_dressPass0001, block_size);

Y.mean_filtered_dressPass0050 = calculate_mean(Y.filtered_dressPass0050, block_size);
Y.std_filtered_dressPass0050 = calculate_std(Y.filtered_dressPass0050, block_size);

Y.mean_filtered_dressPass0150 = calculate_mean(Y.filtered_dressPass0150, block_size);
Y.std_filtered_dressPass0150 = calculate_std(Y.filtered_dressPass0150, block_size);

% Plot the results for each signal
figure(9);
sgtitle('Mean and STD for the whole signal - 2st choice');
% Plot for sample 1 (unfiltered)
subplot(3, 2, 1);
plot(X.dressPass0001, Y.dressPass0001); hold on;
plot(X.dressPass0001, Y.mean_dressPass0001, 'LineWidth', 2);
plot(X.dressPass0001, Y.mean_dressPass0001 + Y.std_dressPass0001, 'y', 'LineWidth', 2);
plot(X.dressPass0001, Y.mean_dressPass0001 - Y.std_dressPass0001, 'y', 'LineWidth', 2);
title('Sample 1 (unfiltered)');
xlabel('Time [s]'); ylabel('Signal');
legend('Original', 'Mean', 'Std Dev');

% Plot for sample 1 (filtered)
subplot(3, 2, 2);
plot(X.filtered_dressPass0001, Y.filtered_dressPass0001); hold on;
plot(X.filtered_dressPass0001, Y.mean_filtered_dressPass0001, 'LineWidth', 2);
plot(X.filtered_dressPass0001, Y.mean_filtered_dressPass0001 + Y.std_filtered_dressPass0001, 'y', 'LineWidth', 2);
plot(X.filtered_dressPass0001, Y.mean_filtered_dressPass0001 - Y.std_filtered_dressPass0001, 'y', 'LineWidth', 2);
title('Sample 1 (filtered)');
xlabel('Time [s]'); ylabel('Signal');
legend('Original', 'Mean', 'Std Dev');

% Plot for sample 2 (unfiltered)
subplot(3, 2, 3);
plot(X.dressPass0050, Y.dressPass0050); hold on;
plot(X.dressPass0050, Y.mean_dressPass0050, 'LineWidth', 2);
plot(X.dressPass0050, Y.mean_dressPass0050 + Y.std_dressPass0050, 'y', 'LineWidth', 2);
plot(X.dressPass0050, Y.mean_dressPass0050 - Y.std_dressPass0050, 'y', 'LineWidth', 2);
title('Sample 2 (unfiltered)');
xlabel('Time [s]'); ylabel('Signal');
legend('Original', 'Mean', 'Std Dev');

% Plot for sample 2 (filtered)
subplot(3, 2, 4);
plot(X.filtered_dressPass0050, Y.filtered_dressPass0050); hold on;
plot(X.filtered_dressPass0050, Y.mean_filtered_dressPass0050, 'LineWidth', 2);
plot(X.filtered_dressPass0050, Y.mean_filtered_dressPass0050 + Y.std_filtered_dressPass0050, 'y', 'LineWidth', 2);
plot(X.filtered_dressPass0050, Y.mean_filtered_dressPass0050 - Y.std_filtered_dressPass0050, 'y', 'LineWidth', 2);
title('Sample 2 (filtered)');
xlabel('Time [s]'); ylabel('Signal');
legend('Original', 'Mean', 'Std Dev');

% Plot for sample 3 (unfiltered)
subplot(3, 2, 5);
plot(X.dressPass0150, Y.dressPass0150); hold on;
plot(X.dressPass0150, Y.mean_dressPass0150, 'LineWidth', 2);
plot(X.dressPass0150, Y.mean_dressPass0150 + Y.std_dressPass0150, 'y', 'LineWidth', 2);
plot(X.dressPass0150, Y.mean_dressPass0150 - Y.std_dressPass0150, 'y', 'LineWidth', 2);
title('Sample 3 (unfiltered)');
xlabel('Time [s]'); ylabel('Signal');
legend('Original', 'Mean', 'Std Dev');

% Plot for sample 3 (filtered)
subplot(3, 2, 6);
plot(X.filtered_dressPass0150, Y.filtered_dressPass0150); hold on;
plot(X.filtered_dressPass0150, Y.mean_filtered_dressPass0150, 'LineWidth', 2);
plot(X.filtered_dressPass0150, Y.mean_filtered_dressPass0150 + Y.std_filtered_dressPass0150, 'y', 'LineWidth', 2);
plot(X.filtered_dressPass0150, Y.mean_filtered_dressPass0150 - Y.std_filtered_dressPass0150, 'y', 'LineWidth', 2);
title('Sample 3 (filtered)');
xlabel('Time [s]'); ylabel('Signal');
legend('Original', 'Mean', 'Std Dev');
