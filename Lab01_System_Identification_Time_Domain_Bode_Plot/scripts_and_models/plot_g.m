figure; plot(position,'b','LineWidth',2);
hold on; plot(pos_sim,'r','LineWidth',2);
xlabel('Time (sec)'); ylabel('Position (degrees)');
title('Position vs Time');
legend('Hardware result','Simulation result', 'Location', 'best');