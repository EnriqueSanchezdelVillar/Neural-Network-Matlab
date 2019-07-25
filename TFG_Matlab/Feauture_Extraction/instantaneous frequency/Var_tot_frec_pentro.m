%clean

clear all;
clc;
fs = 300;

direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/valores_reshape.mat';
load(direc);

%Inst FREC
instfreqTrain = cellfun(@(x)instfreq(x,fs)',XTrain_n,'UniformOutput',false);
instfreqTest = cellfun(@(x)instfreq(x,fs)',XTest_n,'UniformOutput',false);
%%

%Pentro
pentropyTrain = cellfun(@(x)pentropy(x,fs)',XTrain_n,'UniformOutput',false);
pentropyTest = cellfun(@(x)pentropy(x,fs)',XTest_n,'UniformOutput',false);


%Unión

XTrain2 = cellfun(@(x,y)[x;y],instfreqTrain,pentropyTrain,'UniformOutput',false);
XTest2 = cellfun(@(x,y)[x;y],instfreqTest,pentropyTest,'UniformOutput',false);



%Srandardize


XV = [XTrain2{:}];
mu = mean(XV,2);
sg = std(XV,[],2);

XTrain2_s = XTrain2;
XTrain2_s = cellfun(@(x)(x-mu)./sg,XTrain2_s,'UniformOutput',false);

XTest2_s = XTest2;
XTest2_s = cellfun(@(x)(x-mu)./sg,XTest2_s,'UniformOutput',false);



save('instfreq_pentro_resh_n.mat','XTrain2','XTest2','YTest','YTrain');

