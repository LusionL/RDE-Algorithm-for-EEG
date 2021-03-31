%path = importdata("F:\RDE\data_330\name.txt");
%data = importdata("F:\RDE\data_330\20121031113934.txt");

name = importdata("F:\RDE\data_330\name.txt");
%data = importdata([num2str(path(1)),'.txt']);
%name是存放绝对路径字符串的数组 path是绝对路径
l = length(name);
for m = 1:l
    path = num2str(name(m));
    Y_origin = importdata([path,'.txt']);
    xx_origin = Y_origin(2000+1:2000+30,:)';  
    traindata = xx_origin;
    realdata = Y_origin(2000+1:2000+35,:)'; %5-step real data value
    filename = path(length(path)-2:length(path));
    dlmwrite(['traindata',filename,'.txt'],traindata,'delimiter','\t','newline','pc');
    dlmwrite(['realdata',filename,'.txt'],realdata,'delimiter','\t','newline','pc');
    D = size(traindata,1); %D = 24
    s = 2000;% the number of non-delay embedding
    L = 6; % the value of L is calculated by FNN-cao
    pre_value = zeros(D,5);
    for k = (1:5) % 10-step prediction using 30-length original data
    
        Y = textread(['traindata',filename,'.txt']); %Y is a 24 Dimension EEG signal
        disp(['The process has finished ' num2str(k) ' /5 ''.'])
        traindata = Y(1:end,:);  
        trainlength = size(traindata,2);
        one_step_value = zeros(D,1);


        for j = 1:D
        prediction = zeros(1,s);
        indexr = zeros(s,D);
        score = zeros(1,s);
        % making predictions with RDE using KDE schema;

            for i=1:s

                indexr(i,:)=randperm(D);
                predictions(i)=myprediction_gp(traindata(indexr(i,1:L),1:trainlength-1),traindata(j,2:trainlength),traindata(indexr(i,1:L),trainlength));% other kinds of fitting method could be used here
            end
            pp=outlieromit(predictions);% exclude the outliers
            [F,XI]=ksdensity(pp,linspace(min(pp),max(pp),10000));% use kernal density estimation to approximate the probability distribution
            prediction=sum(XI.*F/sum(F)); % use expectation as the final one-step predicted value 
            ystd=std(pp);
            pre_value(j,k) = prediction;
            one_step_value(j,1)=prediction;
        end
    
        traindata(:,end+1)=one_step_value;
        dlmwrite(['traindata',filename,'.txt'],traindata,'delimiter','\t','newline','pc');


        dlmwrite(['prevalue',filename,'.txt'],pre_value,'delimiter','\t','newline','pc');
    end
end
