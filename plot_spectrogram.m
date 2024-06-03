function plot_spectrogram(signal, Fs, NFFT, OVERLAP, spectrogram_dB_scale, f_range, subplot_position, title_text, new_Fs)
    % Downsample the signal
    signal_ds = downsample(signal, round(Fs / new_Fs));
    Fs_ds = new_Fs; % New sampling frequency after downsampling
    
    % Compute the spectrogram
    window = hanning(NFFT);
    noverlap = floor(NFFT * OVERLAP);
    [S, F, T] = spectrogram(signal_ds, window, noverlap, NFFT, Fs_ds);
    
    % Convert to dB scale
    S_dB = 20 * log10(abs(S));
    
    % Apply the dB scale saturation
    min_disp_dB = max(max(S_dB)) - spectrogram_dB_scale;
    S_dB(S_dB < min_disp_dB) = min_disp_dB;
    
    % Limit frequency range
    f_indices = find(F >= f_range(1) & F <= f_range(2));
    F_limited = F(f_indices);
    S_limited = S_dB(f_indices, :);
    
    % Plot the spectrogram
    subplot(subplot_position);
    imagesc(T, F_limited, S_limited);
    set(gca, 'YDir', 'normal'); % Set Y-axis to normal direction
    colorbar;
    colormap jet;
    caxis([min_disp_dB, max(max(S_limited))]); % 60 dB dynamic range
    title(title_text);
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
end
