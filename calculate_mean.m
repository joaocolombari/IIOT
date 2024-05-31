function mean_values = calculate_mean(vector, window_size)

    num_windows = floor(length(vector) / window_size);
    mean_values = zeros(1, num_windows);
    
    for i = 1:num_windows
        start_index = (i - 1) * window_size + 1;
        end_index = i * window_size;
        window = vector(start_index:end_index);
        mean_values(i) = mean(window);
    end

    mean_values = repelem(mean_values, window_size);

    mean_values_temp = [];

    % If there are remaining samples, calculate the mean for the last window
    if rem(length(vector), window_size) > 0
        start_index = num_windows * window_size + 1;
        end_index = length(vector);
        window = vector(start_index:end_index);
        mean_value_temp = mean(window);
        mean_values_temp = repmat(mean_value_temp, 1, length(window));
    end

    mean_values = [mean_values mean_values_temp];
end
