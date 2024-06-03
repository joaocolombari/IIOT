% -------------------------------------- % 
%      IIOT - Step f 1st choice          %
%      Joao Victor Colombari Carlet      %
%      jvccarlet@usp.br                  %
% -------------------------------------- % 

% This is not a standalone script and runs depending on the user's choice
% within main.m!

% Calculate mean and std for the signals
Y.mean_rms_filtered_dressPass0001 = mean(Y.rms_filtered_dressPass0001) ...
    *ones(size(Y.rms_filtered_dressPass0001));
Y.mean_rms_filtered_dressPass0050 = mean(Y.rms_filtered_dressPass0050) ...
    *ones(size(Y.rms_filtered_dressPass0050));
Y.mean_rms_filtered_dressPass0150 = mean(Y.rms_filtered_dressPass0150) ...
    *ones(size(Y.rms_filtered_dressPass0150));

Y.mean_rms_dressPass0001 = mean(Y.rms_dressPass0001) ...
    *ones(size(Y.rms_dressPass0001));
Y.mean_rms_dressPass0050 = mean(Y.rms_dressPass0050) ...
    *ones(size(Y.rms_dressPass0050));
Y.mean_rms_dressPass0150 = mean(Y.rms_dressPass0150) ...
    *ones(size(Y.rms_dressPass0150));

% Calculate the std for num_errorbar points. Std gets calculated from the
% RMS value
num_errorbars = 10;

X.indices_rms_dressPass0001 = round(linspace(1, ...
    length(Y.rms_dressPass0001), num_errorbars));
X.indices_rms_dressPass0050 = round(linspace(1, ...
    length(Y.rms_dressPass0050), num_errorbars));
X.indices_rms_dressPass0150 = round(linspace(1, ...
    length(Y.rms_dressPass0150), num_errorbars));

X.indices_rms_filtered_dressPass0001 = round(linspace(1, ...
    length(Y.rms_filtered_dressPass0001), num_errorbars));
X.indices_rms_filtered_dressPass0050 = round(linspace(1, ...
    length(Y.rms_filtered_dressPass0050), num_errorbars));
X.indices_rms_filtered_dressPass0150 = round(linspace(1, ...
    length(Y.rms_filtered_dressPass0150), num_errorbars));

Y.error_bars_rms_dressPass0001 = std(Y.rms_dressPass0001) ...
    * ones(size(X.indices_rms_dressPass0001));
Y.error_bars_rms_dressPass0050 = std(Y.rms_dressPass0050) ...
    * ones(size(X.indices_rms_dressPass0050));
Y.error_bars_rms_dressPass0150 = std(Y.rms_dressPass0150) ...
    * ones(size(X.indices_rms_dressPass0150));

Y.error_bars_rms_filtered_dressPass0001 = std(Y.rms_filtered_dressPass0001) ...
    * ones(size(X.indices_rms_filtered_dressPass0001));
Y.error_bars_rms_filtered_dressPass0050 = std(Y.rms_filtered_dressPass0050) ...
    * ones(size(X.indices_rms_filtered_dressPass0050));
Y.error_bars_rms_filtered_dressPass0150 = std(Y.rms_filtered_dressPass0150) ...
    * ones(size(X.indices_rms_filtered_dressPass0150));

% Plot the result in a same graph using errorbar

figure(9); 
sgtitle('Mean and STD for the whole signal - 1st choice');

% Sample 1, unfiltered
subplot(3,2,1); 
plot(Y.rms_dressPass0001, 'DisplayName', 'RMS signal'); hold on;
plot(Y.mean_rms_dressPass0001, '--', 'DisplayName', 'Mean', 'LineWidth', 3); 
errorbar(X.indices_rms_dressPass0001, Y.rms_dressPass0001(X.indices_rms_dressPass0001), ...
    Y.error_bars_rms_dressPass0001, 'o', 'DisplayName', 'Standard Deviation', 'LineWidth', 2); 
title('Sample 1, unfiltered'); 
xlabel('Time [s]'); ylabel('RMS'); 
legend('show');

% Sample 2, unfiltered
subplot(3,2,3); 
plot(Y.rms_dressPass0050, 'DisplayName', 'RMS signal'); hold on;
plot(Y.mean_rms_dressPass0050, '--', 'DisplayName', 'Mean', 'LineWidth', 3); 
errorbar(X.indices_rms_dressPass0050, Y.rms_dressPass0050(X.indices_rms_dressPass0050), ...
    Y.error_bars_rms_dressPass0050, 'o', 'DisplayName', 'Standard Deviation', 'LineWidth', 2); 
title('Sample 2, unfiltered'); 
xlabel('Time [s]'); ylabel('RMS'); 
legend('show');

% Sample 3, unfiltered
subplot(3,2,5); 
plot(Y.rms_dressPass0150, 'DisplayName', 'RMS signal'); hold on;
plot(Y.mean_rms_dressPass0150, '--', 'DisplayName', 'Mean', 'LineWidth', 3); 
errorbar(X.indices_rms_dressPass0150, Y.rms_dressPass0150(X.indices_rms_dressPass0150), ...
    Y.error_bars_rms_dressPass0150, 'o', 'DisplayName', 'Standard Deviation', 'LineWidth', 2); 
title('Sample 3, unfiltered'); 
xlabel('Time [s]'); ylabel('RMS'); 
legend('show');

% Sample 1, filtered
subplot(3,2,2); 
plot(Y.rms_filtered_dressPass0001, 'DisplayName', 'RMS signal'); hold on;
plot(Y.mean_rms_filtered_dressPass0001, '--', 'DisplayName', 'Mean', 'LineWidth', 3); 
errorbar(X.indices_rms_filtered_dressPass0001, Y.rms_filtered_dressPass0001(X.indices_rms_filtered_dressPass0001), ...
    Y.error_bars_rms_filtered_dressPass0001, 'o', 'DisplayName', 'Standard Deviation', 'LineWidth', 2); 
title('Sample 1, filtered'); 
xlabel('Time [s]'); ylabel('RMS'); 
legend('show');

% Sample 2, filtered
subplot(3,2,4); 
plot(Y.rms_filtered_dressPass0050, 'DisplayName', 'RMS signal'); hold on;
plot(Y.mean_rms_filtered_dressPass0050, '--', 'DisplayName', 'Mean', 'LineWidth', 3); 
errorbar(X.indices_rms_filtered_dressPass0050, Y.rms_filtered_dressPass0050(X.indices_rms_filtered_dressPass0050), ...
    Y.error_bars_rms_filtered_dressPass0050, 'o', 'DisplayName', 'Standard Deviation', 'LineWidth', 2); 
title('Sample 2, filtered'); 
xlabel('Time [s]'); ylabel('RMS'); 
legend('show');

% Sample 3, filtered
subplot(3,2,6); 
plot(Y.rms_filtered_dressPass0150, 'DisplayName', 'RMS signal'); hold on;
plot(Y.mean_rms_filtered_dressPass0150, '--', 'DisplayName', 'Mean', 'LineWidth', 3); 
errorbar(X.indices_rms_filtered_dressPass0150, Y.rms_filtered_dressPass0150(X.indices_rms_filtered_dressPass0150), ...
    Y.error_bars_rms_filtered_dressPass0150, 'o', 'DisplayName', 'Standard Deviation', 'LineWidth', 2); 
title('Sample 3, filtered'); 
xlabel('Time [s]'); ylabel('RMS'); 
legend('show');

% Set the figure position to full screen and save it
set(gcf, 'Position', [0, 0, screen_size(3)*0.5, screen_size(4)*0.5]);
saveas(gcf, 'step_f_1st.jpg');