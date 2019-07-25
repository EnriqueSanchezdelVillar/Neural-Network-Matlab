
% a=XTrain{160}; % Temper
% b=XTrain{230}; % Caudal
% c=XTrain{400}; %VIBRa
% d=XTrain{520}; % Misxto
% 
% figure(1);
% 
% subplot(2,1,1);
% 
% plot(a)
% title('TEMPERA Signal');
% 
% subplot(2,1,2);
% 
% plot(b)
% title('Caudal Signal');
% figure(2);
% subplot(2,1,1);
% 
% plot(c)
% title('Vibra Signal');
% subplot(2,1,2);
% 
% plot(d)
% 
% title('Mixto Signal');

% C3_n

a_3=xcorr(C3_n{45},150);
plot(a_3)


