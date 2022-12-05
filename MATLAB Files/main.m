clc
clear all
close all

[x,Fs] = audioread('speech_16.wav'); % Read in audio file
% Plot to find out which frequency to remove from signal
nfft = 2^10;
X = fft(x, nfft);
fstep = Fs/nfft;
fvec = fstep*(0: nfft/2-1);
fresp = 2*abs(X(1:nfft/2));
% plot(fvec,fresp)
% title('Single-Sided Amplitude Spectrum of x(t)')
% xlabel('Frequency (Hz)')
% ylabel('|X(f)|')

%play audio (Uncomment)
% sound(x,Fs);

% finding the maximum value & its index in the Y axis to calculate the 
% corresponding frequency
max_fresp = max(fresp);
f_ind = find(fresp==max_fresp);

% finding the peak frequency
peak_freq = fvec(f_ind);

% calling the Designed Bandstop Filter (Full Precision)
Hd = Apt_Pres_Filter;
Hd = double(Hd);
output = filter(Hd, x);
% sound(output, Fs); (Uncomment)

% Exporting the output audio file
audiowrite('Apt_quantized.wav', output, Fs);

% Plotting the filtered output
X2 = fft(output, nfft);
fresp2 = 2*abs(X2(1:nfft/2));
figure(2);
subplot(2,1,1);
plot(fvec,fresp)
title('Single-Sided Amplitude Spectrum of x(t)')
xlabel('Frequency (Hz)')
ylabel('|X(f)|')
subplot(2,1,2);
plot(fvec,fresp2), ylim([0 40]);
title('Single-Sided Amplitude Spectrum of FP restored x(t)')
xlabel('Frequency (Hz)')
ylabel('|X(f)|')






