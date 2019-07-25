%  X=C3{190};
% [imf2,residual2,info2] = emd(X,'Interpolation','pchip');
% 
%   s2=imf2(:,2:end);
%   S2 = sum(s2,2);
%   plot(S2)


figure(1);
subplot(2,1,1);
plot(S2)
title('Signal Sinusoidal+Random')
xlabel('Time (s)')
ylabel('Frequency')

subplot(2,1,2);
plot(S1)
title('Random')
xlabel('Time (s)')
ylabel('Frequency')

