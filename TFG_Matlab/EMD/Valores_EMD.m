%clean

clear all;
clc;

direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/Con_resh/valores_reshape_raw.mat';
load(direc);

%Inst FREC
XTrain_Emd = cellfun(@(x)emd(x,'Interpolation','pchip','Display',0)',XTrain,'UniformOutput',false);
XTrain_e = cellfun(@(x)sum(x(1:6,:)),XTrain_Emd,'UniformOutput',false);


XTest_Emd = cellfun(@(x)emd(x,'Interpolation','pchip','Display',0)',XTest,'UniformOutput',false);
XTest_e = cellfun(@(x)sum(x(1:6,:)),XTest_Emd,'UniformOutput',false);

%save
save('EMD_values_train.mat','XTrain_e','XTest_e','YTest','YTrain');

