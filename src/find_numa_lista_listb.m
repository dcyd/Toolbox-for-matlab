function [idx, numb] = find_numa_lista_listb(numa,lista,listb)
    % [idx, numb] = find_numa_lista_listb(numa,lista,listb)
    % find the closest value to numa in lista, return the idx and the
    % corresponding number in listb
    % example: numa = 2.9, lista = [1, 2, 3], listb = [4, 5, 6]
    % return: idx = 3; numb = 6;
    
    [~, idxs] = sort(abs(lista - numa),'ascend');
    idx = idxs(1);
    numb = listb(idxs(1));
end