
clear all;
load('/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/datos3.mat');


n=length(C3);
FS=100;
at=1/FS;
blksize=1024*2;
aidx = 1:blksize/2; 
f = aidx / blksize * FS;

C3_apsd=cell(n,1);

for i=1:n;
    N(i)=length(C3{i});
end

for i=1:n;
nblk(i) = floor( N(i) / blksize );
end

 % bloque conjugados
 


for i=1:n
    
    sig=C3{i};
    idx = (1:blksize-1:N(i));
    aidx = 1:blksize/2;
    
       
    for j=1:length(idx)-1
        
%         multiplication=zeros(1,blksize);
%         mitad=zeros(1,blksize/2);
%         
%         % bloque conjugados
%         x = zeros(1,blksize);
%         x = complex(x,0);
%  
%         conjugado=zeros(1,blksize);
%         conjugado= complex(conjugado,0);
%         % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         
%         x(j,:)=fft(sig(idx(j):idx(j+1)));        
%         conjugado(j,:)=conj(x(j,:));
%         multiplication(j,:)=x(j,:).*conjugado(j,:);
%         mitad(j,:)=multiplication(j,aidx);
        

%we add to the APSD in each iteration
    APSD(j,P_f_v) = APSD(j,P_f_v) + fac(P_f_v) .* conj(fac(P_f_v));



        
    end    
    
    apsd_tot=sum(mitad);
    
    C3_apsd{i}=apsd_tot;
    
    
    end


%    
% for i=1:n;
%     
%      
%      C3_apsd{i}= C3_apsd{i,1}/nblk(i);
% end
