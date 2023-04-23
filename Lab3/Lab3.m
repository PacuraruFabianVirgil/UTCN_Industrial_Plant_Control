den1 = tf(1,[0.3 1]);
den2 = tf(1,[22.5 1]);
den3 = tf(1,[40 1]);
Hf3 = 4.25*den1*den2*den3
step(Hf3)
t28 = 32;
t63 = 66;
Kf = 4.25;
T = 1.5*(t63-t28);
Tm = 1.5*(t28-t63/3);

%% Oppelt
% P controller
Kp1 = T/Tm/Kf;
Ti = Inf;
Ki1 = Kp1/Ti;
Td = 0;
Kd1 = Kp1*Td;
% PI controller
Kp2 = 0.8*T/Tm/Kf;
Ti = 3*Tm;
Ki2 = Kp2/Ti;
Td = 0;
Kd2 = Kp2*Td;
% PID controller
Kp3 = 1.2*T/Tm/Kf;
Ti = 2*Tm;
Ki3 = Kp3/Ti;
Td = 0.42*Tm;
Kd3 = Kp3*Td;

%% Kopelovici (underdamped)
% P controller
Kp1 = 1.41/Kf*(T/Tm)^0.917;
Ti = Inf;
Ki1 = Kp1/Ti;
Td = 0;
Kd1 = Kp1*Td;
% PI controller
Kp2 = 1.41/Kf*(T/Tm)^0.945;
Ti = 2.03*T*(Tm/T)^0.739;
Ki2 = Kp2/Ti;
Td = 0;
Kd2 = Kp2*Td;
% PID controller
Kp3 = 1.3/Kf*(T/Tm)^0.917;
Ti = 0.917*T*(Tm/T)^0.771;
Ki3 = Kp3/Ti;
Td = 0.59*Tm;
Kd3 = Kp3*Td;