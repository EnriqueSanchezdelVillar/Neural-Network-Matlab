% clean
%clear all;
%clc;

% dirección archivo 
%direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/datos_tot_n.mat';

%load
%load(direc);

%% split
[trainIndT,~,testIndT] = dividerand(192,0.9,0.0,0.1);
[trainIndQ,~,testIndQ] = dividerand(192,0.9,0.0,0.1);
[trainIndV,~,testIndV] = dividerand(192,0.9,0.0,0.1);
[trainIndM,~,testIndM] = dividerand(192,0.9,0.0,0.1);

%% train

XTrain_T = C3_raw(trainIndT);
YTrain_T = etiquetas3(trainIndT);


XTrain_Q = C4_raw(trainIndQ);
YTrain_Q = etiquetas4(trainIndQ);

XTrain_V = C5_raw(trainIndV);
YTrain_V = etiquetas5(trainIndV);

XTrain_M = C6_raw(trainIndM);
YTrain_M = etiquetas6(trainIndM);
%% test

XTest_T = C3_raw(testIndT);
YTest_T = etiquetas3(testIndT);

XTest_Q = C4_raw(testIndQ);
YTest_Q = etiquetas4(testIndQ);

XTest_V = C5_raw(testIndV);
YTest_V = etiquetas5(testIndV);

XTest_M = C6_raw(testIndM);
YTest_M = etiquetas6(testIndM);

%% join

% train

XTrain=[XTrain_T; XTrain_Q; XTrain_V; XTrain_M];
YTrain=[YTrain_T; YTrain_Q; YTrain_V; YTrain_M];

%test 

XTest=[XTest_T; XTest_Q; XTest_V; XTest_M];
YTest=[YTest_T; YTest_Q; YTest_V; YTest_M];
%%
save('test_train_fft_raw_76.mat','XTrain','YTrain','XTest','YTest');
