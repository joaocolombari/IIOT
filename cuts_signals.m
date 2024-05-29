% -------------------------------------- % 
%      IIOT - Tarefa 1                   %
%      Gera sinais com inicio cortado    %
%      Joao Victor Colombari Carlet      %
%      jvccarlet@usp.br                  %
% -------------------------------------- % 

function [cut_signal] = cuts_signals(signal)
    % Calculate average amplitude
    avg_amplitude = mean(abs(signal));

    % Find where signal first passes the average amplitude
    start_idx = find(abs(signal) > avg_amplitude, 1, 'first');

    % Find where signal last goes under the average amplitude
    end_idx = find(abs(signal) > avg_amplitude, 1, 'last');

    % Extract portion of the signal between start and end indices
    cut_signal = signal(start_idx:end_idx);
end
