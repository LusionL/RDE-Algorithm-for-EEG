realdata = importdata('F:\RDE\code\Rossler_five_step_pre\realdata_0412.txt')';
predata = importdata('F:\RDE\code\Rossler_five_step_pre\traindata_0412.txt')';
for i = (1:24)
    figure
    plot(realdata(:,i),'-*','LineWidth',2);
    hold on
    plot([31:35],predata(31:35,i),'ro','MarkerSize',8);
end

minus=zeros(5,24);
for i = (1:24)
    for j = (1:5)
        minus(j,i)=predata(30+j,i)-realdata(30+j,i);
    end
end
%dlmwrite('E:\RDE\code\1023\minus.txt',minus,'delimiter','\t','newline','pc');
%minus(:,20)=[];
%h=heatmap(minus,'FontSize',10, 'FontName','Times New Roman');
%colormap(jet)
dlmwrite('F:\RDE\code\Rossler_five_step_pre\minus.txt',minus,'delimiter','\t','newline','pc');