function rms_values = calculate_rms(vector, window_size)

    num_windows = floor(length(vector) / window_size);
    rms_values = zeros(1, num_windows);
    
    for i = 1:num_windows
        start_index = (i - 1) * window_size + 1;
        end_index = i * window_size;
        window = vector(start_index:end_index);
        rms_values(i) = rms(window);
    end

    rms_values = repelem(rms_values, window_size);

    rms_values_temp = [];

    % If there are remaining samples, calculate RMS for the last window
    if rem(length(vector), window_size) > 0
        start_index = num_windows * window_size + 1;
        end_index = length(vector);
        window = vector(start_index:end_index);
        rms_values_temp = [rms(window)];
        rms_values_temp = repelem(rms_values_temp, length(window));
    end

    % rms_values = mean(rms_values_temp,2);
    rms_values = [rms_values rms_values_temp];
end
