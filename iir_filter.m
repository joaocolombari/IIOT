function filtered_signal = iir_filter(order, response, Fc, input_signal, Fs)
    % Chose response type
    Wn = Fc / (Fs/2);                           % Normalized frequency
    switch response 
        % Design butter filter 
        case 'highpass'
            [z, p, k] = butter(order, Wn, 'high');
        case 'lowpass'
            [z, p, k] = butter(order, Wn, 'low');
        case 'bandpass'
            [z, p, k] = butter(order, Wn, 'bandpass');
        case 'bandstop'
            [z, p, k] = butter(order, Wn, 'stop');
        otherwise 
            error('Unknown filter response. Check spell');
    end
    [sos, g] = zp2sos(z, p, k);
    h2 = dfilt.df2sos(sos, g);
    % Apply the filter to the input signal
    filtered_signal = filter(h2, input_signal);
end