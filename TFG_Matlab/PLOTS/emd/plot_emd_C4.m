% load
direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/datos4.mat';
load(direc);


%a=C4{1};
% b=C4{49};
% c=C4{97};
% d=C4{145};
% e=C4{193};
% f=C4{241};
% g=C4{289};
% h=C4{337};
% i=C4{432};

emd(h,'Interpolation','pchip');



% figure(1);
% 
% subplot(2,1,1);
% 
% plot(a)
% title('Random');
% 
% subplot(2,1,2);
% 
% plot(b)
% title('white noise +Random');
% 
% figure(2);
% subplot(2,1,1);
% 
% plot(c)
% title('white noise +Random');
% subplot(2,1,2);
% 
% plot(d)
% 
% title('sinoidal+Random');
% 
% figure(3);
% subplot(2,1,1);
% 
% plot(e)
% title('sinoidal+Random');
% subplot(2,1,2);
% 
% plot(f)
% 
% title('white noise +Random');
% 
% figure(4);
% subplot(2,1,1);
% 
% plot(g)
% title('white noise +Random');
% subplot(2,1,2);
% 
% plot(h)
% 
% title('sinoidal+Random');
% 
% figure(5);
% subplot(2,1,1);
% 
% plot(i)
% title('sinoidal+Random');