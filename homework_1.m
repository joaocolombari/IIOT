% -------------------------------------- % 
%      IIOT - Tarefa 1                   %
%      Joao Victor Colombari Carlet      %
%      jvccarlet@usp.br                  %
% -------------------------------------- % 

%% Preliminar

close all 
clear

load("dressPass0001.mat");
load("dressPass0050.mat");
load("dressPass0150.mat");

Fs = 2e6;                   % Sampling frequency                    
T = 1/Fs;                   % Sampling period   

% - Filtrar para 15kHz e deixar salvo no workspace

exists_0001 = exist('filtered_dressPass0001.mat', 'file');
exists_0050 = exist('filtered_dressPass0050.mat', 'file');
exists_0150 = exist('filtered_dressPass0150.mat', 'file');

if ~(exists_0001 && exists_0050 && exists_0150)
    run('filters_signals.m');
end

clear exists_0001; clear exists_0050; clear exists_0150;

load("filtered_dressPass0001.mat");
load("filtered_dressPass0050.mat");
load("filtered_dressPass0150.mat");

% Corta inicio e final dos sinais (ruido)

dressPass0001 = cuts_signals(dressPass0001);
dressPass0050 = cuts_signals(dressPass0050);
dressPass0150 = cuts_signals(dressPass0150);
filtered_dressPass0001 = cuts_signals(filtered_dressPass0001);
filtered_dressPass0050 = cuts_signals(filtered_dressPass0050);
filtered_dressPass0150 = cuts_signals(filtered_dressPass0150);

L.dressPass0001 = length(dressPass0001);  % Length of signal
L.dressPass0050 = length(dressPass0050);  
L.dressPass0150 = length(dressPass0150);  
L.filtered_dressPass0001 = length(filtered_dressPass0001);  
L.filtered_dressPass0050 = length(filtered_dressPass0050); 
L.filtered_dressPass0150 = length(filtered_dressPass0150);  

t.dressPass0001 = (0:L.dressPass0001-1)*T; % Time vector
t.dressPass0050 = (0:L.dressPass0050-1)*T;   
t.dressPass0150 = (0:L.dressPass0150-1)*T;   
t.filtered_dressPass0001 = (0:L.filtered_dressPass0001-1)*T;   
t.filtered_dressPass0050 = (0:L.filtered_dressPass0050-1)*T;   
t.filtered_dressPass0150 = (0:L.filtered_dressPass0150-1)*T;   

%% A fazer

% - Implementar um filtro como funcao que me permita escolher a ordem

%% Passo a
% Utilizando o Matlab, plote os três sinais na mesma figura, usando a função 
% subplot do Matlab, e ajuste a escala do eixo “x” para ser dada em tempo 
% (em segundos), ao invés do N° de amostras.

% Plot 
figure(1); 

subplot(3,1,1); plot(t.filtered_dressPass0001,filtered_dressPass0001); 
title('Amostra 1'); ylabel('Amplitude'); xlabel('Tempo [s]');

subplot(3,1,2); plot(t.filtered_dressPass0050,filtered_dressPass0050); 
title('Amostra 2'); ylabel('Amplitude'); xlabel('Tempo [s]');

subplot(3,1,3); plot(t.filtered_dressPass0150,filtered_dressPass0150);
title('Amostra 3'); ylabel('Amplitude'); xlabel('Tempo [s]');

%% Passo b
% Obtenha o espectro de frequências dos 3 sinais utilizando a transformada 
% rápida de Fourier FFT . Desenvolva um script para fazer esse cálculo para 
% uma janela de hanning de 8.192 amostras do sinal puro em algum trecho do 
% sinal. Plote o espectro resultante de cada sinal em um gráfico (contendo 
% os 3 sinais no mesmo gráfico usando a função "hold on"). Formate o gráfico, 
% utilizando legendas, nome dos eixos, tamanho e estilo de fonte apropriado. 
% Ajuste a escala em frequência (eixo “x” do gráfico) para a faixa de 500 Hz 
% a 15 kHz. Salve na extensão “.fig” e “.jpg” (apresentar em editor de texto 
% o gráfico “.jpg”, o script utilizado e as etapas do processo).

% Definindo os parâmetros para o gráfico
f_min = 500; % Hz
f_max = 15000; % Hz

% Janela de Hanning de 8192 amostras
window_length = 4*8192;
num_windows = 10;
hanning_window = hann(window_length);
freq_axis = linspace(0, Fs/2, window_length/2);

% Calculando a FFT: signal_fft = FFT_hanning(signal, Fs, window_length)
dressPass0001_fft = FFT_hanning(dressPass0001,window_length,num_windows);
dressPass0050_fft = FFT_hanning(dressPass0050,window_length,num_windows);
dressPass0150_fft = FFT_hanning(dressPass0150,window_length,num_windows);

filtered_dressPass0001_fft = FFT_hanning(filtered_dressPass0001,window_length,num_windows);
filtered_dressPass0050_fft = FFT_hanning(filtered_dressPass0050,window_length,num_windows);
filtered_dressPass0150_fft = FFT_hanning(filtered_dressPass0150,window_length,num_windows);

% Plot sem corte de frequencias 
figure(2); 

subplot(3,1,1); plot(freq_axis, dressPass0001_fft);
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

subplot(3,1,2); plot(freq_axis, dressPass0050_fft); 
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

subplot(3,1,3); plot(freq_axis, dressPass0150_fft); 
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

% Plot filtrado
figure(3); 

subplot(3,1,1); plot(freq_axis, filtered_dressPass0001_fft);
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

subplot(3,1,2); plot(freq_axis, filtered_dressPass0050_fft); 
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

subplot(3,1,3); plot(freq_axis, filtered_dressPass0150_fft); 
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

% Plot cortando de 500 a 15kHz
figure(4); 

subplot(3,1,1); plot(freq_axis, dressPass0001_fft);
xlim([500 15e3]);
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

subplot(3,1,2); plot(freq_axis, dressPass0050_fft); 
xlim([500 15e3]);
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

subplot(3,1,3); plot(freq_axis, dressPass0150_fft); 
xlim([500 15e3]);
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

%% Passo c

% Observando o gráfico original, no Matlab (.fig), selecione uma banda de 
% frequência que melhor representa as condições do processo explicadas 
% anteriormente, isto é, que representam as 3 condições que resumem o 
% processo: ferramenta nova, intermediária, e desgastada, com base na 
% intensidade e frequência dos sinais

% Plot cortando de 500 a 15kHz
figure(5); 

subplot(3,1,1); plot(freq_axis, dressPass0001_fft(1:window_length/2));
xlim([500 15e3]);
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

subplot(3,1,2); plot(freq_axis, dressPass0050_fft(1:window_length/2)); 
xlim([500 15e3]);
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

subplot(3,1,3); plot(freq_axis, dressPass0150_fft(1:window_length/2)); 
xlim([500 15e3]);
title('Amostra 1'); ylabel('Amplitude'); xlabel('Frequencia [Hz]');

%% Passo d

% A partir da seleção desta banda, aplique filtros "passa-faixas" na banda 
% escolhida nos 3 sinais, no domínio do tempo, implementando a função 
% fornecida: “BandPassFilter” (Filtro IIR Butterworth, usar ordem 5)

% Nao encontrei essa funcao. Vou usar bandpass()

% filtered_dressPass0001 = bandpass(dressPass0001, [500 250e3], Fs, ...
%                                         'ImpulseResponse', 'iir');
% filtered_dressPass0050 = bandpass(dressPass0050, [500 250e3], Fs, ...
%                                         'ImpulseResponse', 'iir');
% filtered_dressPass0150 = bandpass(dressPass0150, [500 250e3], Fs, ...
%                                         'ImpulseResponse', 'iir');

%% Passo e

% Calcule o RMS (root mean square) para os sinais filtrados, resultantes do 
% processo solicitado no item "c", considerando blocos de 2048 amostras no 
% sinal puro. Considere a função fornecida “RMSCalculation”. Repita o 
% processo, calculando o RMS a cada 2048 amostras para os sinais puros sem 
% ser filtrado. Plote os sinais de cada condição (RMS com e sem filtro) no 
% mesmo gráfico usando o comando “hold on”. Plote os 3 gráficos na mesma 
% figura, com a função subplot. Formate os gráficos, ajustando legendas, 
% nome dos eixos, tamanho e estilo de fonte etc. Salve os arquivos “.fig” e 
% “.jpg” (para apresentar em documento juntamente ao script desenvolvido e 
% os passos realizados)

% RMS usando 2048 amostras para 
%   - Filtrado
%   - Nao filtrado
% Plota por amostra filtrado e nao num mesmo grafico com as tres amostras

% Definir o tamanho do bloco
block_size = 2048;

rms_filtered_dressPass0001 = calculate_rms(filtered_dressPass0001, block_size);
rms_filtered_dressPass0050 = calculate_rms(filtered_dressPass0050, block_size);
rms_filtered_dressPass0150 = calculate_rms(filtered_dressPass0150, block_size);

rms_dressPass0001 = calculate_rms(dressPass0001, block_size);
rms_dressPass0050 = calculate_rms(dressPass0050, block_size);
rms_dressPass0150 = calculate_rms(dressPass0150, block_size);

figure(6);

% Amostra 1
subplot(3,1,1);
plot(rms_filtered_dressPass0001); hold on; 
plot(rms_dressPass0001); hold off; 
legend('Filtrado','Nao filtrado'); xlabel('Bloco'); ylabel('RMS'); 
title('RMS primeira amostra');
grid on;

% Amostra 2
subplot(3,1,2);
plot(rms_filtered_dressPass0050); hold on; 
plot(rms_dressPass0050); hold off; 
legend('Filtrado','Nao filtrado'); xlabel('Bloco'); ylabel('RMS'); 
title('RMS segunda amostra');
grid on;


% Amostra 3
subplot(3,1,3);
plot(rms_filtered_dressPass0150); hold on; 
plot(rms_dressPass0150); hold off; 
legend('Filtrado','Nao filtrado'); xlabel('Bloco'); ylabel('RMS'); 
title('RMS terceira amostra');
grid on;


%% Passo f

% Calcule o valor médio e o desvio padrão dos sinais RMS obtidos no item 
% "d" de cada uma das três condições da ferramenta, com e sem filtro, e 
% plote o resultado em um mesmo gráfico (use o comando “errorbar” do Matlab). 
% Formate o gráfico, inserindo legenda para identificar os sinais, ajustar 
% fonte, nome dos eixos etc. Salve os arquivos “.fig” e “jpg” (para 
% apresentar em documento de texto juntamente ao script desenvolvido e 
% passos realizados)

% Calcular o valor médio e o desvio padrão dos sinais RMS filtrados 
mean_filtered = [mean(rms_filtered_dressPass0001) ...
                 mean(rms_filtered_dressPass0050) ...
                 mean(rms_filtered_dressPass0150)];

std_filtered = [std(rms_filtered_dressPass0001) ...
                std(rms_filtered_dressPass0050) ...
                std(rms_filtered_dressPass0150)];

% Calcular o valor médio e o desvio padrão dos sinais RMS nao filtrados 
mean_unfiltered = [mean(rms_dressPass0001) ...
        mean(rms_dressPass0050) ...
        mean(rms_dressPass0150)];

std_unfiltered = [std(rms_dressPass0001) ...
       std(rms_dressPass0050) ...
       std(rms_dressPass0150)];

% Plotar o resultado em um mesmo gráfico usando errorbar
figure(7);

subplot(2,1,1); 
errorbar(1:3, mean_filtered, std_filtered, '-o', 'DisplayName', 'Filtrado');
xlim([0.5 3.5]); xticks(1:1:3); 
legend('Media filtrado'); xlabel('Amostra'); ylabel('Magnitude'); 
title('Estatisticas amostras filtradas');

subplot(2,1,2); 
errorbar(1:3, mean_unfiltered, std_unfiltered, '-o', 'DisplayName', 'Não Filtrado');
xlim([0.5 3.5]); xticks(1:1:3);
legend('Media nao filtrado'); xlabel('Amostra'); ylabel('Magnitude'); 
title('Estatisticas amostras nao filtradas');

%% Passo g

% Repita os passos e) e f) substituindo o RMS pelo cálculo da a energia do 
% sinal, kurtosis e skewness. No entanto, para o passo f), calcular apenas 
% a média, plotar sinais no formato de gráfico de barras, comparando os 
% sinais filtrados com sem filtro

% Calcular a energia do sinal para os sinais filtrados 
energy_filtered_dressPass0001 = zeros(1, num_blocks);
energy_filtered_dressPass0050 = zeros(1, num_blocks);
energy_filtered_dressPass0150 = zeros(1, num_blocks);

for i = 1:num_blocks
    start_index = (i - 1) * block_size + 1;
    end_index = i * block_size;
    energy_filtered_dressPass0001(i) = sum(filtered_dressPass0001(start_index:end_index).^2);
    energy_filtered_dressPass0050(i) = sum(filtered_dressPass0050(start_index:end_index).^2);
    energy_filtered_dressPass0150(i) = sum(filtered_dressPass0150(start_index:end_index).^2);
end

% Calcular a energia do sinal para os sinais nao filtrados 
energy_dressPass0001 = zeros(1, num_blocks);
energy_dressPass0050 = zeros(1, num_blocks);
energy_dressPass0150 = zeros(1, num_blocks);

for i = 1:num_blocks
    start_index = (i - 1) * block_size + 1;
    end_index = i * block_size;
    energy_dressPass0001(i) = sum(dressPass0001(start_index:end_index).^2);
    energy_dressPass0050(i) = sum(dressPass0050(start_index:end_index).^2);
    energy_dressPass0150(i) = sum(dressPass0150(start_index:end_index).^2);
end

mean_energy_filtered = [mean(energy_filtered_dressPass0001) ...
                         mean(energy_filtered_dressPass0050) ...
                         mean(energy_filtered_dressPass0150)];

mean_energy_unfiltered = [mean(energy_dressPass0001) ...
                         mean(energy_dressPass0050) ...
                         mean(energy_dressPass0150)];


% Calcular a kurtosis para os sinais filtrados 
kurtosis_filtered_dressPass0001 = zeros(1, num_blocks);
kurtosis_filtered_dressPass0050 = zeros(1, num_blocks);
kurtosis_filtered_dressPass0150 = zeros(1, num_blocks);

for i = 1:num_blocks
    start_index = (i - 1) * block_size + 1;
    end_index = i * block_size;
    kurtosis_filtered_dressPass0001(i) = kurtosis(filtered_dressPass0001(start_index:end_index),0);
    kurtosis_filtered_dressPass0050(i) = kurtosis(filtered_dressPass0050(start_index:end_index),0);
    kurtosis_filtered_dressPass0150(i) = kurtosis(filtered_dressPass0150(start_index:end_index),0);
end

% Calcular a kurtosis para os sinais nao filtrados 
kurtosis_dressPass0001 = zeros(1, num_blocks);
kurtosis_dressPass0050 = zeros(1, num_blocks);
kurtosis_dressPass0150 = zeros(1, num_blocks);

for i = 1:num_blocks
    start_index = (i - 1) * block_size + 1;
    end_index = i * block_size;
    kurtosis_dressPass0001(i) = kurtosis(dressPass0001(start_index:end_index),0);
    kurtosis_dressPass0050(i) = kurtosis(dressPass0050(start_index:end_index),0);
    kurtosis_dressPass0150(i) = kurtosis(dressPass0150(start_index:end_index),0);
end

mean_kurtosis_filtered = [mean(kurtosis_filtered_dressPass0001) ...
                          mean(kurtosis_filtered_dressPass0050) ...
                          mean(kurtosis_filtered_dressPass0150)];

mean_kurtosis_unfiltered = [mean(kurtosis_dressPass0001) ...
                          mean(kurtosis_dressPass0050) ...
                          mean(kurtosis_dressPass0150)];

% Calcular a skewness para os sinais filtrados 
skewness_filtered_dressPass0001 = zeros(1, num_blocks);
skewness_filtered_dressPass0050 = zeros(1, num_blocks);
skewness_filtered_dressPass0150 = zeros(1, num_blocks);

for i = 1:num_blocks
    start_index = (i - 1) * block_size + 1;
    end_index = i * block_size;
    skewness_filtered_dressPass0001(i) = skewness(filtered_dressPass0001(start_index:end_index),0);
    skewness_filtered_dressPass0050(i) = skewness(filtered_dressPass0050(start_index:end_index),0);
    skewness_filtered_dressPass0150(i) = skewness(filtered_dressPass0150(start_index:end_index),0);
end

% Calcular a skewness para os sinais nao filtrados 
skewness_dressPass0001 = zeros(1, num_blocks);
skewness_dressPass0050 = zeros(1, num_blocks);
skewness_dressPass0150 = zeros(1, num_blocks);

for i = 1:num_blocks
    start_index = (i - 1) * block_size + 1;
    end_index = i * block_size;
    skewness_dressPass0001(i) = skewness(dressPass0001(start_index:end_index),0);
    skewness_dressPass0050(i) = skewness(dressPass0050(start_index:end_index),0);
    skewness_dressPass0150(i) = skewness(dressPass0150(start_index:end_index),0);
end

mean_skewness_filtered = [mean(skewness_filtered_dressPass0001) ...
                          mean(skewness_filtered_dressPass0050) ...
                          mean(skewness_filtered_dressPass0150)];

mean_skewness_unfiltered = [mean(skewness_dressPass0001) ...
                          mean(skewness_dressPass0050) ...
                          mean(skewness_dressPass0150)];

% Plotar o resultado em um mesmo gráfico usando errorbar
figure(8);

subplot(3,2,1); 
bar(1:3, mean_energy_filtered, 'DisplayName', 'Filtrado');
xlim([0.5 3.5]); xticks(1:1:3); 
legend('Media energia filtrado'); xlabel('Amostra'); ylabel('Magnitude'); 
title('Estatisticas amostras filtradas');

subplot(3,2,2); 
bar(1:3, mean_energy_unfiltered, 'DisplayName', 'Filtrado');
xlim([0.5 3.5]); xticks(1:1:3); 
legend('Media energia nao filtrado'); xlabel('Amostra'); ylabel('Magnitude'); 
title('Estatisticas amostras filtradas');

subplot(3,2,3); 
bar(1:3, mean_kurtosis_filtered, 'DisplayName', 'Filtrado');
xlim([0.5 3.5]); xticks(1:1:3); 
legend('Media kurtosis filtrado'); xlabel('Amostra'); ylabel('Magnitude'); 
title('Estatisticas amostras filtradas');

subplot(3,2,4); 
bar(1:3, mean_kurtosis_unfiltered, 'DisplayName', 'Filtrado');
xlim([0.5 3.5]); xticks(1:1:3); 
legend('Media kurtosis nao filtrado'); xlabel('Amostra'); ylabel('Magnitude'); 
title('Estatisticas amostras filtradas');

subplot(3,2,5); 
bar(1:3, mean_skewness_filtered, 'DisplayName', 'Filtrado');
xlim([0.5 3.5]); xticks(1:1:3); 
legend('Media skewness filtrado'); xlabel('Amostra'); ylabel('Magnitude'); 
title('Estatisticas amostras filtradas');

subplot(3,2,6); 
bar(1:3, mean_skewness_unfiltered, 'DisplayName', 'Filtrado');
xlim([0.5 3.5]); xticks(1:1:3); 
legend('Media skewness nao filtrado'); xlabel('Amostra'); ylabel('Magnitude'); 
title('Estatisticas amostras filtradas');



%% Passo h

% Por fim, sintetizar uma breve discussão dos resultados, com considerações 
% finais e gerais, descrevendo: como os sinais das 3 condições estudadas se 
% comportam ao longo do tempo e da frequência? Qual foi o impacto da 
% seleção de uma banda de frequência específica e o que se observa quando 
% se compara os valores médios da análise estátistica com as diferentes 
% métricas aplicadas dos sinais filtrados em relação aos não filtrados



%%

% plot(f,fft_single_dressPass0001,"LineWidth",3) 
% title("Single-Sided Amplitude Spectrum of X(t)")
% xlabel("f (Hz)")
% ylabel("|P1(f)|")