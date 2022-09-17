clc;clear variables;

% input_path=strcat('E:\research\vulnerability_pattern\code\data\sqr60_china\basic_data0\');
% output_path=strcat('E:\research\vulnerability_pattern\code\data\sqr60_china\basic_data\');
% 
% [~,~,raw_cities]=xlsread('E:\research\vulnerability_pattern\code\data\sqr60_china\relation_sqr60.xls');
% 
% for city_i=1:size(raw_cities,1)
%     init_id=cell2mat(raw_cities(city_i,3));
%     init_name=cell2mat(raw_cities(city_i,4));
%     cur_id=cell2mat(raw_cities(city_i,1));
%     cur_name=cell2mat(raw_cities(city_i,2));
%     
%     if ~exist(strcat(output_path,num2str(cur_id),cur_name),'file')
%         mkdir(strcat(output_path,num2str(cur_id),cur_name));
%     end
%     
%     copyfile([strcat(input_path,num2str(init_id),init_name),'\log_lat_step.mat'],strcat(output_path,num2str(cur_id),cur_name));
%     copyfile([strcat(input_path,num2str(init_id),init_name),'\sqr60_edge_data.mat'],strcat(output_path,num2str(cur_id),cur_name));
%     copyfile([strcat(input_path,num2str(init_id),init_name),'\sqr60_edge_str.mat'],strcat(output_path,num2str(cur_id),cur_name));
%     copyfile([strcat(input_path,num2str(init_id),init_name),'\sqr60_node_data.mat'],strcat(output_path,num2str(cur_id),cur_name));
%     
% end

input_path=strcat('E:\research\vulnerability_pattern\data_code\raw_data_matlab\data\s0\importance_vulnerability\');
output_path=strcat('G:\network_efficiency\sqr60_result\');

% [~,~,raw_cities]=xlsread('E:\research\vulnerability_pattern\code\data\sqr60_china\relation_sqr60.xls');
[~,~,raw_cities]=xlsread('E:\research\vulnerability_pattern\data_code\raw_data_matlab\urban_road_network_vulnerability\China_city_sqr60_basic_data.xls');
for city_i=1:363
%     init_id=cell2mat(raw_cities(city_i,3));
%     init_name=cell2mat(raw_cities(city_i,4));
%     cur_id=cell2mat(raw_cities(city_i,1));
%     cur_name=cell2mat(raw_cities(city_i,2));
    init_id=cell2mat(raw_cities(city_i,1));
    init_name=cell2mat(raw_cities(city_i,3));


    if ~exist(strcat(output_path,num2str(init_id),init_name),'file')
        mkdir(strcat(output_path,num2str(init_id),init_name));
    end
    
    copyfile([strcat(input_path,num2str(init_id),init_name),'\accurate_pre_fun.mat'],strcat(output_path,num2str(init_id),init_name));
    
end



