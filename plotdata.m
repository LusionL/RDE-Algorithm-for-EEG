Y_origin = xlsread('E:\EEG_Data\20121031083429.txt'); %Y is a 24 Dimension EEG signal
xx_origin = Y_origin(2000+1:end,:)';  
Y = textread('E:\RDE\code\traindata.txt'); %Y is a 24 Dimension EEG signal
xx = Y(1,1:end);  
j = 1;
trainlength = 30;
% plot the result
figure
plot(xx_origin(j,1:trainlength+10),'-*');% real data
hold on;
plot([31:40],xx(31:40),'ro','MarkerSize',8); %predicted data