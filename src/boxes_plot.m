function [H,leg] = boxes_plot(disp_data, interval_box, ty_color, gr_leg, ty_leg)
% boxes_plot(disp_data, interval_box, ty_color, gr_leg, ty_leg): 
% 1.可以将不同长度的各组数据画到同一个boxplot中
% 2.可以画不同组不同类别，同一组画到一起，不同类别用不同颜色着色
%
% for example, copy below code to command window
% exam_data = {{[1 2 3],[1 1 1 1]},{[3 2 1],[4 5 6 8]}}
% boxes_plot(exam_data,0.1,[0.3 0.8 0.3;1 0 1],["1" "2"],["a" "b"])


% check data
num_group = length(disp_data);
num_type = length(disp_data{1});

ymin=inf;
ymax=-inf;
for gdx = 1:num_group
    assert(num_type == length(disp_data{gdx}),'The type numbers are different among groups.')
    for tdx = 1:num_type
        ymin = min(ymin,min(disp_data{gdx}{tdx}));
        ymax = max(ymax,max(disp_data{gdx}{tdx}));
    end
end

% assert(num_type == length(ty_color(:,1)),'The type numbers are different among groups.')

% initialize
interval_gro = 1;
box_width = 1 / (num_group*num_type......
                 +num_group*interval_gro......
                 +num_group*(num_type-1)*interval_box);  % bw*(ng*nt+ng*ig+ng*(nt-1)*ib)=1

gro_width = (interval_gro+num_type+(num_type-1)*interval_box) * box_width;

interval_box = box_width*interval_box;
interval_gro = box_width*interval_gro;

gro_x_min = ([1:num_group]-1)*gro_width;
gro_x = gro_x_min + gro_width/2;
box_x_min = repmat(gro_x_min,num_group,1)......
            +interval_gro/2......
            +[([1:num_type]'-1)*box_width];

% plot boxes
H = figure;
for gdx = 1:num_group
    for tdx = 1:num_type
        boxplot(disp_data{gdx}{tdx},......
        'Widths',box_width,......
        'Positions',box_x_min(tdx,gdx),......
        'OutlierSize',3,'Symbol','.');hold on;
    end
end

if exist('ty_color','var')
    h = findobj(gca,'Tag','Box');
    for gdx = 1:num_group
        for tdx = 1:num_type
            hdx = num_group*num_type+1 - ((gdx-1)*num_type+tdx);
            cdx = tdx;
            patch(get(h(hdx),'XData'),get(h(hdx),'YData'),ty_color(cdx,:),'FaceAlpha',0.1);
        end
    end
    if exist('ty_leg','var')
        h_pa = findobj(gca,'Tag','Patch');
        leg = legend(h_pa, ty_leg);
    else
        leg='';
    end
end

xticks([]);
if exist('gr_leg','var')
    yindex = ymin - (ymax-ymin)*0.1;
    for xdx = 1:num_group
        text('String',gr_leg(xdx),......
            'Position',[gro_x(xdx),yindex],......
            'horizontalAlignment', 'center',......
            'Rotation',0);
    end
end

xlim([0 1]);
ylim([ymin ymax]);

end

