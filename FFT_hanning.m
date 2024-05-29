function signal_fft_mean = FFT_hanning(signal, window_length, num_windows)

    % Janela de Hanning de window_length amostras
    hanning_window = hann(window_length);

    % Initialize variable to store FFTs for each window
    fft_values = zeros(window_length/2, num_windows);

    % Iterate over the specified number of windows
    for i = 1:num_windows
        % Selecionando o trecho do sinal:
        % Determinar o ponto de partida para obter 
        % window_length amostras a partir da metade do sinal
        metade_duracao = numel(signal) / 2;
        inicio = metade_duracao - window_length/2 + (i-1) * window_length;
        fim = inicio + window_length - 1;      

        % Extrair window_length amostras a partir da metade do sinal original
        signal_sample = signal(inicio:fim);

        % Aplicando a janela de Hanning ao sinal
        signal_sample_windowed = signal_sample .* hanning_window;

        % Calculando a FFT
        signal_fft = (abs(fft(signal_sample_windowed)) / window_length);

        fft_values(:, i) = signal_fft(1:window_length/2);
    end

    % Calculating the mean FFT over the ten windows
    signal_fft_mean = mean(fft_values, 2);
end