% Calculate the mean and std for each signal using the defined functions
mean_std = struct();

% Define the block size
block_size = 2048;

% Calculate mean and std for filtered signals
signals = {Y.filtered_dressPass0001, Y.filtered_dressPass0050, Y.filtered_dressPass0150};
fields = {'dressPass0001', 'dressPass0050', 'dressPass0150'};
for i = 1:numel(signals)
    signal = signals{i};
    mean_std.(['mean_rms_filtered_' fields{i}]) = calculate_mean(signal, block_size);
    mean_std.(['std_rms_filtered_' fields{i}]) = calculate_std(signal, block_size);
end

% Calculate mean and std for unfiltered signals
signals = {Y.dressPass0001, Y.dressPass0050, Y.dressPass0150};
for i = 1:numel(signals)
    signal = signals{i};
    mean_std.(['mean_rms_' fields{i}]) = calculate_mean(signal, block_size);
    mean_std.(['std_rms_' fields{i}]) = calculate_std(signal, block_size);
end

% Plotting
figure(9);

for i = 1:numel(fields)
    field = fields{i};
    subplot(3, 2, i);
    x = 1:length(mean_std.(['mean_rms_' field]));
    fill([x fliplr(x)], [mean_std.(['mean_rms_' field]) + mean_std.(['std_rms_' field]), ...
        fliplr(mean_std.(['mean_rms_' field]) - mean_std.(['std_rms_' field]))], ...
        'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none'); hold on;
    plot(x, mean_std.(['mean_rms_' field]), 'b', 'LineWidth', 2, 'DisplayName', 'Mean');
    plot(x, Y.(['rms_' field]), 'r', 'DisplayName', 'RMS');
    title(['Sample ' num2str(i)]);
    xlabel('Time [s]'); ylabel('RMS');
    legend;
end