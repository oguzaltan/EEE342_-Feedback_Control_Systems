clc; 
close all;
clear all;
% load('prelab1_posData.mat');
% load('9-008-pos.mat');
load('2-005-pos.mat');
% load('2-06-pos.mat');
% plot(position);
samples = getdatasamples(position, [1:1001]);
[maxSample, indexMax] = max(samples);
indexMax = indexMax / 100;
steady = double(samples(length(samples)));
% M = double(maxSample) / 90;
s2u = steady * 1.02;
s2d = steady * 0.98;
for k = 117:500 % prelim -- 195, 008 -- 152, 06-- 117, 005 -- 36
    if double(samples(k)) <= s2u && double(samples(k)) >= s2d
        settling = (k - 1) / 100;
        break
    end
end
clear s2u s2d k
output = ['T_peak = ', num2str(indexMax)]; disp(output);
output = ['T_settling = ', num2str(settling)]; disp(output); disp(" ");

% zeta = abs(log(M)) / sqrt((pi^2) + (log(M))^2);
% omega_natural = 4 / (zeta * settling);
ztimesw = 4 / settling;
omega_natural = sqrt((ztimesw^2) + ((pi/indexMax)^2));
zeta = ztimesw / omega_natural;
output = ['zeta = ', num2str(zeta)]; disp(output);
output = ['omega = ', num2str(omega_natural)]; disp(output); disp(" ");

K1 = 0.1;
tau1 = 0.6;
amp = 2;

% BİLGE
% first = (2 * tau1 * zeta * omega_natural) + 1;
% second = (tau1 * omega_natural * omega_natural);
% third = (K1 * omega_natural * omega_natural) / (6 * amp * K1);
% fourth = 2 * zeta * omega_natural;
% d_f = tau1 * omega_natural * omega_natural * tau1;
% alpha = ((first * second) - third + fourth) / (d_f + 1);

% MERT
first = omega_natural ^ 2;
second = -6 * amp * first * tau1;
third = -2 * zeta * (omega_natural ^ 3) * tau1;
fourth = 24 * amp * (zeta ^ 2) * first * tau1;
fifth = -12 * amp * zeta * omega_natural;
d_first = 12 * amp * zeta * omega_natural * tau1;
d_second = -6 * amp;
d_third = -6 * amp * (omega_natural ^ 2) * (tau1 ^ 2);
alpha = (first + second + third + fourth + fifth) / (d_first + d_second + d_third);

K = (omega_natural ^ 2) / (6 * K1 * amp * alpha);
tau = ((tau1 * alpha) - 1) / (alpha * ((2 * zeta * omega_natural * tau1) - 1));
tau_x = tau1 * tau * alpha;
output = ['alpha = ', num2str(alpha)]; disp(output);
output = ['K = ', num2str(K)]; disp(output);
output = ['tau_x = ', num2str(tau_x)]; disp(output);
output = ['tau = ', num2str(tau)]; disp(output); disp(" ");
clear output first second third fourth fifth d_first d_second d_third M samples