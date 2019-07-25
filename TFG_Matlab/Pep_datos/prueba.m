a=C3_n{1};
b=C3{49};
c=C3_n{97};
d=C3{145};
fs=100;



figure(1);

subplot(2,1,1);

plot(tc,pentropyc)
title('Sinusoidal + Random ');
xlabel('Time (s)')
ylabel('Spectral Entropy')

subplot(2,1,2);

plot(ta,pentropya)
title('Random');
xlabel('Time (s)')
ylabel('Spectral Entropy')
