
% se utilizan todos los valores de las señales para estandarizar


XV = [XTrain{:}];
mu = mean(XV,2);
sg = std(XV,[],2);

XTrain_a = XTrain;
XTrain_a = cellfun(@(x)(x-mu)./sg,XTrain_a,'UniformOutput',false);

XTest_a = XTest;
XTest_a = cellfun(@(x)(x-mu)./sg,XTest_a,'UniformOutput',false);

save('valores_stand_auto_res.mat','XTest_a','XTrain_a','YTrain','YTest');