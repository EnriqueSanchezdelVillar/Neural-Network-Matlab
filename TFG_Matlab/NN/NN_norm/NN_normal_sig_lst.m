% clean

clear all;
clc;

%Dirección archivo

direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/Con_resh/valores_reshape_raw.mat';

%load

load(direc);


%definimos las layers
layers = [ ...
    % Input
    sequenceInputLayer(1)
    
    % Hidden
    bilstmLayer(120,'OutputMode','last')
    reluLayer
    lstmLayer(120,'OutputMode','last')
    
    
    % Output
     fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer
    ]


options = trainingOptions('adam', ...
    'MaxEpochs',4, ...
    'MiniBatchSize', 100, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 500, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);


net = trainNetwork(XTrain,YTrain,layers,options);
trainPred = classify(net,XTrain,'SequenceLength',1000);
LSTMAccuracy = sum(trainPred == YTrain)/numel(YTrain)*100