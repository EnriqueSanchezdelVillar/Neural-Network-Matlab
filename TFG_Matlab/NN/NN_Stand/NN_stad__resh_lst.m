% clean
clear all;
clc;

% load
directorio='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Stand/valores_stand_all_resh.mat';
load(directorio);


%definimos las layers
layers = [ ...
    sequenceInputLayer(1)
    lstmLayer(100,'OutputMode','last')
    dropoutLayer(0.5)
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer
    ]


options = trainingOptions('adam', ...
    'MaxEpochs',7, ...
    'MiniBatchSize', 50, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 100, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);


net = trainNetwork(XTrain_SD,YTrain,layers,options);
trainPred = classify(net,XTrain_SD,'SequenceLength',1000);
LSTMAccuracy = sum(trainPred == YTrain)/numel(YTrain)*100;

