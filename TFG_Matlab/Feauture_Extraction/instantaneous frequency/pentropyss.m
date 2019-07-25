
%clean

clear all;
clc;
fs = 300;

direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/Con_resh/valores_reshape_raw.mat';
load(direc);


%Pentro
pentropyTrain = cellfun(@(x)pentropy(x,fs)',XTrain,'UniformOutput',false);
pentropyTest = cellfun(@(x)pentropy(x,fs)',XTest,'UniformOutput',false);



%Srandardize


XV = [pentropyTrain{:}];
mu = mean(XV,2);
sg = std(XV,[],2);

XTrain2_s = pentropyTrain;
XTrain2_s = cellfun(@(x)(x-mu)./sg,XTrain2_s,'UniformOutput',false);

XTest2_s = pentropyTest;
XTest2_s = cellfun(@(x)(x-mu)./sg,XTest2_s,'UniformOutput',false);



save('pentro_stnd_resh.mat','XTrain2_s','XTest2_s','YTest','YTrain');