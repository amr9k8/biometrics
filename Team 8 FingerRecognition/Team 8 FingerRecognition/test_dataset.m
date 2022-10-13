function [ output_args ] = test_dataset( input_args )
%TEST_DATASET Summary of this function goes here
%   Detailed explanation goes here

TrainDistances1 = []
TrainDistances2 = []
TrainDistances3 = []
TrainDistances4 = []
fid = fopen('test_data.txt','wt');
Testarr={'15.jpg','25.jpg','45.jpg','55.jpg','65.jpg','85.jpg','105.jpg','115.jpg','125.jpg','135.jpg','155.jpg','165.jpg','175.jpg','185.jpg','205.jpg','225.jpg','235.jpg','245.jpg' , '255.jpg','265.jpg','275.jpg','295.jpg','315.jpg','325.jpg','375.jpg','385.jpg','415.jpg' , '425.jpg', '435.jpg', '465.jpg' };
for i =1:30
img_train= strcat('test/',Testarr{i});
thin_image = process_img(img_train);
[bifurcation_y1 ,bifurcation_x1,ridge_y1,ridge_x1]=Minutiae_extraction3(thin_image);
 testdist = DistEuclidian(bifurcation_x1,bifurcation_y1);
 fprintf(fid,'%d ',testdist);
 fprintf(fid,'\n');
   

end

fclose(fid);
end





