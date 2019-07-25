% clean

clear all;
clc;

%Dirección archivo

direc = '/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/EMD/Stad_emd/valores_std_e_5.mat';
%load

load(direc);


%definimos las layers
layers = [ ...
    sequenceInputLayer(1)
    
    reluLayer
    bilstmLayer(200,'OutputMode','last')
    dropoutLayer(0.5)
    
    tanhLayer
    bilstmLayer(100,'OutputMode','last')
    dropoutLayer(0.5)
    
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer
    ]


options = trainingOptions('adam', ...
    'MaxEpochs',2, ...
    'MiniBatchSize', 100, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 500, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);


net = trainNetwork(XTrain_S_e,YTrain,layers,options);
trainPred = classify(net,XTrain_S_e,'SequenceLength',1000);
LSTMAccuracy = sum(trainPred == YTrain)/numel(YTrain)*100
