data = importdata("F:\DFA\DFA_DATA\RDE所用数据\癫痫\结果\minus.txt");
data_1=outlieromit(data(1,:));
data_2=outlieromit(data(2,:));
data_3=outlieromit(data(3,:));
data_4=outlieromit(data(4,:));
data_5=outlieromit(data(5,:));
data_sick = importdata("F:\DFA\DFA_DATA\RDE所用数据\正常\minus719.txt");
data_11=outlieromit(data_sick(1,:));
data_22=outlieromit(data_sick(2,:));
data_33=outlieromit(data_sick(3,:));
data_44=outlieromit(data_sick(4,:));
data_55=outlieromit(data_sick(5,:));

rng('default')  % For reproducibility

x = [data_1'; data_11'; data_2';data_22'; data_3';data_33'; data_4';data_44'; data_5';data_55'];
g1 = repmat({'2'},117,1);
g2 = repmat({'4'},114,1);
g3 = repmat({'6'},109,1);
g4 = repmat({'8'},105,1);
g5 = repmat({'10'},107,1);

g6 = repmat({'1'},19,1);
g7 = repmat({'3'},19,1);
g8 = repmat({'5'},19,1);
g9 = repmat({'7'},20,1);
g10 = repmat({'9'},20,1);
%g = [g1;g2;g3;g4;g5;g6;g7;g8;g9;g10];
%g = [g1; g6;g2;g7 g3;g8; g4;g9; g5;g10];
g = [g1;g3;g5;g7;g9;g2;g4;g6;g8;g10];
boxplot(x,g)
