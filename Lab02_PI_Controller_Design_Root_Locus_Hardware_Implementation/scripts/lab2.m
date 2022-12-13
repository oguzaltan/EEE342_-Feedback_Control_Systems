clc; close all;
K = (41.86 + 32.47 + 12.041) / 3;
tau = (0.031 + 0.044 + 0.097) / 3;
h = 0.01;
plant = tf([-K*h 2*K],[tau*h (2*tau)+h 2]);
maks = zeros(991, 65);
mins = zeros(991, 1);
Ks = zeros(991,1);
count = 1;
z = -100:0.1:-1;
for i = -100:0.1:-1
    g_c = tf([-1 i], [i 0]);
    [R,L] = rlocus(g_c * plant);
    for j = 1:65
        maks(count, j) = max(real(R(:,j)));
    end
    count = count + 1;
end
[mins, Ks] = min(maks, [], 2);
plot(-100:0.1:-1, mins);
grid; title('z vs. d');
[~, i] = min(mins);
figure;
z1 = z(i);
g_c = tf([-1 z1], [z1 0]);
rlocus(g_c * plant);        % Gain 2.0657
title('Root Locus for z_{1}');
figure;
z2 = z1 / 2;
g_c = tf([-1 z2], [z2 0]);
rlocus(g_c * plant);        % Gain 3.9767
title('Root Locus for z_{2}');
figure;
z3 = z1 / 3;
g_c = tf([-1 z3], [z3 0]);
rlocus(g_c * plant);        % Gain 3.0608
title('Root Locus for z_{3}');
hold off;
