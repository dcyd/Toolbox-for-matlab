function ynum = estimate_linear_inter(xnum,xlist,ylist)
% given xnum, estimate the corresponding ynum based on xlist and ylist,
% linear inter methods

    [idx, ~] = find_numa_lista_listb(xnum,xlist,ylist);
    x0=xlist(idx);y0=ylist(idx);
    if xnum>x0
        x1=xlist(idx+1);y1=ylist(idx+1);
    else
        x1=xlist(idx-1);y1=ylist(idx-1);
    end
    ynum = y1-(x1-xnum)*(y1-y0)/(x1-x0);
end

