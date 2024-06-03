<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<p align="center">
  <b> UNIVERSITY OF SÃO PAULO </b>
  <br>
  <b> SCHOOL OF ENGINEERING OF SÃO CARLOS </b>
  <br> <br>
  <img src="https://github.com/joaocolombari/Projeto2023/assets/105496210/b6cf7a10-fe32-4d49-b1be-8d29e147b0ec" width="150">
  <br> <br>
  DEPARTMENT OF ELECTRICAL AND COMPUTER ENGINEERING
  <br>
  SEL5776- Condition Monitoring of Industrial Assets
  <br> <br>
  <b> Practical activity: scientific data processing and analysis </b>
  <br><br>
  <b>Student: </b> João Victor Colombari Carlet <br><br>
  <b>University ID: </b> 5274502 <br><br>
</p>

<hr>

<h1>IIOT - Homework 1</h1>

<p>This project involves analyzing signal data from an industrial process. The data represents signals collected from different conditions of a tool: new, intermediate, and worn-out. The analysis includes plotting time-domain signals, obtaining frequency spectra, filtering signals, and calculating statistical features like RMS, average frequency, kurtosis, and skewness. Altho the signal was sampled at 1MHz, since the sensor's frequency response is 50 - 15kHz, the interest band was always set as such.</p>

<h2>Project Structure</h2>

<p>The project is divided into several sections, each performing a specific part of the analysis:</p>

<h3>Setup</h3>
<ul>
  <li><b>Purpose</b>: Initialize the workspace, load the required data files, and prepare the signals for analysis.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Load data files <code>dressPass0001.mat</code>, <code>dressPass0050.mat</code>, and <code>dressPass0150.mat</code>.</li>
      <li>Set the sampling frequency (<code>Fs</code>) and sampling period (<code>T</code>).</li>
      <li>Cut the irrelevant parts of the signals using the <code>cuts_signals</code> function.</li>
      <li>Store the signals and their corresponding time vectors in structures for organization.</li>
      <li>Clear unnecessary variables.</li>
    </ul>
  </li>
</ul>

<h3>Step a</h3>
<ul>
  <li><b>Purpose</b>: Plot the three signals in the time domain.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Use the <code>subplot</code> function to plot the signals <code>dressPass0001</code>, <code>dressPass0050</code>, and <code>dressPass0150</code>.</li>
      <li>Adjust the x-axis to represent time in seconds.</li>
    </ul>
  </li>
</ul>

<h3>Step b</h3>
<ul>
  <li><b>Purpose</b>: Obtain and plot the frequency spectrum of the three signals using the Fast Fourier Transform (FFT).</li>
  <li><b>Details</b>: 
    <ul>
      <li>Define the frequency range of interest (500 Hz to 15 kHz).</li>
      <li>Use a Hanning window of 8192 samples to calculate the FFT of the signals.</li>
      <li>Plot the entire frequency spectrum and the spectrum within the range of interest.</li>
      <li>Compare the results using different window sizes (8192 and 32768 points).</li>
    </ul>
  </li>
</ul>

<h3>Step c</h3>
<ul>
  <li><b>Purpose</b>: Select a frequency band that best represents the process conditions.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Plot the frequency spectra with the 32768 points window to identify the frequency band of interest.</li>
    </ul>
  </li>
</ul>

<h3>Step d</h3>
<ul>
  <li><b>Purpose</b>: Apply the </code>iir_filter</code> band-pass filter to the selected frequency band on the three signals in the time domain.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Check for pre-existing filtered signals and apply the filters if necessary.</li>
      <li>Load the filtered signals and plot them in the time domain.</li>
      <li>Calculate the FFT of the filtered signals using a 32768 points window.</li>
      <li>Plot the spectra within the range of interest (500 Hz to 15 kHz).</li>
    </ul>
  </li>
</ul>

<h3>Step e</h3>
<ul>
  <li><b>Purpose</b>: Calculate the RMS for the filtered and unfiltered signals and compare them.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Calculate the RMS using <code>calculate_rms</code> function</li>
      <li>Plot each sample in a subplot with filtered and unfiltered.</li>
    </ul>
  </li>
</ul>

<h3>Step f</h3>
<ul>
  <li><b>Purpose</b>: Calculate the mean value and standard deviation of the filtered and unfiltered RMS signals</li>
  <li><b>Details</b>: 
    <ul>
      <li>The author assumed two possible interpretations. The reader should compile changing the switched string <code>choice</code></li>
      <li>First choice calls <code>step_f_1st_choice</code>, that calculate the mean over the whole vector and pick some points of the filtered vector to calculate the errorbars </li>
      <li>Second choice calls <code>step_f_2nd_choice</code>, that Calulate the windowed mean using <code>calculate_mean</code>, and the windowed std using <code>calculate_std</code>for the filtered signal and plot the mean with the std around it.</li>
    </ul>
  </li>
</ul>

<h3>Step g</h3>
<ul>
  <li><b>Purpose</b>: Calculate and plot the energy, kurtosis and skewness of the signals.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Use the <code>calculate_energy</code>, <code>calculate_kurtosis</code> and <code>calculate_skewness</code> functions to calculate these statistical features for signal.</li>
      <li>Plot the energy, kurtosis and skewness values for each condition of the tool</li>
      <li>Normalizes each satistic around its maximum value and plot in a 3D bar-plot comparing them together with the average RMS.</li>
    </ul>
  </li>
</ul>

<h3>Histogram</h3>
<ul>
  <li><b>Purpose</b>: Calculate and plot Histogram of the signals.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Calculate the 50 bins Histogram for each signal and plot them together.</li>
    </ul>
  </li>
</ul>

<h3>Spectrogram</h3>
<ul>
  <li><b>Purpose</b>: Calculate and plot Spectrogram of the signals.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Use <code>plot_spectrogram</code> function to resample and plot the spectrogram for each signal. This function uses the same FFT configurations used so far.</li>
    </ul>
  </li>
</ul>

<h2>Usage</h2>
<ul>
  <li>Ensure you have MATLAB installed on your machine.</li>
  <li>Clone the repository and navigate to the project directory.</li>
  <li>Load the MATLAB scripts and data files available in the link in <code>links</code>.</li>
  <li>Run the scripts in sequence to perform the analysis and generate the plots.</li>
</ul>

<h2>Results</h2>
<p>The results of this analysis include time-domain plots, frequency spectra, and statistical features (RMS, average frequency, kurtosis, skewness) for each condition of the tool. These results help in understanding the behavior of the tool under different conditions and can be used for further analysis and process improvement.</p>

<h2>Conclusion</h2>
<p>This project demonstrates the application of signal processing techniques to analyze industrial process data. The steps outlined provide a comprehensive approach to understanding the data and extracting meaningful insights. The methodology can be extended to other types of signals and processes for similar analysis.</p>

</body>
</html>
