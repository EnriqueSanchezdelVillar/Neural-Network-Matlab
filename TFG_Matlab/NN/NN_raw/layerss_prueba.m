% clean

clear all;
clc;

%Dirección archivo

directorio='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/n_resh.mat';
load(directorio);


%definimos las layers
layers = [ ...
    sequenceInputLayer(1)
    tanhLayer
    lstmLayer(100,'OutputMode','last')
    dropoutLayer(0.7)
    
    fullyConnectedLayer(4)
    
    softmaxLayer
    classificationLayer
    ]


options = trainingOptions('adam', ...
    'MaxEpochs',1, ...
    'MiniBatchSize', 27, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 500, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);


net = trainNetwork(XTrain,YTrain,layers,options);
trainPred = classify(net,XTrain,'SequenceLength',1000);
LSTMAccuracy = sum(trainPred == YTrain)/numel(YTrain)*100