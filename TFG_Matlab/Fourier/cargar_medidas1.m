%Programa para realizar las PSDs y CPSDs de las medidas del Dewetron
%también se calculan fases y coherencias
%son los datos ex-core superiores e inferiores

clear
close all



X=input('1 Medidas1 ,2 Medida2, 3 Medida3')

if X==1
    load archivos_mat/medidas1_1.mat
    data=medidas1_1;

elseif X==2
    
load archivos_mat/medidas1_2.mat

data=medidas1_2;

elseif X==3
    
load archivos_mat/medidas1_3.mat
data=medidas1_3;

else
    display('wrong number')

end

momento=data.fecha;


FS=data.FS;
at=1/FS;
N=length(data.registros(1).datos)
n=length(data.registros); %numero de columnas

blksize=1024*2;
 t=0:at:N*at-at;
 
%calculo de la media, y substración de ésta
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%55

%estadistica de las medidas


datos=zeros(N,n); %van a ser los datos sin su media, es decir, el ruido


for j=1:n;
DC(1,j)=  mean(data.registros(j).datos);
%DC(1,j)=1;
sigma(1,j)=std(data.registros(j).datos);
m3(1,j)=skewness(data.registros(j).datos);
m4(1,j)=kurtosis(data.registros(j).datos);
z_scores(:,j)=(data.registros(j).datos-DC(1,j))/sigma(1,j);
    datos(:,j)=data.registros(j).datos-DC(1,j);
  
end
%% Valor cuadrático medio normalizado %%
nrms=(sigma./DC)*100;
 
 est=[DC ;sigma; nrms; m3; m4];
  xlswrite('est1.xls',est)

 
    %clear DC
    clear sigma
    clear nrms
    clear m3
    clear m4
 
 %%
 
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PSDs y CPSDs%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 


 
%nblk number bloks 
% flor redondea hacia abajo
nblk = floor( length(datos) / blksize );


aidx = 1:blksize/2; 
f = aidx / blksize * FS; %frequency vector  

%PSD power spectral density
 NAPSD(n,blksize/2)=0;
APSD(n,blksize/2)=0; %PSDs de los 
CPSD_1(4,blksize/2)=0; %entre detectores superiores e inferiores
CPSD_2(4,blksize/2)=0; %entre detectores opuestos
CPSD_3(8,blksize/2)=0; %entre detectores contiguos

 M=hanning(blksize);
      
for i=1:nblk;

   idx = 1+(i-1)*blksize : i*blksize; %ir bloque por bloque
   
  for  ch=1:n;
      fac(ch,1:blksize) = fft(datos(idx,ch))'; %fft 
      APSD(ch,aidx) = APSD(ch,aidx) + fac(ch,aidx).*conj(fac(ch,aidx));
      
      
      %autoespectra
  end

  for ch=1:4;
      fac_1(ch,1:blksize) = fft(datos(idx,ch))';
      fac_1(ch+4,1:blksize) = fft(datos(idx,ch+4))';
  CPSD_1(ch,aidx)=CPSD_1(ch,aidx)+fac_1(ch,aidx).*conj(fac_1(ch+4,aidx)); %inferiores y superiores
 
  end
  
  for ch=1:2;
         fac_2(ch,1:blksize) = fft(datos(idx,ch))';
      fac_2(ch+2,1:blksize) = fft(datos(idx,ch+2))';
      
  CPSD_2(ch,aidx)=CPSD_2(ch,aidx)+fac_2(ch,aidx).*conj(fac_2(ch+2,aidx));%opuestos superiores
  
 
  end
  
   for ch=3:4;
           fac_2(ch+2,1:blksize) = fft(datos(idx,ch+2))';
      fac_2(ch+4,1:blksize) = fft(datos(idx,ch+4))';
  CPSD_2(ch,aidx)=CPSD_2(ch,aidx)+fac_2(ch+2,aidx).*conj(fac_2(ch+4,aidx)); %opuestos inferiores
   end
  
  for ch=1:4;
      
      if (ch==4)
             fac_3(ch-3,1:blksize) = fft(datos(idx,ch-3))';
      fac_3(ch,1:blksize) = fft(datos(idx,ch))';
  CPSD_3(ch,aidx)=CPSD_3(ch,aidx)+fac_3(ch,aidx).*conj(fac_3(ch-3,aidx));
      else 
           fac_3(ch,1:blksize) = fft(datos(idx,ch))';
      fac_3(ch+1,1:blksize) = fft(datos(idx,ch+1))';
  CPSD_3(ch,aidx)=CPSD_3(ch,aidx)+fac_3(ch,aidx).*conj(fac_3(ch+1,aidx)); %opuestos inferiores
      end
  
  end
   for ch=5:8;
      
      if (ch==8)
             fac_3(ch-3,1:blksize) = fft(datos(idx,ch-3))';
      fac_3(ch,1:blksize) = fft(datos(idx,ch))';
  CPSD_3(ch,aidx)=CPSD_3(ch,aidx)+fac_3(ch,aidx).*conj(fac_3(ch-3,aidx));
      else 
           fac_3(ch,1:blksize) = fft(datos(idx,ch))';
      fac_3(ch+1,1:blksize) = fft(datos(idx,ch+1))';
  CPSD_3(ch,aidx)=CPSD_3(ch,aidx)+fac_3(ch,aidx).*conj(fac_3(ch+1,aidx)); %opuestos inferiores
      end
  
  end
   
  
   
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%averaging%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:n;
     APSD(i,:)=  APSD(i,:)/nblk;
 NAPSD(i,:)=  APSD(i,:)/(0.5*FS*blksize*DC(1,i)^2);
end

for i=1:4;
    CPSD_1(i,:)=CPSD_1(i,:)/nblk;
    CPSD_2(i,:)=CPSD_2(i,:)/nblk;
end

for i=1:8;
    CPSD_3(i,:)=CPSD_3(i,:)/nblk;

    
end


%% calculating coherence and phase
 
 %inferiores con superiores
for i=1:4;
    coh_1(i,:)=abs(CPSD_1(i,:).*conj(CPSD_1(i,:)))./(APSD(i,:).*APSD(i+4,:));
    phase_1(i,:)=angle(CPSD_1(i,:))*180/pi;
end

% opuestos inferiores
for i=1:2;
     coh_2(i,:)=abs(CPSD_2(i,:).*conj(CPSD_2(i,:)))./(APSD(i,:).*APSD(i+2,:));
    phase_2(i,:)=angle(CPSD_2(i,:))*180/pi
end

% opuestos superiores

    for i=3:4;   
     coh_2(i,:)=abs(CPSD_2(i,:).*conj(CPSD_2(i,:)))./(APSD(i+2,:).*APSD(i+4,:))
    phase_2(i,:)=angle(CPSD_2(i,:))*180/pi

    end
    
% contiguos
    
    for i=1:8;   
        if (i==4)
               coh_3(i,:)=abs(CPSD_3(i,:).*conj(CPSD_3(i,:)))./(APSD(i,:).*APSD(i-3,:))
    phase_3(i,:)=angle(CPSD_3(i,:))*180/pi
    
    elseif (i==8)
               coh_3(i,:)=abs(CPSD_3(i,:).*conj(CPSD_3(i,:)))./(APSD(i,:).*APSD(i-3,:))
    phase_3(i,:)=angle(CPSD_3(i,:))*180/pi
            
    else
     coh_3(i,:)=abs(CPSD_3(i,:).*conj(CPSD_3(i,:)))./(APSD(i,:).*APSD(i+1,:))
    phase_3(i,:)=angle(CPSD_3(i,:))*180/pi
        end
    end

    
   
        

 
 %% resultados figuras

%PSDs de cada detector por separado

A=['r','k','b','g']
for i=1:4;
    
figure(1);
semilogy(f,NAPSD(i,1:blksize/2),[A(i)],'LineWidth',2)
set(gca,'xtick',[0:1:15])
xlim([0 15])
hold on
grid on
xlabel('Frequencia (Hz)')
ylabel('NAPSD')

end
title(momento)
legend(data.registros(1).nombre,data.registros(2).nombre,data.registros(3).nombre,data.registros(4).nombre)

A=['r','k','b','g']
for i=5:8;
    
figure(2);
semilogy(f,NAPSD(i,1:blksize/2),[A(i-4)],'LineWidth',2)
set(gca,'xtick',[0:1:15])
xlim([0 15])
hold on
grid on
xlabel('Frequencia (Hz)')
ylabel('APSD')

end
title(momento)
legend(data.registros(5).nombre,data.registros(6).nombre,data.registros(7).nombre,data.registros(8).nombre)%figuras de las coherencias y fases de detectores inf/sup





for i=1:4;
figure(3);

subplot(2,1,1)

plot(f,coh_1(i,1:blksize/2),'LineWidth',2)
hold on
title(['superiores vs inferiores'])
xlabel('Frecuencia (Hz)')
ylabel('Coherencia')
xlim([0 25])
ylim([0 1])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1])
set(gca,'xtick',[0:2.5:25])
subplot(2,1,2)
plot(f,phase_1(i,1:blksize/2),'LineWidth',2)
xlim([0 25])
hold on
xlabel('Frecuencia (Hz)')
ylabel('Fase (grados)')
ylim([-200 200])
set(gca,'xtick',[0:2.5:25])

end

legend('X1O-X1U','X2O-X2U','X3O-X3U','X4O-X4U')

%Figuras coherencias y fases de detectores enfrentados

for i=1:2;
figure(4);

subplot(2,1,1)

plot(f,coh_2(i,1:blksize/2),'LineWidth',2)
hold on
title(['opuestos superiores'])
xlabel('Frecuencia (Hz)')
ylabel('Coherencia')
ylim([0 1])
xlim([0 25])
set(gca,'xtick',[0:2.5:25])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1])
subplot(2,1,2)
plot(f,phase_2(i,1:blksize/2),'LineWidth',2)
hold on
xlabel('Frecuencia (Hz)')
ylabel('Fase (grados)')
xlim([0 25])
ylim([-200 200])
set(gca,'xtick',[0:2.5:25])

end

legend('X1O-X3O','X2O-X4O')


for i=3:4;
figure(5);

subplot(2,1,1)

plot(f,coh_2(i,1:blksize/2),'LineWidth',2)
hold on
title([data.registros(i+2).nombre 'vs' data.registros(i+4).nombre])
xlabel('Frecuencia (Hz)')
ylabel('Coherencia')
xlim([0 25])
ylim([0 1])
set(gca,'xtick',[0:2.5:25])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1])
subplot(2,1,2)
plot(f,phase_2(i,1:blksize/2),'LineWidth',2)
hold on
xlabel('Frecuencia (Hz)')
ylabel('Fase (grados)')
set(gca,'xtick',[0:2.5:25])
xlim([0 25])
ylim([-200 200])


end

legend('X1U-X3U','X2U-X4U')
%% figuras de detectores contiguos

for i=1:4;
figure(6);

subplot(2,1,1)

if (i==4)
    plot(f,coh_3(i,1:blksize/2),'LineWidth',2)
    hold on
title('detectores contiguos')
xlabel('Frecuencia (Hz)')
ylabel('Coherencia')
xlim([0 25])
ylim([0 1])
set(gca,'xtick',[0:2.5:25])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1])


subplot(2,1,2)
plot(f,phase_3(i,1:blksize/2),'LineWidth',2)
hold on
xlabel('Frecuencia (Hz)')
ylabel('Fase (grados)')
set(gca,'xtick',[0:2.5:25])
xlim([0 25])
ylim([-200 200])


else
    
plot(f,coh_3(i,1:blksize/2),'LineWidth',2)
hold on
title('detectores contiguos')
xlabel('Frecuencia (Hz)')
ylabel('Coherencia')
xlim([0 25])
ylim([0 1])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1])
set(gca,'xtick',[0:2.5:25])
subplot(2,1,2)
plot(f,phase_3(i,1:blksize/2),'LineWidth',2)
hold on
xlabel('Frecuencia (Hz)')
ylabel('Fase (grados)')
ylim([-200 200])
xlim([0 25])
set(gca,'xtick',[0:2.5:25])
end

end

legend('X1O-X2O','X2O-X3O','X3O-X4O','X4O-X1O')



for i=5:8;
figure(7);

subplot(2,1,1)


    
if (i==8)
plot(f,coh_3(i,1:blksize/2),'LineWidth',2)
hold on
title('detectores contiguos')
xlabel('Frecuencia (Hz)')
ylabel('Coherencia')
ylim([0 1])
xlim([0 25])
set(gca,'xtick',[0:2.5:25])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1])


subplot(2,1,2)
plot(f,phase_3(i,1:blksize/2),'LineWidth',2)
hold on
xlabel('Frecuencia (Hz)')
ylabel('Fase (grados)')
    ylim([-200 200])
    xlim([0 25])
    set(gca,'xtick',[0:2.5:25])
else
    
plot(f,coh_3(i,1:blksize/2),'LineWidth',2)
hold on
title('detectores contiguos')
xlabel('Frecuencia (Hz)')
ylabel('Coherencia')
ylim([0 1])
xlim([0 25])
set(gca,'xtick',[0:2.5:25])
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1])


subplot(2,1,2)
plot(f,phase_3(i,1:blksize/2),'LineWidth',2)
hold on
set(gca,'xtick',[0:2.5:25])
xlabel('Frecuencia (Hz)')
ylabel('Fase (grados)')
ylim([-200 200])
xlim([0 25])
end

end

legend('X1U-X2U','X2U-X3U','X3U-X4U','X4U-X1U')







z_gauss=sort(randn(1,N));
z_scores=sort(z_scores);

p = ((1:N)-0.5)' ./ N;


set(gca,'ytick',[0:0.1:1])
set(gca,'ytick',[0:0.1:1])


figure(8)
for i=1:4;

    subplot(2,2,i)
stairs(z_scores(:,i),p,'k-')
hold on
stairs(z_gauss,p,'r-');
xlabel('datos tipificados');
ylabel('probabilidad acumualda (p)');
title(data.registros(i).nombre)
set(gca,'ytick',[0:0.1:1])
set(gca,'xtick',[-5:1:5])
end
legend('datos','normal')
annotation(figure(8),'textbox',...
    [0.359593750000001 0.937923250564333 0.33259375 0.0620767494356651],...
    'String',{['Histogramas acumulados', momento]},...
    'LineStyle','none',...
    'FontSize',14,...
    'FitBoxToText','off');



figure (9)
for i=5:8;

    subplot(2,2,i-4)
stairs(z_scores(:,i),p,'k-');
hold on
stairs(z_gauss,p,'r-');
xlabel('datos tipificados');
ylabel('probabilidad acumualda (p)');
title(data.registros(i).nombre)
set(gca,'ytick',[0:0.1:1])
set(gca,'xtick',[-5:1:5])
end

legend('datos','normal')

annotation(figure(9),'textbox',...
    [0.359593750000001 0.937923250564333 0.33259375 0.0620767494356651],...
    'String',{['Histogramas acumulados', momento]},...
    'LineStyle','none',...
    'FontSize',14,...
    'FitBoxToText','off');






 %guardar las APSDs obtenidas que seran ajustadas
if X==1
    APSDmed1_1=APSD;
    NAPSDmed1_1=NAPSD;
    
    save outputs\APSDmed1_1 APSDmed1_1
     save outputs\NAPSDmed1_1 NAPSDmed1_1
save outputs\coh_1 coh_1
save outputs\phase_1 phase_1
save outputs\coh_2 coh_2
save outputs\phase_2 phase_2
save outputs\coh_3 coh_3
save outputs\phase_3 phase_3
save outputs\f f

save outputs\est est

elseif X==2

    NAPSDmed1_2=NAPSD;
    save outputs\NAPSDmed1_2 NAPSDmed1_2
    save outputs\f f
    
elseif X==3
     NAPSDmed1_3=NAPSD;
    save outputs\NAPSDmed1_3 NAPSDmed1_3
    save outputs\f f
    
else
    display('wrong number')
    
    
end

