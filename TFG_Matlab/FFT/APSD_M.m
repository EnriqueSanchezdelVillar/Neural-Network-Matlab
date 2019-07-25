%función que calcula PSD
function [f,APSD_raw, APSD_N] = APSD_M(Signal,dt,blksize) %,APSDdB,APSD_N,APSD_N_dB


    
    data=Signal-mean(Signal); 

N=blksize; %number of points in a block
nblk = floor( length(data) / N ); %number of blocks


FS=1/dt;                     %frequency rate

% we know the relation among the Number of points of a register, dt and df:
%  N = 1/(dt*df), so:

df=1/(dt*N);                %now we have delta f for the frequency vector

% we use this vector to built the frequency vector
% In frequency domain we only can see until Nyquist frequency, Fmax
% So, Fnyquist = df/2
% The frequency vector will be:  f= [df : df: N* df/2]

f= df : df: N* df/2;

% inicial APSD = vector of zeros 
APSD(1, length(f))=0;


for i=1:nblk
    %we go block to block taking the corresponding index
    idx = 1+(i-1)*N : i*N;
    % Fourier transfor in each block
    fac(1: N) = fft(data(idx))'; %fft
    
    P_f_v= 1 : length(f); %vector from 1 until length(f), this vector keep constant
    
    %we add to the APSD in each iteration
    APSD(P_f_v) = APSD(P_f_v) + fac(P_f_v) .* conj(fac(P_f_v));
end


%averaging 
APSD_raw =  APSD/nblk;   %Normalización básica, solo dividida por el número de bloques
% APSDdB=  10*log10(APSD/mean(APSD(1:3))); %Normalizada en decibelios
 APSD_N =  APSD/(nblk*blksize*FS/2); %Normalizada para que su área coicida con la varianza

%APSD_N_dB=10*log10((APSD_N)/mean(APSD_N(1))); % Normalizada y en decibelios
%APSD_N_dB=10*log10(APSD_raw(1:blksize/2)/APSD_raw(1));
%APSD_N_dB=  10*log10((APSD_N)/mean(APSD_N(1:3))); %dividimos por el primer elemento de la APSD para que nuestra escala de decibelios comience en 0
end
