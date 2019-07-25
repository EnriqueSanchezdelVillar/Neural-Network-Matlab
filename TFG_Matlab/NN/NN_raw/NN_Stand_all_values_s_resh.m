% clean
clear all;
clc;

% load
directorio='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Stand/valores_stand_s_resh.mat';
load(directorio);


%definimos las layers
layers = [ ...
    sequenceInputLayer(1)
    bilstmLayer(100,'OutputMode','last')
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer
    ]


options = trainingOptions('adam', ...
    'MaxEpochs',5, ...
    'MiniBatchSize', 150, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 500, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);


net = trainNetwork(XTrain_SD,YTrain,layers,options);
trainPred = classify(net,XTrain_SD);
LSTMAccuracy = sum(trainPred == YTrain)/numel(YTrain)*100
