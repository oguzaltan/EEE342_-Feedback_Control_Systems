A = 0;
id = zeros(1,8);
id = input("Enter your ID: ", 's');
for i = 1:8
    u(i) = str2double(id(i));
end

for i = 1:8
  A = A+str2double(id(i));
end
A = A*A;
a1 = mean(id);
    
h_0 = 5;
h_in = 9;
g = 9.81;
K = 1;
a2 = 1;
b = 2;

gp = tf([1/A], [1 5*a1*sqrt(2*g)/(12*A)])
gc = tf([K K*a2], [1 b 0])

figure
rlocus(400*gp*gc) 
grid on
figure
sys = feedback(400*gp*gc,1);
bode(400*gp*gc); %% I chose gain K = 400 where the closed loop system is stable
grid on2
disp(a1);
disp(A);
