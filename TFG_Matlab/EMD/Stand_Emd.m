% load
%clean

clear all;
clc;

direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/EMD/EMD_values_train_6.mat';
load(direc);

% se utilizan todos los valores de las señales para estandarizar


XV = [XTrain_e{:}];
mu = mean(XV,2);
sg = std(XV,[],2);

XTrain_S_e = XTrain_e;
XTrain_S_e = cellfun(@(x)(x-mu)./sg,XTrain_S_e,'UniformOutput',false);

XTest_S_e = XTest_e;
XTest_S_e = cellfun(@(x)(x-mu)./sg,XTest_S_e,'UniformOutput',false);

save('valores_std_e_6','XTest_S_e','XTrain_S_e','YTrain','YTest');
