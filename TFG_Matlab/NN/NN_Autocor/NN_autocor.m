% clean

% clear all;
% clc;

%Direcci�n archivo

%direc = 
%load

%load(direc);


%definimos las layers
layers = [ ...
    sequenceInputLayer(1)
    
     
    bilstmLayer(10,'OutputMode','last')
%     reluLayer
%     bilstmLayer(160,'OutputMode','last')

    bilstmLayer(10,'OutputMode','last')
    
    dropoutLayer(0.5)
    
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


net = trainNetwork(XTrain,YTrain,layers,options);
trainPred = classify(net,XTrain,'SequenceLength',1000);
LSTMAccuracy1 = sum(trainPred == YTrain)/numel(YTrain)*100

testPred2 = classify(net,XTest);

LSTMAccuracy2 = sum(testPred2 == YTest)/numel(YTest)*100

