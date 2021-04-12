data = importdata("F:\DFA\DFA_DATA\RDE所用数据\正常\minus719.txt");
data_1=outlieromit(data(1,:));
data_2=outlieromit(data(2,:));
data_3=outlieromit(data(3,:));
data_4=outlieromit(data(4,:));
data_5=outlieromit(data(5,:));
rng('default')  % For reproducibility

x = [data_1'; data_2'; data_3'; data_4'; data_5'];
g1 = repmat({'1'},19,1);
g2 = repmat({'2'},19,1);
g3 = repmat({'3'},19,1);
g4 = repmat({'4'},20,1);
g5 = repmat({'5'},20,1);

g = [g1; g2; g3; g4; g5];
boxplot(x,g)
