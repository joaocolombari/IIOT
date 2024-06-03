function energy_values = calculate_energy(vector, window_size)

    num_windows = floor(length(vector) / window_size);
    energy_values = zeros(1, num_windows);
    
    for i = 1:num_windows
        start_index = (i - 1) * window_size + 1;
        end_index = i * window_size;
        window = vector(start_index:end_index);
        energy_values(i) = sum(window.^2);
    end

    energy_values = repelem(energy_values, window_size);

    energy_values_temp = [];

    % If there are remaining samples, calculate energy for the last window
    if rem(length(vector), window_size) > 0
        start_index = num_windows * window_size + 1;
        end_index = length(vector);
        window = vector(start_index:end_index);
        energy_values_temp = [sum(window.^2)];
        energy_values_temp = repelem(energy_values_temp, length(window));
    end

    energy_values = [energy_values energy_values_temp];
end
