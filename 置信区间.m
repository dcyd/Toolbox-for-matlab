clc;clear;
load('ms_err_time_10000.mat');
data=ms_err_time_10000;
x=1:length(data);
average=mean(data,1);

for t=1:length(data)
    h(t)=lillietest(data(:,t));
    [ave(t),var(t),aveci(t,:),varci(t,:)]=normfit(data(:,t),0.5);
end
figure
aveci1=reshape(aveci(:,1),1,length(aveci(:,1)));
aveci2=reshape(aveci(:,2),1,length(aveci(:,2)));
h1= fill([x,fliplr(x)],[aveci1,fliplr(aveci2)],'r','FaceColor',[1 0.8 0.8],'EdgeColor','none');%FaceColor为填充颜色，EdgeColor为边框颜色
hold on
plot(x,average,'r.-');
axes('position',[0.5,0.5,0.3,0.3]);
x1=1:3;
aveci11=reshape(aveci(1:3,1),1,length(aveci(1:3,1)));
aveci22=reshape(aveci(1:3,2),1,length(aveci(1:3,2)));
h1= fill([x1,fliplr(x1)],[aveci11,fliplr(aveci22)],'r','FaceColor',[1 0.8 0.8],'EdgeColor','none');%FaceColor为填充颜色，EdgeColor为边框颜色
hold on
plot(x1,average(1:3),'r.-');

