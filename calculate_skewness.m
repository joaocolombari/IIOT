function skewness_values = calculate_skewness(vector, window_size)

    num_windows = floor(length(vector) / window_size);
    skewness_values = zeros(1, num_windows);
    
    for i = 1:num_windows
        start_index = (i - 1) * window_size + 1;
        end_index = i * window_size;
        window = vector(start_index:end_index);
        skewness_values(i) = skewness(window);
    end

    skewness_values = repelem(skewness_values, window_size);

    skewness_values_temp = [];

    % If there are remaining samples, calculate skewness for the last window
    if rem(length(vector), window_size) > 0
        start_index = num_windows * window_size + 1;
        end_index = length(vector);
        window = vector(start_index:end_index);
        skewness_values_temp = [skewness(window)];
        skewness_values_temp = repelem(skewness_values_temp, length(window));
    end

    skewness_values = [skewness_values skewness_values_temp];
end
