load('data/A4024S117502resize.mat','data');
% load('data/A4024S117502.mat','data');
N = length(data(1,:));

% 画栅格着色图，pcolor统一着色
% the figure
ra=zeros(N+1,N+1)*nan;
for y=1:N
    for x=1:N
        ra(x,y) = data(N-x+1,y);
    end
end
figure;
pcolor(ra);hold on;
shading flat;
colormap(parula);
colorbar
axis square
axis off

% % 画栅格着色图，每个栅格分别着色，用fill着色
% % the figure
% figure;
% color_value=[parula(64) linspace(min(min(data)),max(max(data)),64)' linspace(0,1,64)'];
% % color_value=[cool(64) linspace(-1,1,64)' linspace(0,1,64)'];
% for y = 1:N
%     for x=1:N
%         temp_cv=sortrows([color_value(:,1:3) abs(color_value(:,4)-data(y,x))],4);
%         cellX=[x-1/2 x+1/2 x+1/2 x-1/2 x-1/2];
%         cellY=[11-(y-1/2) 11-(y-1/2) 11-(y+1/2) 11-(y+1/2) 11-(y-1/2)];
%         fill(cellX,cellY,temp_cv(1,1:3),'EdgeColor',temp_cv(1,1:3));hold on;
%     end
% end
% colormap(parula);
% colorbar('ticks',color_value(1:20:64,5),'ticklabels',round(color_value(1:20:64,4),1))
% 
% axis equal
% axis off

