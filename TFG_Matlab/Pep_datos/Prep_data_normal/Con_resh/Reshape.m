%% reshape de las señales normalizadas

% clear all;
% clc;

% dirección archivo 
%direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/datos_tot_n.mat';

%load
%load(direc);


%% Cells por clase que es lo mismo que las Cs
T_X = C_raw(total_etiquetas=='T');
T_Y = total_etiquetas(total_etiquetas=='T');

Q_X = C_raw(total_etiquetas=='Q');
Q_Y = total_etiquetas(total_etiquetas=='Q');

V_X = C_raw(total_etiquetas=='V');
V_Y = total_etiquetas(total_etiquetas=='V');

M_X = C_raw(total_etiquetas=='M');
M_Y = total_etiquetas(total_etiquetas=='M');

%% split 
% crea dos arrays. uno con el 90% y otro con ell 10%
[trainIndT,~,testIndT] = dividerand(192,0.9,0.0,0.1);
[trainIndQ,~,testIndQ] = dividerand(432,0.9,0.0,0.1);
[trainIndV,~,testIndV] = dividerand(192,0.9,0.0,0.1);
[trainIndM,~,testIndM] = dividerand(192,0.9,0.0,0.1);
%% train

XTrain_T = T_X(trainIndT);
YTrain_T = T_Y(trainIndT);


XTrain_Q = Q_X(trainIndQ);
YTrain_Q = Q_Y(trainIndQ);

XTrain_V = V_X(trainIndV);
YTrain_V = V_Y(trainIndV);

XTrain_M = M_X(trainIndM);
YTrain_M = M_Y(trainIndM);
%% test

XTest_T = T_X(testIndT);
YTest_T = T_Y(testIndT);

XTest_Q = Q_X(testIndQ);
YTest_Q = Q_Y(testIndQ);

XTest_V = V_X(testIndV);
YTest_V = V_Y(testIndV);

XTest_M = M_X(testIndM);
YTest_M = M_Y(testIndM);



%% añadiomos mas señales repetidas train
%Xtrain
X_t_T = repmat(XTrain_T(1:172),2,1);
X_t_Q = repmat(XTrain_Q(1:388),1,1);
X_t_V = repmat(XTrain_V(1:172),2,1);
X_t_M = repmat(XTrain_M(1:172),2,1);
%Ytrain
Y_t_T = repmat(YTrain_T(1:172),2,1);
Y_t_Q = repmat(YTrain_Q(1:388),1,1);
Y_t_V = repmat(YTrain_V(1:172),2,1);
Y_t_M = repmat(YTrain_M(1:172),2,1);

%% añadiomos mas señales repetidas test
%Xtest
X_te_T = repmat(XTest_T(1:19),2,1);
X_te_Q = repmat(XTest_Q(1:43),1,1);
X_te_V = repmat(XTest_V(1:19),2,1);
X_te_M = repmat(XTest_M(1:19),2,1);
%Ytest
Y_te_T = repmat(YTest_T(1:19),2,1);
Y_te_Q = repmat(YTest_Q(1:43),1,1);
Y_te_V = repmat(YTest_V(1:19),2,1);
Y_te_M = repmat(YTest_M(1:19),2,1);
%%
% Constantes
totcell_T=length(T_X);

XTrain = [X_t_T(1:344); X_t_Q(1:344); X_t_V(1:344); X_t_M(1:344)];
YTrain = [Y_t_T(1:344); Y_t_Q(1:344); Y_t_V(1:344); Y_t_M(1:344)];

XTest = [X_te_T(1:38); X_te_Q(1:38); X_te_V(1:38); X_te_M(1:38)];
YTest = [Y_te_T(1:38); Y_te_Q(1:38); Y_te_V(1:38); Y_te_M(1:38)];
%%
% save values

save('valores_resh_fft_raw', 'XTrain', 'YTrain','XTest','YTest');
