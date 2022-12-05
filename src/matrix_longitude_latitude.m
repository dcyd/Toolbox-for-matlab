function distance=matrix_longitude_latitude(longitude1,latitude1,longitude2_list,latitude2_list)
longitude1=longitude1*3.14/180;
latitude1=latitude1*3.14/180;
longitude2_list=longitude2_list*3.14/180;
latitude2_list=latitude2_list*3.14/180;

temp=sqrt((sin((latitude1-latitude2_list)/2)).^2+cos(latitude1).*cos(latitude2_list).*(sin((longitude1-longitude2_list)/2)).^2);
distance=2*asin(temp)*6378.137;

