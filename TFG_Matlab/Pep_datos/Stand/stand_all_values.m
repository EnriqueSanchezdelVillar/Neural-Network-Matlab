% load
direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/datos_tot_raw_s_resh.mat';
load(direc);

% se utilizan todos los valores de las señales para estandarizar


XV = [XTrain{:}];
mu = mean(XV,2);
sg = std(XV,[],2);

XTrain_SD = XTrain;
XTrain_SD = cellfun(@(x)(x-mu)./sg,XTrain_SD,'UniformOutput',false);

XTest_SD = XTest;
XTest_SD = cellfun(@(x)(x-mu)./sg,XTest_SD,'UniformOutput',false);

save('valores_stand_s_resh','XTest_SD','XTrain_SD','YTrain','YTest');