% collect the wonderful colormap
function colormap_set = color_list()
    colormap_set = struct;
    % from 10.1038/s41467-017-02374-7, fig. 3j
    rgb5 = [133 6   33
            234 136 107
            245 246 248
            111 175 211
            13  62  121]/255;
%     r_64 = linspace(rgb5(1,1), rgb5(5,1), 64);
%     rgb64 = [r_64' interp1(rgb5(:,1), rgb5(:,2), r_64)' interp1(rgb5(:,1), rgb5(:,3), r_64)'];
    colormap_set.lee_color_1 = generate_64colormap(rgb5);


end

function colormap64 = generate_64colormap(init_cm)
    r_64 = linspace(init_cm(1,1), init_cm(length(init_cm(:,1)),1), 64);
    colormap64 = [r_64' interp1(init_cm(:,1), init_cm(:,2), r_64,"linear")' interp1(init_cm(:,1), init_cm(:,3), r_64,"linear")'];
end

