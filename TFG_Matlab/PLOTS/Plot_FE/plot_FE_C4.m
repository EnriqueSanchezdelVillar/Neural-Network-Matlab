 clear all;
% clc;

%direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/datos4.mat';
direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos4_n.mat';
load(direc);

 fs = 10;
% 
% a=C4{1};
% b=C4{49};
% c=C4{97};
% d=C4{145};
% e=C4{193};
% f=C4{241};
% g=C4{289};
% h=C4{337};
% i=C4{432};


% Noramalise
a=C4_n{1};
b=C4_n{49};
c=C4_n{97};
d=C4_n{145};
e=C4_n{193};
f=C4_n{241};
g=C4_n{289};
h=C4_n{337};
i=C4_n{432};


% Señales

%FRecuencia plot(tT,instFreqT)

[instFreqa,ta] = instfreq(a,fs);
[instFreqb,tb] = instfreq(b,fs);
[instFreqc,tc] = instfreq(c,fs);
[instFreqd,td] = instfreq(d,fs);
[instFreqe,te] = instfreq(a,fs);
[instFreqf,tf] = instfreq(a,fs);
[instFreqg,tg] = instfreq(a,fs);
[instFreqh,th] = instfreq(a,fs);
[instFreqi,ti] = instfreq(a,fs);

%Pentropy   plot(tV2,pentropyV)

[pentropya,ta2] = pentropy(a,fs);
[pentropyb,tb2] = pentropy(b,fs);
[pentropyc,tc2] = pentropy(c,fs);
[pentropyd,td2] = pentropy(d,fs);
[pentropye,te2] = pentropy(e,fs);
[pentropyf,tf2] = pentropy(f,fs);
[pentropyg,tg2] = pentropy(g,fs);
[pentropyh,th2] = pentropy(h,fs);
[pentropyi,ti2] = pentropy(i,fs);

%Señal 1

figure(1);

subplot(2,1,1);

plot(ta,instFreqa)
title('Random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')

subplot(2,1,2);

plot(ta2,pentropya)
title('Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')

%Señal2
figure(2);
subplot(2,1,1);

plot(tb,instFreqb)
title('white noise +Random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')

subplot(2,1,2);

plot(tb2,pentropyb)
title('white noise +Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')


%Señal3
figure(3);
subplot(2,1,1);

plot(tc,instFreqc)
title('white noise +Random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')

subplot(2,1,2);

plot(tc2,pentropyc)
title('white noise +Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')


%Señal4
figure(4);
subplot(2,1,1);

plot(td,instFreqd)
title('sinoidal+Random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')
subplot(2,1,2);

plot(td2,pentropyd)
title('sinoidal+Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')


%Señal5
figure(5);
subplot(2,1,1);

plot(te,instFreqe)
title('sinoidal+Random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')


subplot(2,1,2);

plot(te2,pentropye)
title('sinoidal+Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')

%Señal6
figure(5);
subplot(2,1,1);

plot(tf,instFreqf)
title('white noise +Random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')

subplot(2,1,2);
plot(tf2,pentropyf)
title('white noise +Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')

%Señal7
figure(5);
subplot(2,1,1);

plot(tg,instFreqg)
title('white noise +Random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')

subplot(2,1,2);

plot(tg2,pentropyg)
title('white noise +Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')

%Señal8
figure(5);
subplot(2,1,1);

plot(th,instFreqh)
title('sinoidal+Random');
title('white noise +Random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')

subplot(2,1,2);

plot(th2,pentropyh)
title('sinoidal+Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')


%Señal9
figure(5);
subplot(2,1,1);

plot(ti,instFreqi)
title('sinoidal+Random');
xlabel('Time (s)')
ylabel('Instantaneous Frequency')


subplot(2,1,2);

plot(ti2,pentropyi)
title('sinoidal+Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')











