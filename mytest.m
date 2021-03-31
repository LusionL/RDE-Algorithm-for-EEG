% clear all;
% % Data generation
% Y=mylorenz();% coupled lorenz system
% noisestrength=0; %noise strength
% X=Y+noisestrength*rand(size(Y));% noise could be added
% xx=X(2000+1:end,:)';% after transient dynamics
%   
% trainlength=30; % length of training data (observed data)
% j = 1;
% traindata=xx(:,1:trainlength);
% traininputs = traindata(indexr(1,1:L);
% trainoutputs = traindata(j,2:trainlength);
% gprMdl = fitrgp(traininputs',trainoutputs','Basis',@mypowerseries,'Beta',zeros(l,1),'FitMethod','exact','PredictMethod','exact');
t = mypower(1,10);
t
size(t)