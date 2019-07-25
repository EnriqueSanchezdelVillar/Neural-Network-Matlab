clear all;

% Valores normales

load('/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/datos_tot_n.mat');

%% Frecuencia Inst (estimates the time-dependent frequency of a signal as the first moment of the power spectrogram.)

fs = 10;

CT=C3_n{1};
CQ=C4_n{1};
CV=C5_n{1};
CM=C6_n{1};


figure(1);

subplot(2,1,1);
pspectrum(CT,fs,'spectrogram','TimeResolution',0.5)
title('TEMPER Signal')

subplot(2,1,2);
pspectrum(CQ,fs,'spectrogram','TimeResolution',0.5)
title('CAUDAL Signal')

figure(2);
subplot(2,1,1);
pspectrum(CV,fs,'spectrogram','TimeResolution',0.5)
title('VIBRA Signal')

subplot(2,1,2);
pspectrum(CM,fs,'spectrogram','TimeResolution',0.5)
title('MIX Signal')

%%

[instFreqT,tT] = instfreq(CT,fs);
[instFreqQ,tQ] = instfreq(CQ,fs);
[instFreqV,tV] = instfreq(CV,fs);
[instFreqM,tM] = instfreq(CM,fs);

figure(3);
subplot(2,1,1);
plot(tT,instFreqT)
title('TEMPERA Signal')
xlabel('Time (s)')
ylabel('Instantaneous Frequency')

subplot(2,1,2);
plot(tQ,instFreqQ)
title('CAUDAL Signal')
xlabel('Time (s)')
ylabel('Instantaneous Frequency')


figure(4);
subplot(2,1,1);
plot(tV,instFreqV)
title('VIBRA Signal')
xlabel('Time (s)')
ylabel('Instantaneous Frequency')

subplot(2,1,2);
plot(tM,instFreqM)
title('MIX Signal')
xlabel('Time (s)')
ylabel('Instantaneous Frequency')


%% P Entropia(spectral entropy measures how spiky flat the spectrum of a signal is) 

[pentropyT,tT2] = pentropy(CT,fs);
[pentropyQ,tQ2] = pentropy(CQ,fs);
[pentropyV,tV2] = pentropy(CV,fs);
[pentropyM,tM2] = pentropy(CM,fs);

figure(5);

subplot(2,1,1)
plot(tT2,pentropyT)
title('TEMPE Signal')
ylabel('Spectral Entropy')

subplot(2,1,2)
plot(tQ2,pentropyQ)
title('CAUDAL Signal')
xlabel('Time (s)')
ylabel('Spectral Entropy')

figure(6);

subplot(2,1,1)
plot(tV2,pentropyV)
title('VIBRA Signal')
ylabel('Spectral Entropy')

subplot(2,1,2)
plot(tM2,pentropyM)
title('MIX Signal')
xlabel('Time (s)')
ylabel('Spectral Entropy')

