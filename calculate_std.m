function std_values = calculate_std(vector, window_size)

    num_windows = floor(length(vector) / window_size);
    std_values = zeros(1, num_windows);
    
    for i = 1:num_windows
        start_index = (i - 1) * window_size + 1;
        end_index = i * window_size;
        window = vector(start_index:end_index);
        std_values(i) = std(window);
    end

    std_values = repelem(std_values, window_size);

    % If there are remaining samples, calculate the standard deviation for the last window
    if rem(length(vector), window_size) > 0
        start_index = num_windows * window_size + 1;
        end_index = length(vector);
        window = vector(start_index:end_index);
        std_value_temp = std(window);
        std_values_temp = repmat(std_value_temp, 1, length(window));
    end

    std_values = [std_values std_values_temp];
end
