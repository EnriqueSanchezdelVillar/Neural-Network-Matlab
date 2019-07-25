% load
direc= '/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Feature_Extrac/Not_n/instfreq_pentro_s_resh.mat';
load(direc);

% se utilizan todos los valores de las señales para estandarizar


XV = [XTrain2{:}];
mu = mean(XV,2);
sg = std(XV,[],2);

XTrain = XTrain2;
XTrain = cellfun(@(x)(x-mu)./sg,XTrain,'UniformOutput',false);

XTest = XTest2;
XTest = cellfun(@(x)(x-mu)./sg,XTest,'UniformOutput',false);

save('valores_stand_s_resh_FE','XTest','XTrain','YTrain','YTest');
