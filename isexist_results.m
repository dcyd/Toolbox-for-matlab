clc;clear variables;
define_constants;
[~,~,raw_cities]=xlsread("China_city_sqr60_basic_data.xls");

is_overall_vul = zeros(363,1);
is_cell_imp = zeros(363,1);

for center_type=[0]
bd_path=strcat('E:\research\vulnerability_pattern\code\data\basic_data\');
ri_path=strcat('E:\research\vulnerability_pattern\code\data\s',num2str(center_type),'\raster_data\');
output_path=strcat('E:\research\vulnerability_pattern\code\data\s',num2str(center_type),'\importance_vulnerability\');
results_path='E:\research\vulnerability_pattern\code\analysis\results';

for city_id=1:363

    city_name=cell2mat(raw_cities(city_id,3));
    country_id=cell2mat(raw_cities(city_id,13));

    if exist(strcat(output_path,num2str(city_id),city_name,'\accurate_target_cell_vulnerability_curves.mat'),'file')
        is_overall_vul(city_id) = 1;
    end
    if exist(strcat(output_path,num2str(city_id),city_name,'\sample_road_vulnerability.mat'),'file')
        is_cell_imp(city_id) = 1;
    end
end
end