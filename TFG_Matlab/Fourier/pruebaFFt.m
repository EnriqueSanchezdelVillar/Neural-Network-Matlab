%Programa para realizar las PSDs y CPSDs de las medidas del Dewetron
%también se calculan fases y coherencias
%son los datos ex-core superiores e inferiores



data=In_3_1;
FS=100;
at=1/FS;
N=length(In_3_1);
n=48; %numero de columnas

blksize=1024*2;
 t=0:at:N*at-at;
 


datos=zeros(N,n); %van a ser los datos sin su media, es decir, el ruido


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PSDs y CPSDs%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% for j=1:n;
% DC(1,j)=  mean(data);
% %DC(1,j)=1;
% sigma(1,j)=std(data);
% 
% datos(:,j)=data(j)-DC(1,j);
%   
% end

 
%nblk number bloks 
% flor redondea hacia abajo
nblk = floor( length(datos) / blksize );


aidx = 1:blksize/2; 
f = aidx / blksize * FS; %frequency vector  

%PSD power spectral density
 NAPSD(n,blksize/2)=0;
APSD(n,blksize/2)=0; %PSDs de los 


      
for i=1:nblk;

   idx = 1+(i-1)*blksize : i*blksize; %ir bloque por bloque
   
  for  ch=1:n;
      fac(ch,1:blksize) = fft(In_3_1(idx,ch))'; %fft 
      APSD(ch,aidx) = APSD(ch,aidx) + fac(ch,aidx).*conj(fac(ch,aidx));
      
      
      %autoespectra
  end

  
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%averaging%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:n;
     APSD(i,:)=  APSD(i,:)/nblk;
 %NAPSD(i,:)=  APSD(i,:)/(0.5*FS*blksize*DC(1,i)^2);
end


