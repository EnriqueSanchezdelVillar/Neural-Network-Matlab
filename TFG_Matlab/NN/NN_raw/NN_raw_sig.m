% clean
clear all;
%clc;

% load

load('/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/test_train_raw_s_resh.mat');


%definimos las layers
layers = [ ...
    %input
    
    sequenceInputLayer(1)
    
    %hidden
    bilstmLayer(100,'OutputMode','last')
    
    % Output
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer
    ]


options = trainingOptions('adam', ...
    'MaxEpochs',2, ...
    'MiniBatchSize', 150, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 500, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);


net = trainNetwork(XTrain,YTrain,layers,options);



trainPred = classify(net,XTrain,'SequenceLength',1000);
LSTMAccuracy1 = sum(trainPred == YTrain)/numel(YTrain)*100

testPred2 = classify(net,XTest);

LSTMAccuracy2 = sum(testPred2 == YTest)/numel(YTest)*100


