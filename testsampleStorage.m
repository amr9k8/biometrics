function [ matchedperosn,res,matching_score ] = testsampleStorage( sample_test )
%TESTSAMPLESTORAGE Summary of this function goes here
%   Detailed explanation goes here
 matrix =  read_features();
 matching_score=[]
 
 
    %%% test 

    test_img = strcat('test/',sample_test);
    test_image = process_img(test_img);
    [bifurcation_y7 ,bifurcation_x7,ridge_y7,ridge_x7]=Minutiae_extraction3(test_image);
     TestDistances = DistEuclidian(bifurcation_x7,bifurcation_y7);
     matchedperosn =0;
     
 for i=1:4:117
    %%% get features of 4 img from  each person
 TrainDistances1=reshape(nonzeros(matrix(i,:)),1,nnz( matrix(i,:))  ) ;%get row from matrix contain zeros , then remove zeros using nonzeros() but it need reshape cuz it convert into column , so reshape using 1x5 , nnz used to find total non zero items
 TrainDistances2 = reshape(nonzeros(matrix(i+1,:)),1,nnz( matrix(i+1,:))  );
 TrainDistances3 = reshape(nonzeros(matrix(i+2,:)),1,nnz( matrix(i+2,:))  );
 TrainDistances4 = reshape(nonzeros(matrix(i+3,:)),1,nnz( matrix(i+3,:))  );
 

    score1 = compare_distances(TrainDistances1,TestDistances);
    score2 = compare_distances(TrainDistances2,TestDistances);
    score3 = compare_distances(TrainDistances3,TestDistances);
    score4 = compare_distances(TrainDistances4,TestDistances);
    avgscore = (score1 + score2 +score3+score4 )/4;
    matching_score =[matching_score,avgscore];
 
 
 
 end
[res,matchedperosn]=max(matching_score);
end

