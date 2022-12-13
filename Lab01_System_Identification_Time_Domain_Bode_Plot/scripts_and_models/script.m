load('prelab1_posData.mat');
plot(position)
grid

samplepoints = getdatasamples(position,[1:1000]);

[maxvalue, indexofmax] = max(samplepoints);
disp(maxvalue);
disp(indexofmax);

plot(position)
hold on 
plot(simout)
xlabel("Time (seconds)")
ylabel("data")
legend("real data", "approximation")
grid on



