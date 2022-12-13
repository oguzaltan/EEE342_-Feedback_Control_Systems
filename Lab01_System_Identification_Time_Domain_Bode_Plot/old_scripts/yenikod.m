syms k tau tauX
k1 = 2;
k2 = 0.1;
tau2 = 0.05;
zeta = 0.5027;
%w0 = 4/(zeta*2.2); %14.8060
w0 = 16.3527;
e1 = 6*k*k1*k2 / (tau2*tau) == (w0^2) / tauX;
e2 = 6*k*k1*k2 / (tau2 + tau) == (w0^2) / (2*zeta*w0*tauX + 1);
e3 = 6*k*k1*k2 / (k*k2 + 1) == (w0^2) / (w0^2*tauX + 2*zeta*w0);
solution = solve ([e1, e2, e3],[k, tau, tauX]);
K = double(solution.k);
tau = double(solution.tau);
tauX_res = double(solution.tauX); 

figure; 
plot(position,'b','LineWidth',2);
hold on; 
plot(simout,'r','LineWidth',2);
xlabel('Time (sec)'); 
ylabel('Position (degrees)');
title('Position vs Time');
legend('Hardware result','Simulation result', 'Location', 'best');