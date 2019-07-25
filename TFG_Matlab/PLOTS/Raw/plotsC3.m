% a=InDet(:,1)
% b=InDet(:,48)
% c=InDet(:,10)
% d=InDet(:,38)

load('/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/datos3.mat');

a=C3{1};
b=C3{49};
c=C3{97};
d=C3{145};


figure(1);

subplot(2,1,1);
plot(c)
title('Sinusoidal  + Random');
xlabel('Samples')
ylabel('Amplitude')
subplot(2,1,2);

plot(b)
title('Random ');
xlabel('Samples')
ylabel('Amplitude')
figure(2);
subplot(2,1,1);

plot(a)
title('white noise');

plot(d)

title('Random');

