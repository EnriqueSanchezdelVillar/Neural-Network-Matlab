% clean
clear all;
clc;

% dirección archivo 
direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/Con_resh/valores_reshape_raw.mat';
%load
load(direc);

% autocorrelación
XTrain = cellfun(@(x)xcorr(x,300),XTrain,'UniformOutput',false);
XTest = cellfun(@(x)xcorr(x,300),XTest,'UniformOutput',false);

% positivos
%XTrain_a = cellfun(@(x)x(151:end),toal_autocor_n,'UniformOutput',false);
%XTest_a = cellfun(@(x)x(151:end),toal_autocor_n2,'UniformOutput',false);




%%
save('t_auto.mat','XTrain','YTrain','XTest','YTest');
