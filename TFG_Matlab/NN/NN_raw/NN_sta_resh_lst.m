% clean
clear all;
clc;

% load
directorio='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/Con_resh/valores_reshape_raw.mat';
load(directorio);


%definimos las layers
layers = [ ...
    sequenceInputLayer(1)
    reluLayer
    bilstmLayer(120,'OutputMode','last')
    dropoutLayer(0.7)
    
    tanhLayer
    bilstmLayer(120,'OutputMode','last')
    dropoutLayer(0.7)
    
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer
    ]


options = trainingOptions('adam', ...
    'MaxEpochs',7, ...
    'MiniBatchSize', 100, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 500, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);


net = trainNetwork(XTrain,YTrain,layers,options);
trainPred = classify(net,XTrain,'SequenceLength',1000);
LSTMAccuracy = sum(trainPred == YTrain)/numel(YTrain)*100;

