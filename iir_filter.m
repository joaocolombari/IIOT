function filtered_signal = iir_filter(order, response, Fc, input_signal, Fs)
    % Chose response type
    Wn = Fc / (Fs/2);                           % Normalized frequency
    switch response 
        % Design butter filter 
        case 'highpass'
            [b, a] = butter(order, Wn, 'high');
        case 'lowpass'
            [b, a] = butter(order, Wn, 'low');
        case 'bandpass'
            [b, a] = butter(order, Wn, 'bandpass');
        case 'bandstop'
            [b, a] = butter(order, Wn, 'stop');
        otherwise 
            error('Unknown filter response. Check spell');
    end
    freqz(b,a,[],Fs)
    % Apply the filter to the input signal
    filtered_signal = filter(b, a, input_signal);
end