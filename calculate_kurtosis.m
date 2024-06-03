function kurtosis_values = calculate_kurtosis(vector, window_size)

    num_windows = floor(length(vector) / window_size);
    kurtosis_values = zeros(1, num_windows);
    
    for i = 1:num_windows
        start_index = (i - 1) * window_size + 1;
        end_index = i * window_size;
        window = vector(start_index:end_index);
        kurtosis_values(i) = kurtosis(window);
    end

    kurtosis_values = repelem(kurtosis_values, window_size);

    kurtosis_values_temp = [];

    % If there are remaining samples, calculate kurtosis for the last window
    if rem(length(vector), window_size) > 0
        start_index = num_windows * window_size + 1;
        end_index = length(vector);
        window = vector(start_index:end_index);
        kurtosis_values_temp = [kurtosis(window)];
        kurtosis_values_temp = repelem(kurtosis_values_temp, length(window));
    end

    kurtosis_values = [kurtosis_values kurtosis_values_temp];
end
