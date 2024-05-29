% -------------------------------------- % 
%      IIOT - Tarefa 1                   %
%      Generates filtered signals        %
%      Joao Victor Colombari Carlet      %
%      jvccarlet@usp.br                  %
% -------------------------------------- % 

% filter arguments
% filtered_signal = iir_bandpass_filter(order, response, Fc, input_signal, Fs)

% Define your variables
filtered_dressPass0001 = iir_filter(5,'bandpass',[500 15e3],Y.dressPass0001,Fs);
filtered_dressPass0050 = iir_filter(5,'bandpass',[500 15e3],Y.dressPass0050,Fs);
filtered_dressPass0150 = iir_filter(5,'bandpass',[500 15e3],Y.dressPass0150,Fs);

% Save the variable to the .mat file
save('filtered_dressPass0001.mat', "filtered_dressPass0001");
save('filtered_dressPass0050.mat', "filtered_dressPass0050");
save('filtered_dressPass0150.mat', "filtered_dressPass0150");