function Hd = Bpass_filter
%BPASS_FILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.11 and Signal Processing Toolbox 8.7.
% Generated on: 02-Nov-2022 12:48:59

% Equiripple Bandstop filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 20000;  % Sampling Frequency

Fpass1 = 300;             % First Passband Frequency
Fstop1 = 400;             % First Stopband Frequency
Fstop2 = 900;             % Second Stopband Frequency
Fpass2 = 1000;            % Second Passband Frequency
Dpass1 = 0.028774368332;  % First Passband Ripple
Dstop  = 0.001;           % Stopband Attenuation
Dpass2 = 0.057501127785;  % Second Passband Ripple
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass1 Fstop1 Fstop2 Fpass2]/(Fs/2), [1 0 ...
                          1], [Dpass1 Dstop Dpass2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
