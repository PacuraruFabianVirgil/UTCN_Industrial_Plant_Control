%% DataSet1
t = [0, 0.2000, 0.4000, 0.6000, 0.8000, 1.0000, 1.2000, 1.4000, 1.6000, 1.8000, 2.0000, 2.2000, 2.4000,... 
    2.6000, 2.8000, 3.0000, 3.2000, 3.4000, 3.6000, 3.8000, 4.0000, 4.2000, 4.4000, 4.6000, 4.8000, 5.0000];
y = [0, 0.5652, 1.0365, 1.4294, 1.7570, 2.0302, 2.2579, 2.4478, 2.6061, 2.7381, 2.8481, 2.9399, 3.0163,... 
    3.0801, 3.1333, 3.1776, 3.2146, 3.2454, 3.2711, 3.2926, 3.3104, 3.3253, 3.3377, 3.3481, 3.3567, 3.3639];
plot(t,y,'r--o')
hold on;
k = 3.4;
T = 1.1;
H = tf(k,[T 1]);
step(H)
line([0 1.1],[0 3.36])
line([0 5],[3.36 3.36])
line([1.1 1.1],[0 3.36])
title('DataSet1 Tangent method')
legend('actual','approx')
grid on;

%% DataSet2
t = [0, 0.2000, 0.4000, 0.6000, 0.8000, 1.0000, 1.2000, 1.4000, 1.6000, 1.8000, 2.0000, 2.2000, 2.4000,...
    2.6000, 2.8000, 3.0000, 3.2000, 3.4000, 3.6000, 3.8000, 4.0000, 4.2000, 4.4000, 4.6000, 4.8000, 5.0000];
y = [0, 0, 0, 0.5262, 1.0291, 1.4232, 1.7320, 1.9740, 2.1636, 2.3121, 2.4285, 2.5198, 2.5912, 2.6472,...
    2.6911, 2.7255, 2.7525, 2.7736, 2.7901, 2.8031, 2.8132, 2.8212, 2.8274, 2.8323, 2.8361, 2.8391];
plot(t,y,'r--o')
hold on;
k = 2.85;
T = 0.84;
Tm = 0.42;
H = tf(k,[T 1],'inputdelay',Tm);
step(H)
line([0.4 1.24],[0 2.84])
line([0 5],[2.84 2.84])
line([1.24 1.24],[0 2.84])
title('DataSet2 Tangent method')
legend('actual','approx')
grid on;

%% DataSet3
t = [0, 0.2000, 0.4000, 0.6000, 0.8000, 1.0000, 1.2000, 1.4000, 1.6000, 1.8000, 2.0000, 2.2000, 2.4000,...
    2.6000, 2.8000, 3.0000, 3.2000, 3.4000, 3.6000, 3.8000, 4.0000, 4.2000, 4.4000, 4.6000, 4.8000, 5.0000];
y = [0, 0.3196, 1.0179, 1.8455, 2.6711, 3.4310, 4.0994, 4.6710, 5.1508, 5.5485, 5.8750, 6.1413, 6.3576,...
    6.5326, 6.6739, 6.7876, 6.8791, 6.9527, 7.0117, 7.0590, 7.0970, 7.1274, 7.1518, 7.1714, 7.1870, 7.1996];
plot(t,y,'r--o')
hold on; 
grid on;
k = 7.3;
T = 1.15;
Tm = 0.2;
H = tf(k,[T 1],'inputdelay',Tm);
step(H)
deriv=[]; 
for i=1:(length(t)-1) 
    deriv(i)=(y(i+1)-y(i))/(t(i+1)-t(i)); 
plot(t(i), deriv(i),'*k'); 
end
line([0.15 1.9],[0 7.2])
line([0 5],[7.2 7.2])
line([1.9 1.9],[0 7.2])
title('DataSet3 Tangent method')
hold off;
legend('actual','approx')
grid on;
%Cohen Coon
y28 = 0.28*y(end);
y63 = 0.632*y(end);
T28 = 0.7;
T63 = 1.4;
T = 1.5*(T63-T28);
Tm = 1.5*(T28-T63/3);
Hkoh = tf(k,[T 1],'inputdelay',Tm);
figure;
plot(t,y,'r--o')
hold on; 
step(Hkoh)
title('DataSet3 Cohen method')
legend('actual','approx')
grid on;