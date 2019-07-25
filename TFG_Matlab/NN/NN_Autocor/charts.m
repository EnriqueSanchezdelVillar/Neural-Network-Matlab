

% trainPred = classify(net,XTrain,'SequenceLength',1000);
% LSTMAccuracy = sum(trainPred == YTrain)/numel(YTrain)*100
% 
% testPred2 = classify(net,XTest);
% 
% LSTMAccuracy2 = sum(testPred2 == YTest)/numel(YTest)*100




figure
ccLSTM = confusionchart(YTest,testPred2);
ccLSTM.Title = 'Confusion Chart for Classification';
% ccLSTM.ColumnSummary = 'column-normalized';
% ccLSTM.RowSummary = 'row-normalized';