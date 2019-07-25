

 dt=1/100;
 blksize=1024;
 large=512;
 %APSD_raw_3_1 =zeros(1,large);
 %APSDdB_3_4=zeros(1,512);
 %APSD_N_3_1=zeros(1,large);
 %APSD_N_dB_3_4=zeros(1,512);
 
 C6_raw_4=cell(48,1);
 C6_N_4=cell(48,1);
 
 
 for i=1:48
     
  [f,APSD_raw,APSD_N] = APSD_M(In_6_4(:,i),dt,blksize);
  
%   APSD_raw_3_1(i,:)=APSD_raw;
%   APSD_N_3_1(i,:)=APSD_N;
  
  
      C6_raw_4{i,1}=APSD_raw;
      C6_N_4{i,1}=APSD_N;
%       
 end
% 

% APSD_raw_3_4 =APSD_raw;
% APSDdB_3_4=APSDdB;
% APSD_N_3_4=APSD_N;
% APSD_N_dB_3_4=APSD_N_dB;
%t=APSD_raw(1,:);


