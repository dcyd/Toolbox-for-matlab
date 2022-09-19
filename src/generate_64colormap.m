function colormap64 = generate_64colormap(init_cm)
    if length(init_cm)<64
        colormap64 = zeros(64, 3);
        inter = ceil(64/(length(init_cm)-1));
        for ci = 1:63
            N = mod(ci, inter)+1;
            init_ci = floor(ci/inter)+1;
            colormap64(ci,:) = color_gradient(init_cm(init_ci, :),init_cm(init_ci+1,:),inter,N);
        end
        colormap64(64,:) = init_cm(length(init_cm),:);
    else
        colormap64 = init_cm;
    end
end

function color_N = color_gradient(init_1,init_2,step,N)
    color_N = zeros(1,3);
    for ci = 1:3
        color_N(ci) = init_1(ci) + (init_2(ci) - init_1(ci))*N/step;
    end
end