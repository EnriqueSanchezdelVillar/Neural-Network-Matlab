% clean
clear all;
clc;

% load
directorio1='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos3_n.mat';
load(directorio1,'C3_n');

directorio2='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos4_n.mat';
load(directorio2,'C4_n');

directorio3='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos5_n.mat';
load(directorio3,'C5_n');

directorio4='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos6_n.mat';
load(directorio4,'C6_n');

% Autocorrelaciones

%Autocor_C3_n1 = cellfun(@(x)xcorr(x,150),C3_n1,'UniformOutput',false);
%Autocor_C3_n2 = cellfun(@(x)xcorr(x,150),C3_n2,'UniformOutput',false);
%Autocor_C3_n3 = cellfun(@(x)xcorr(x,150),C3_n3,'UniformOutput',false);
%Autocor_C3_n4 = cellfun(@(x)xcorr(x,150),C3_n4,'UniformOutput',false);

%Autocor_C4_n1 = cellfun(@(x)xcorr(x,150),C4_n,'UniformOutput',false);
%Autocor_C4_n2 = cellfun(@(x)xcorr(x,150),C4_n,'UniformOutput',false);
%Autocor_C4_n3 = cellfun(@(x)xcorr(x,150),C4_n,'UniformOutput',false);
%Autocor_C4_n4 = cellfun(@(x)xcorr(x,150),C4_n,'UniformOutput',false);
%Autocor_C4_n5 = cellfun(@(x)xcorr(x,150),C4_n,'UniformOutput',false);
%Autocor_C4_n6 = cellfun(@(x)xcorr(x,150),C4_n,'UniformOutput',false);
%Autocor_C4_n7 = cellfun(@(x)xcorr(x,150),C4_n,'UniformOutput',false);
%Autocor_C4_n8 = cellfun(@(x)xcorr(x,150),C4_n,'UniformOutput',false);
%Autocor_C4_n9 = cellfun(@(x)xcorr(x,150),C4_n,'UniformOutput',false);





%Autocor_C5_n1 = cellfun(@(x)xcorr(x,150),C5_n,'UniformOutput',false);
%Autocor_C5_n2 = cellfun(@(x)xcorr(x,150),C5_n,'UniformOutput',false);
%Autocor_C5_n3 = cellfun(@(x)xcorr(x,150),C5_n,'UniformOutput',false);
%Autocor_C5_n4 = cellfun(@(x)xcorr(x,150),C5_n,'UniformOutput',false);

%Autocor_C6_n1 = cellfun(@(x)xcorr(x,150),C6_n,'UniformOutput',false);
%Autocor_C6_n2 = cellfun(@(x)xcorr(x,150),C6_n,'UniformOutput',false);
%Autocor_C6_n3 = cellfun(@(x)xcorr(x,150),C6_n,'UniformOutput',false);
%Autocor_C6_n4 = cellfun(@(x)xcorr(x,150),C6_n,'UniformOutput',false);

% XTrain_a = cellfun(@(x)xcorr(x,150),XTrain,'UniformOutput',false);
% XTest_a = cellfun(@(x)xcorr(x,150),XTest,'UniformOutput',false);
% 
% Solo la parte positiva

%C3_n_atc= cellfun(@(x)x(151:end),Autocor_C3_n,'UniformOutput',false);

%C4_n_atc= cellfun(@(x)x(151:end),Autocor_C4_n,'UniformOutput',false);

%C5_n_atc= cellfun(@(x)x(151:end),Autocor_C5_n,'UniformOutput',false);

%C6_n_atc= cellfun(@(x)x(151:end),Autocor_C6_n,'UniformOutput',false);

% total_autocor_n = cellfun(@(x)x(151:end),toal_autocor_n,'UniformOutput',false);

% Guardar cambios

% save('values_autocorr.mat','C3_n_atc','C4_n_atc','C5_n_atc','C6_n_atc','etiquetas3','etiquetas4','etiquetas5','etiquetas6');

%save('XTrain_Test_autocorr_rsh.mat','XTrain_a', 'XTest_a','YTest','YTrain');

