Kp = 1.25;
T1 = 9; % minutes
T2 = 14; % minutes
Tm = 3; % minutes
Hf = tf(Kp, [T1*T2 T1+T2 1], 'IoDelay', Tm);
k = Tm;
Ts = Tm/k; % minutes
Hfz = c2d(Hf, Ts, 'zoh');
[num,den] = tfdata(Hfz,'v'); 
Hfzz = tf(num, den, Ts, 'Variable', 'z^-1', 'IoDelay', k)
KsumNum = 1/sum(num);
P = tf(KsumNum*cat(2,zeros(1,k),Hfzz.num{1,1}), 1, Ts, 'Variable', 'z^-1');
Q = tf(KsumNum*Hfzz.den{1,1}, 1, Ts, 'Variable', 'z^-1');
Hkc1 = Q/(1-P);
Hkc2 = Hkc1;
ZPKHkc2 = zpk(Hkc2)
num = tf([1 -ZPKHkc2.P{1,1}(2)], 1, Ts, 'Variable', 'z^-1')*tf([1 -ZPKHkc2.P{1,1}(3)], 1, Ts, 'Variable', 'z^-1');
den = tf([1 -ZPKHkc2.P{1,1}(4)], 1, Ts, 'Variable', 'z^-1')*tf([1 -ZPKHkc2.P{1,1}(5)], 1, Ts, 'Variable', 'z^-1');
Hkc3 = minreal(Hkc2*num/sum(num.num{1,1})*den/sum(den.num{1,1}));
zpk(Hkc3)