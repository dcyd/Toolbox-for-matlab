function Gini=Gini_coef(NumArr)

NumArrSorted=sort([0,NumArr]);

NumArrPercent=NumArrSorted/sum(NumArrSorted);

NumArrSortedLen=length(NumArrSorted);

NumArrAcc=zeros(1,NumArrSortedLen);

for i=1:NumArrSortedLen

    NumArrAcc(i)=sum(NumArrPercent(1:i));

end

x1=linspace(0,1,NumArrSortedLen);

x2=0:(1/NumArrSortedLen/10):1;

cfithandle=fit(x1',NumArrAcc','smoothingspline');

d=cfithandle(x2);

% 生产图形

figure

plot(x1,x1,'b-.',x1,NumArrAcc,'*',x2,d,'-')

% plot([0,1],[0,1],x1,y,['-'])

title('洛伦兹曲线')

xlabel('节点百分比累计')

ylabel('寻路难度百分比累计')

axis equal

axis([0,1,0,1])

grid on

%计算基尼系数

area1=trapz(x2,d);

area2=trapz(x1,x1);

Gini=roundn(1-area1/area2,-4);

