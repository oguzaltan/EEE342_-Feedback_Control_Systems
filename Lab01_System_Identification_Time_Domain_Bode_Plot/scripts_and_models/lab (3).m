clc; clear all; close all;

load('prelab1_posData.mat');
% plot(position)

samples = getdatasamples(position, [1: 1001]);
[maxSample, indexMax] = max(samples);
disp(maxSample); disp(indexMax);

steady = samples(length(samples));
settling = find(samples == steady);
settling = settling(4) / 100;
disp(settling); disp(steady);

inter1 = 4 / settling; % z_times_w

w = sqrt((inter1 ^ 2) + ((pi / (indexMax / 100)) ^ 2));
z = inter1 / w;

K1 = 13.3;
K2 = 0.01;
tau2 = 0.08;

K_alpha = (w^2) / (6 * K1 * K2);
first = K2 * K_alpha;
second = 2 * z * w;
third = 2 * z * w * tau2 * first;
fourth = 4 * (z^2) * (w^2) * tau2;
fifth = (w^2) * tau2;
denominator = 1 + ((w^2) * (tau2^2)) - (2 * z * w * tau2);

alpha = (-first + second + third - fourth + fifth) / denominator;
K = K_alpha / alpha;
tau = (1 - (tau2 * alpha)) / (1 - (2 * z * w * tau2)) / alpha;
tau_x = tau2 * alpha * tau;