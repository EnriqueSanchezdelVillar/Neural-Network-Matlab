% clean

%clear all;
clc;

%Dirección archivo

%direc = '/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/EMD/EMD_values_train.mat';
%load

%load(direc);


%definimos las layers
layers = [ ...
    sequenceInputLayer(1)
    
   
    bilstmLayer(100,'OutputMode','last')
    dropoutLayer(0.9)
    
    bilstmLayer(120,'OutputMode','last')
    dropoutLayer(0.9)
    
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer
    ]


options = trainingOptions('adam', ...
    'MaxEpochs',8, ...
    'MiniBatchSize', 100, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 500, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);


net = trainNetwork(XTrain_e,YTrain,layers,options);
trainPred = classify(net,XTrain_e,'SequenceLength',1000);
LSTMAccuracy = sum(trainPred == YTrain)/numel(YTrain)*100
