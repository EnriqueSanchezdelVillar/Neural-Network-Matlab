% clean
clear all;
clc;

% load
directorio='/Volumes/TOSHIBA/Se�ales suizos tercero, cuarto, quinto y sexto escenario/Datos/Feature_Extrac/pentro_stnd_resh.mat';
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
    'MaxEpochs',40, ...
    'MiniBatchSize', 150, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 500, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);


net2 = trainNetwork(XTrain2_s,YTrain,layers,options);
trainPred = classify(net2,XTrain2_s,'SequenceLength',1000);
LSTMAccuracy = sum(trainPred == YTrain)/numel(YTrain)*100;


