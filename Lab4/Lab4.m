Kp = 4.3;
T1 = 5; % minutes
T2 = 23; % minutes
Tm = 2.5; % minutes
Hf = tf(Kp, [T1*T2 T1+T2 1], 'IoDelay', Tm);
k = 5;
Ts = Tm/k; % minutes
Hfz = c2d(Hf, Ts, 'zoh');
[num,den] = tfdata(Hfz,'v'); 
Hfzz = tf(num, den, Ts, 'Variable', 'z^-1', 'IoDelay', k)
To = (T1 + T2)/2;
Ho = tf(1, [To 1], 'IoDelay', Tm);
Hoz = c2d(Ho, Ts, 'zoh');
[num,den] = tfdata(Hoz,'v'); 
Hozz = tf(num, den, Ts, 'Variable', 'z^-1', 'IoDelay', k)
Haux1 = Hozz/(1-Hozz);
Haux1.IODelay = 0;
Haux2 = Hfzz;
Haux2.IODelay = 0;
Hdc1 = minreal(Haux1/Haux2);
ZPKHdc1 = zpk(Hdc1)
Hdc2 = minreal(Hdc1*tf([1 -ZPKHdc1.P{1,1}(4)], 1, Ts, 'Variable', 'z^-1'));
Hdc2.Denominator{1,1} = Hdc2.Denominator{1,1}*1.9602;
Hdc2
zpk(Hdc2)