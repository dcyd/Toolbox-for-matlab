function [H,nz_y,nz_x] = plot_pdf(x,inver_num,show_figure,color_buff,marker_buff,is_log)
% plot probability distribution function

    
    if is_log
        log_min_size=log10(min(x(x>0)));
        log_max_size=log10(max(x));
        number_of_bins=ceil((log_max_size-log_min_size)*inver_num);
        bins=10.^(log_min_size:(log_max_size-log_min_size)/number_of_bins:log_max_size);
        bin_length=bins(2:end)-bins(1:end-1);
        prob=zeros(length(bins)-1,1);
        x_bins=bins(2:end);%+bin_length/2;
    else
        min_size=min(x);
        max_size=max(x);
        number_of_bins=ceil((max_size-min_size)*inver_num);
        bins=(min_size:(max_size-min_size)/number_of_bins:max_size);
        bin_length=bins(2:end)-bins(1:end-1);
        prob=zeros(length(bins)-1,1);
%         x_bins=bins(2:end)-bin_length/2;
        x_bins=bins(1:end-1);

    end

    for n=1:length(x)
        index=find(x(n)<=bins,1);
        if index==1
            index=index+1;
        end
        prob(index-1)=prob(index-1)+1;
    end
    %     bc_prob=prob./bin_length'/length(data);
    % figure;
    if is_log==1
        bc_prob=prob./bin_length'/length(x);
        if show_figure==1
            Non_zero_tag = find(bc_prob>0);
            H=loglog(x_bins(Non_zero_tag),bc_prob(Non_zero_tag),'LineStyle','none','Color',color_buff,'Marker',marker_buff,'MarkerFaceColor','none','MarkerSize',2); hold on;
        else
            H=0;
        end
    elseif is_log == 0
        bc_prob=prob./length(x);
        if show_figure==1
            H=plot(x_bins,bc_prob,'LineStyle','-','Color',color_buff,'Marker',marker_buff,'MarkerFaceColor','none','MarkerSize',4); hold on;
        else
            H=0;
        end
    end

    if is_log
        nz_x=reshape(x_bins(Non_zero_tag),length(Non_zero_tag),1);nz_y=bc_prob(Non_zero_tag);
    else
        nz_x=reshape(x_bins,length(x_bins),1);nz_y=bc_prob;
    end
end

