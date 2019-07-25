% a=C3{1};
% b=C3{49};
% c=C3{97};
% d=C3{145};
% 
a=C3{1};
b=C3{49};
c=C3{97};
d=C3{145};
% e=C4{193};
% f=C4{241};
% g=C4{289};
% h=C4{337};
% i=C4{432};


% a=C5{1};
% b=C5{49};
% c=C5{97};
% d=C5{145};


% a=C6{1};
% b=C6{49};
% c=C6{97};
% d=C6{145};

 dt=1/100;
 blksize=1024;
 large=512;
 
 

[f,APSD_raw1,APSD_N1] = APSD_M(d,dt,blksize);
[f,APSD_raw2,APSD_N2] = APSD_M(b,dt,blksize);
[f,APSD_raw3,APSD_N3] = APSD_M(c,dt,blksize);
[f,APSD_raw4,APSD_N4] = APSD_M(d,dt,blksize);


% [f,APSD_raw5,APSD_N5] = APSD_M(e,dt,blksize);
% [f,APSD_raw6,APSD_N6] = APSD_M(f,dt,blksize);
% [f,APSD_raw7,APSD_N7] = APSD_M(g,dt,blksize);
% [f,APSD_raw8,APSD_N8] = APSD_M(h,dt,blksize);
  
  
figure(1);

subplot(2,1,1);

plot(f,APSD_raw3)
title('Sinusoidal + Random');
xlabel('Hz')
ylabel('APSD')

subplot(2,1,2);

plot(f,APSD_raw1)
title('Random');
xlabel('Hz')
ylabel('APSD')



% figure(2);
% subplot(2,1,1);
% 
% plot(f,APSD_raw2)
% title('APSD-raw');
% xlabel('Hz')
% ylabel('APSD')
% 
% subplot(2,1,2);
% 
% plot(f,APSD_N2)
% title('APSD-Normalize');
% xlabel('Hz')
% ylabel('APSD')
% 
% figure(3);
% subplot(2,1,1);
% 
% plot(f,APSD_raw3)
% title('APSD-raw3');
% xlabel('Hz')
% ylabel('APSD')
% 
% subplot(2,1,2);
% 






% plot(f,APSD_N3)
% title('APSD-Normalize');
% xlabel('Hz')
% ylabel('APSD')

% figure(4);
% 
% subplot(2,1,1);
% 
% plot(f,APSD_raw4)
% title('APSD-raw');
% xlabel('Hz')
% ylabel('APSD')
% 
% subplot(2,1,2);
% 
% plot(f,APSD_N4)
% title('APSD-Normalize');
% xlabel('Hz')
% ylabel('APSD')


% figure(5);
% 
% subplot(2,1,1);
% 
% plot(f,APSD_raw5)
% title('APSD-raw');
% xlabel('Hz')
% ylabel('APSD')
% 
% subplot(2,1,2);
% 
% plot(f,APSD_N5)
% title('APSD-Normalize');
% xlabel('Hz')
% ylabel('APSD')
% 
% figure(6);
% 
% subplot(2,1,1);
% 
% plot(f,APSD_raw6)
% title('APSD-raw');
% xlabel('Hz')
% ylabel('APSD')
% 
% subplot(2,1,2);
% 
% plot(f,APSD_N6)
% title('APSD-Normalize');
% xlabel('Hz')
% ylabel('APSD')
% 
% 
% figure(7);
% 
% subplot(2,1,1);
% 
% plot(f,APSD_raw7)
% title('APSD-raw');
% xlabel('Hz')
% ylabel('APSD')
% 
% subplot(2,1,2);
% 
% plot(f,APSD_N7)
% title('APSD-Normalize');
% xlabel('Hz')
% ylabel('APSD')
%  
% 
% figure(8);
% 
% subplot(2,1,1);
% 
% plot(f,APSD_raw8)
% title('APSD-raw');
% xlabel('Hz')
% ylabel('APSD')
% 
% subplot(2,1,2);
% 
% plot(f,APSD_N8)
% title('APSD-Normalize');
% xlabel('Hz')
% ylabel('APSD')