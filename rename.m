clc;clear variables;
define_constants;

file_path='D:\students\duchongyang\data\s4\raster_data\';
[~,~,raw_cities]=xlsread('China_city_basic_data.xlsx');

for city_id=1:363
    
    city_id

    city_name=cell2mat(raw_cities(city_id,CN));clog=cell2mat(raw_cities(city_id,CX));clat=cell2mat(raw_cities(city_id,CY));%city name  
    files=dir(strcat(file_path,num2str(city_id),city_name,'\')); %读取所有文件
    
    for i=1:length(files) %遍历所有文件、
        if ~files(i).isdir
            oldname=files(i).name;     %原先的文件名
            if contains(oldname, 'area')
                newname='sqr60_rs1_area_raster_info.mat';
            elseif contains(oldname, 'net')
                newname='sqr60_rs1_net_raster_info.mat';
            else
                continue;
            end
            
            if ~strcmp(oldname, newname)
                 %将新文件转化为 修改-0X 的文件名
                cd(files(i).folder)
%                 dos(['cd', 32 files(i).folder]);
                command = ['rename',32 oldname,32 newname];   %启用dos命令修改
                status = dos(command);
                if status == 0
                    disp([oldname, ' 已被重命名为 ', newname])
                else
                    disp([oldname, ' 重命名失败!'])
                end            
            end
        end
    end
end


