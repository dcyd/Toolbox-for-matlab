function [H, yy, xx]=plot_cdf(x,color_buff,marker_buff,marker_xind)
    marker_ind = zeros(1,length(marker_xind));
    for xi =1:length(marker_xind)
        marker_ind(xi) = sum(x<=marker_xind(xi));
    end

    [yy,xx,~,~,~] = cdfcalc(x);
    % Create vectors for plotting

    H = plot(xx, yy(2:end),'LineStyle','-','Color',color_buff,'Marker',marker_buff,'MarkerFaceColor','none','MarkerSize',4,'MarkerIndices',marker_ind);
end