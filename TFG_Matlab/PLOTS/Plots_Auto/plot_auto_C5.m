


figure(1);

subplot(2,1,1);

plot(a_5)
title('white noise+Random');

subplot(2,1,2);

plot(b_5)
title('white noise+Random');

figure(2);
subplot(2,1,1);

plot(c_5)
title('sinoidal+Random');
subplot(2,1,2);

plot(d_5)

title('sinoidal+Random');


figure(3);
subplot(2,1,1);

plot(d_5)

title('Sinoidal+Random');
xlabel('Lags')
ylabel('Autocorrelation')
subplot(2,1,2);

plot(d_6)

title('Random ');
xlabel('Lags')
ylabel('Autocorrelation')