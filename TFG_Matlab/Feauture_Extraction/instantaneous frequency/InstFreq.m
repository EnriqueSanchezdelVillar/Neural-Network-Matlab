%clean

clear all;
clc;
fs = 300;

direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/Con_resh/valores_reshape_raw.mat';
load(direc);


%Pentro
InstFTrain = cellfun(@(x)instfreq(x,fs)',XTrain,'UniformOutput',false);
InstFTest = cellfun(@(x)instfreq(x,fs)',XTest,'UniformOutput',false);



%Srandardize


XV = [InstFTrain{:}];
mu = mean(XV,2);
sg = std(XV,[],2);

XTrain2_s = InstFTrain;
XTrain2_s = cellfun(@(x)(x-mu)./sg,XTrain2_s,'UniformOutput',false);

XTest2_s = InstFTest;
XTest2_s = cellfun(@(x)(x-mu)./sg,XTest2_s,'UniformOutput',false);



save('Insfreq_stnd_resh.mat','XTrain2_s','XTest2_s','YTest','YTrain');