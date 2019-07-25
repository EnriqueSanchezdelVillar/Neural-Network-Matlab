% clear all;
% clc;

direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos5_n.mat';
load(direc);

 fs = 10;
% 
a=C5_n{1};
b=C5_n{49};
c=C5_n{97};
d=C5_n{145};

% Señales

%FRecuencia plot(tT,instFreqT)

[instFreqa,ta] = instfreq(a,fs);
[instFreqb,tb] = instfreq(b,fs);
[instFreqc,tc] = instfreq(c,fs);
[instFreqd,td] = instfreq(d,fs);

%Pentropy   plot(tV2,pentropyV)

[pentropya,ta2] = pentropy(a,fs);
[pentropyb,tb2] = pentropy(b,fs);
[pentropyVc,tc2] = pentropy(c,fs);
[pentropyd,td2] = pentropy(d,fs);

%Señal 1

figure(1);

subplot(2,1,1);

plot(ta,instFreqa)
title('white noise + Random random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')
subplot(2,1,2);

plot(ta2,pentropya)
title('white noise + Random ');
xlabel('Time (s)')
ylabel('Spectral Entropy')


%Señal 2

figure(2);
subplot(2,1,1);

plot(tb,instFreqb)
title('sinoidal+ Random ');
subplot(2,1,2);
xlabel('Time (s)')
ylabel('Instantaneous Frequency')


plot(tb2,pentropyb)
title('sinoidal+ Random random');
xlabel('Time (s)')
ylabel('Spectral Entropy')


%Señal 3

figure(3);

subplot(2,1,1);

plot(tc,instFreqc)
title('sinoidal+ Random ');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')
subplot(2,1,2);

plot(tc2,pentropyVc)
title('sinoidal+ Random  ');
xlabel('Time (s)')
ylabel('Spectral Entropy')


%Señal 4

figure(4);

subplot(2,1,1);

plot(td,instFreqd)
title('sinoidal+ Random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')
subplot(2,1,2);

plot(td2,pentropyd)
title('sinoidal+ Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')