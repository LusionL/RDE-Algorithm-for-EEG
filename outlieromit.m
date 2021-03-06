function pp=outlieromit(predictions)
y=quantile(predictions,[0.25 0.5 0.75]);
IQR=y(3)-y(1);
lbound=y(1)-1.5*IQR; %low bound
ubound=y(3)+1.5*IQR; %upper bound

pp=predictions(predictions>lbound&predictions<ubound);