% clear all;
% clc;

direc=load('/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/FFT/sin_res/sce/C3fft.mat');
load(direc);

 fs = 10;
% Normalize
a=C3_N{1};
b=C3_N{49};
c=C3_N{97};
d=C3_N{145};

%raw
a_r=C3_raw{1};
b_r=C3_raw{49};
c_r=C3_raw{97};
d_r=C3_raw{145};

% Señales


%Señal 1

figure(1);

subplot(2,1,1);

plot(ta,instFreqa)
title('white noise');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')
subplot(2,1,2);

plot(ta2,pentropya)
title('white noise ');
xlabel('Time (s)')
ylabel('Spectral Entropy')


%Señal 2

figure(2);
subplot(2,1,1);

plot(tb,instFreqb)
title('white noise');
subplot(2,1,2);
xlabel('Time (s)')
ylabel('Instantaneous Frequency')


plot(tb2,pentropyb)
title('white noise');
xlabel('Time (s)')
ylabel('Spectral Entropy')


%Señal 3

figure(3);

subplot(2,1,1);

plot(tc,instFreqc)
title('random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')
subplot(2,1,2);

plot(tc2,pentropyVc)
title('random');
xlabel('Time (s)')
ylabel('Spectral Entropy')


%Señal 4

figure(4);

subplot(2,1,1);

plot(td,instFreqd)
title('random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')
subplot(2,1,2);

plot(td2,pentropyd)
title('random ');
xlabel('Time (s)')
ylabel('Spectral Entropy')


