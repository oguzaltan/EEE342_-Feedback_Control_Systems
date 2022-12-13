% % Initial Parameters
Cp = [1, 1, 1]; % change this Cp(1) --> first Cp etc.
% LPF = K_LPF/(t_LPF*s+1)
K_LPF = [0.01, 0.1, 0.1]; % change this
t_LPF = [0.08, 0.6, 0.05]; % change this
% P = Km/(tm*s+1)
Km = [62.857431678528650, 41.472131621434222, 14.041188559436800,]; % change this
tm = [0.098510664965569721, 0.088906000000000, 0.187113281786871]; % change this
% % Plot Bode Diagram of all 3 CLs
figure;
for k=1:3
[w,Tp] = freq_data(Cp(k),K_LPF(k),t_LPF(k),Km(k),tm(k))
subplot(2,1,1);
semilogx(w,20*log10(abs(Tp))); grid on; hold on;
subplot(2,1,2);
semilogx(w,unwrap(angle(Tp))*180/pi); grid on; hold on;
end
subplot(2,1,1); ylabel('Mag (dB)');
title('Bode Plots of estimated closed loop TFs');
subplot(2,1,1); ylabel('Phase (deg)');
xlabel('Frequency (rad/s)');

function [w,Tp] = freq_data(Cp,K_LPF,t_LPF,Km,tm)
no_of_samples = 5000;
w = logspace(-2,2,no_of_samples);
s = 1j*w;
Pv = Km./(tm*s+1);
Cv = K_LPF./(t_LPF*s+1);
Tv = (Pv.*Cv)./(1+Pv.*Cv);
Tp = Cp*Tv./(1+Cp*Tv);
end

