<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>README</title>
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
  SEL5752 - RECONFIGURABLE DEVICES AND HARDWARE DESCRIPTION LANGUAGE
  <br> <br>
  <b> Final Project - RISC-V Processor </b>
  <br><br>
  <b>Student: </b> João Victor Colombari Carlet <br><br>
  <b>University ID: </b> 5274502 <br><br>
</p>

<hr>

<h1>IIOT - Homework 1</h1>

<p>This project involves analyzing signal data from an industrial process. The data represents signals collected from different conditions of a tool: new, intermediate, and worn-out. The analysis includes plotting time-domain signals, obtaining frequency spectra, filtering signals, and calculating statistical features like RMS, average frequency, kurtosis, and skewness.</p>

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
  <li><b>Purpose</b>: Apply band-pass filters to the selected frequency band on the three signals in the time domain.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Check for pre-existing filtered signals and apply the filters if necessary.</li>
      <li>Load the filtered signals and plot them in the time domain.</li>
    </ul>
  </li>
</ul>

<h3>Step e</h3>
<ul>
  <li><b>Purpose</b>: Obtain and plot the frequency spectrum of the filtered signals using the FFT.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Calculate the FFT of the filtered signals using a 32768 points window.</li>
      <li>Plot the spectra within the range of interest (500 Hz to 15 kHz).</li>
    </ul>
  </li>
</ul>

<h3>Step f</h3>
<ul>
  <li><b>Purpose</b>: Calculate and plot the RMS and average frequency of the filtered signals.</li>
  <li><b>Details</b>: 
    <ul>
      <li>Use the <code>calc_rms_avg_freq</code> function to...</li>
    </ul>
  </li>
</ul>

</body>
</html>
