function [ output_args ] = train_dataset( input_args )
%TRAIN_DATASET Summary of this function goes here
%   Detailed explanation goes here

fid = fopen('trained_data.txt','wt');
for p=1:30
TrainDistances1 = []
TrainDistances2 = []
TrainDistances3 = []
TrainDistances4 = []
personNum = num2str(p)
%personNum = '2';
folder = strcat('train/',personNum);
object = dir (folder);
for i =3:6
img_train= object(i).name
filepath = strcat(folder,'/',img_train);
thin_image = process_img(filepath);
if      i ==3
    [bifurcation_y1 ,bifurcation_x1,ridge_y1,ridge_x1]=Minutiae_extraction3(thin_image);
    TrainDistances1 = DistEuclidian(bifurcation_x1,bifurcation_y1);
%     if (numel(TrainDistances1) ==0 )
%         TrainDistances1=[TrainDistances1,1];
%     end
elseif  i == 4
    [bifurcation_y2 ,bifurcation_x2,ridge_y2,ridge_x2]=Minutiae_extraction3(thin_image);
    TrainDistances2 = DistEuclidian(bifurcation_x2,bifurcation_y2);
%     if (numel(TrainDistances2) ==0 )
%         TrainDistances2=[TrainDistances2,1];
%     end
elseif  i == 5
    [bifurcation_y3 ,bifurcation_x3,ridge_y3,ridge_x3]=Minutiae_extraction3(thin_image);
    TrainDistances3 = DistEuclidian(bifurcation_x3,bifurcation_y3);
%     if (numel(TrainDistances3) ==0 )
%         TrainDistances3=[TrainDistances3,1];
%     end
elseif  i == 6
    [bifurcation_y4 ,bifurcation_x4,ridge_y4,ridge_x4]=Minutiae_extraction3(thin_image);
    TrainDistances4 = DistEuclidian(bifurcation_x4,bifurcation_y4);
%     if (numel(TrainDistances4) ==0 )
%         TrainDistances4=[TrainDistances4,1];
%     end
%     
end
     



end
writefeatures(fid,TrainDistances1,TrainDistances2,TrainDistances3,TrainDistances4);



end
fclose(fid);
