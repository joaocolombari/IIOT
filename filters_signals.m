% -------------------------------------- % 
%      IIOT - Tarefa 1                   %
%      Gera sinais filtrados             %
%      Joao Victor Colombari Carlet      %
%      jvccarlet@usp.br                  %
% -------------------------------------- % 

% filter arguments
% filtered_signal = iir_bandpass_filter(order, response, Fc, input_signal, Fs)

% Define your variables
filtered_dressPass0001 = iir_filter(3,'bandpass',[500 15e3],dressPass0001,Fs);
filtered_dressPass0050 = iir_filter(3,'bandpass',[500 15e3],dressPass0050,Fs);
filtered_dressPass0150 = iir_filter(3,'bandpass',[500 15e3],dressPass0150,Fs);

% Save the variable to the .mat file
save('filtered_dressPass0001.mat', "filtered_dressPass0001");
save('filtered_dressPass0050.mat', "filtered_dressPass0050");
save('filtered_dressPass0150.mat', "filtered_dressPass0150");