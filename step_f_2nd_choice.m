% -------------------------------------- % 
%      IIOT - Step f 2st choice          %
%      Joao Victor Colombari Carlet      %
%      jvccarlet@usp.br                  %
% -------------------------------------- % 

% This is not a standalone script and runs depending on the user's choice
% within main.m!

% Calculate mean and std for the signals using mean and std functions,
% defined just as RMS function was

% Calculate the mean and std for each signal using the defined functions
Y.mean_rms_filtered_dressPass0001 = calculate_mean(Y.filtered_dressPass0001, block_size);
Y.std_rms_filtered_dressPass0001 = calculate_std(Y.filtered_dressPass0001, block_size);

Y.mean_rms_filtered_dressPass0050 = calculate_mean(Y.filtered_dressPass0050, block_size);
Y.std_rms_filtered_dressPass0050 = calculate_std(Y.filtered_dressPass0050, block_size);

Y.mean_rms_filtered_dressPass0150 = calculate_mean(Y.filtered_dressPass0150, block_size);
Y.std_rms_filtered_dressPass0150 = calculate_std(Y.filtered_dressPass0150, block_size);

Y.mean_rms_dressPass0001 = calculate_mean(Y.dressPass0001, block_size);
Y.std_rms_dressPass0001 = calculate_std(Y.dressPass0001, block_size);

Y.mean_rms_dressPass0050 = calculate_mean(Y.dressPass0050, block_size);
Y.std_rms_dressPass0050 = calculate_std(Y.dressPass0050, block_size);

Y.mean_rms_dressPass0150 = calculate_mean(Y.dressPass0150, block_size);
Y.std_rms_dressPass0150 = calculate_std(Y.dressPass0150, block_size);

% Plot the results
figure(10);
sgtitle('Mean and STD for the whole signal - 2nd choice');

% Plot for sample 1
subplot(3,2,1);
x = 1:length(Y.mean_rms_dressPass0001);
plot_mean_std(x, Y.mean_rms_dressPass0001, Y.std_rms_dressPass0001, 'Mean (unfiltered)');
plot(x, Y.rms_dressPass0001, 'r', 'DisplayName', 'RMS (unfiltered)');
title('Sample 1 (unfiltered)');
xlabel('Time [s]'); ylabel('RMS');
legend('show');

subplot(3,2,2);
x = 1:length(Y.mean_rms_filtered_dressPass0001);
plot_mean_std(x, Y.mean_rms_filtered_dressPass0001, Y.std_rms_filtered_dressPass0001, 'Mean (filtered)');
plot(x, Y.rms_filtered_dressPass0001, 'r', 'DisplayName', 'RMS (filtered)');
title('Sample 1 (filtered)');
xlabel('Time [s]'); ylabel('RMS');
legend('show');

% Plot for sample 2
subplot(3,2,3);
x = 1:length(Y.mean_rms_dressPass0050);
plot_mean_std(x, Y.mean_rms_dressPass0050, Y.std_rms_dressPass0050, 'Mean (unfiltered)');
plot(x, Y.rms_dressPass0050, 'r', 'DisplayName', 'RMS (unfiltered)');
title('Sample 2 (unfiltered)');
xlabel('Time [s]'); ylabel('RMS');
legend('show');

subplot(3,2,4);
x = 1:length(Y.mean_rms_filtered_dressPass0050);
plot_mean_std(x, Y.mean_rms_filtered_dressPass0050, Y.std_rms_filtered_dressPass0050, 'Mean (filtered)');
plot(x, Y.rms_filtered_dressPass0050, 'r', 'DisplayName', 'RMS (filtered)');
title('Sample 2 (filtered)');
xlabel('Time [s]'); ylabel('RMS');
legend('show');

% Plot for sample 3
subplot(3,2,5);
x = 1:length(Y.mean_rms_dressPass0150);
plot_mean_std(x, Y.mean_rms_dressPass0150, Y.std_rms_dressPass0150, 'Mean (unfiltered)');
plot(x, Y.rms_dressPass0150, 'r', 'DisplayName', 'RMS (unfiltered)');
title('Sample 3 (unfiltered)');
xlabel('Time [s]'); ylabel('RMS');
legend('show');

subplot(3,2,6);
x = 1:length(Y.mean_rms_filtered_dressPass0150);
plot_mean_std(x, Y.mean_rms_filtered_dressPass0150, Y.std_rms_filtered_dressPass0150, 'Mean (filtered)');
plot(x, Y.rms_filtered_dressPass0150, 'r', 'DisplayName', 'RMS (filtered)');
title('Sample 3 (filtered)');
xlabel('Time [s]'); ylabel('RMS');
legend('show');

% Function to plot mean with shadowed std area
function plot_mean_std(x, mean_vector, std_vector, label)
    fill([x fliplr(x)], [mean_vector + std_vector, fliplr(mean_vector - std_vector)], ...
        'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none'); hold on;
    plot(x, mean_vector, 'b', 'LineWidth', 2, 'DisplayName', label);
end