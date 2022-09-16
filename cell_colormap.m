function cell_colormap(cell_value,raster_data,log_lat_step)
    % plot_Be_con - Description: figure road network with Be and congestion
    % input parameters: node_data,edge_data,edge_str,Be,node_set,edge_set
    % output: the figure
%     R = length(cell_value(:,3));
%     [~,index] = sort(cell_value(:,3),'descend');


    temp_id=raster_data(raster_data(:,6)<3,1);Nr=length(temp_id);raster_id=[(1:Nr)' temp_id];rtag=0;%edge_id,raster_id
    clog_set=uniquetol(raster_data(:,2));
    clat_set=uniquetol(raster_data(:,3));
    ra=zeros(length(clat_set)+1,length(clog_set)+1)*NaN;
    con_raster_XY = [];
    con_ras_tag = 1;
    for y=1:length(clat_set)
        for x=1:length(clog_set)
            rid=raster_data(abs(raster_data(:,2)-clog_set(x))<=10^-5 & abs(raster_data(:,3)-clat_set(y))<=10^-5,1);
            if sum(raster_id(:,2)==rid)==0
                ra(y,x)=NaN;
            else
                ra(y,x)=cell_value(raster_id(raster_id(:,2)==rid,1));
            end
        end
    end
    figure;
    pcolor([clog_set-log_lat_step(1)/2;clog_set(end)+log_lat_step(1)/2],[clat_set-log_lat_step(2)/2;clat_set(end)+log_lat_step(2)/2],ra);hold on;
    shading flat;

    colormap('jet');
    %colorbar
%     plot(con_raster_XY(:,1),con_raster_XY(:,2),'r+','LineStyle','none');hold on;
end