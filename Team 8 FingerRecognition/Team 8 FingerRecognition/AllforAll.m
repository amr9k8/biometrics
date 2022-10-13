clc;
%clf;
clear;
person =[]
matched ={};
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
thin_image = process_img(filepath,1);
% I = imread(filepath);
% EI = EnhanceFP(I);
% BI=binarization(EI);
% thin_image=bwmorph(BI,'thin','inf');
if i ==3
    [bifurcation_y1 ,bifurcation_x1,ridge_y1,ridge_x1]=Minutiae_extraction3(thin_image);
    TrainDistances1 = DistEuclidian(bifurcation_x1,bifurcation_y1);
elseif  i == 4
    [bifurcation_y2 ,bifurcation_x2,ridge_y2,ridge_x2]=Minutiae_extraction3(thin_image);
    TrainDistances2 = DistEuclidian(bifurcation_x2,bifurcation_y2);
elseif  i == 5
    [bifurcation_y3 ,bifurcation_x3,ridge_y3,ridge_x3]=Minutiae_extraction3(thin_image);
    TrainDistances3 = DistEuclidian(bifurcation_x3,bifurcation_y3);
elseif  i == 6
    [bifurcation_y4 ,bifurcation_x4,ridge_y4,ridge_x4]=Minutiae_extraction3(thin_image);
    TrainDistances4 = DistEuclidian(bifurcation_x4,bifurcation_y4);
    
end
            
end


vec_res =[]
 Testarr={'15.jpg','25.jpg','45.jpg','55.jpg','65.jpg','85.jpg','105.jpg','115.jpg','125.jpg','135.jpg','155.jpg','165.jpg','175.jpg','185.jpg','205.jpg','225.jpg','235.jpg','245.jpg' , '255.jpg','265.jpg','275.jpg','295.jpg','315.jpg','325.jpg','375.jpg','385.jpg','415.jpg' , '425.jpg', '435.jpg', '465.jpg' };
    %%% test all
    ct = numel(Testarr);
    maxx=0;
    matchedphoto=''
    matchedperosn =0;
 for i=1:ct
     name=Testarr{i};
     test_img = strcat('test/',name);
%      I = imread(filepath);
%      EI = EnhanceFP(I);
%      BI=binarization(EI);
%      test_image=bwmorph(BI,'thin','inf');
    test_image = process_img(test_img,1);
     [bifurcation_y7 ,bifurcation_x7,ridge_y7,ridge_x7]=Minutiae_extraction3(test_image);
     TestDistances = DistEuclidian(bifurcation_x7,bifurcation_y7);

    score1 = compare_distances(TrainDistances1,TestDistances);
    score2 = compare_distances(TrainDistances2,TestDistances);
    score3 = compare_distances(TrainDistances3,TestDistances);
    score4 = compare_distances(TrainDistances4,TestDistances);
        if ( isnan(score1) )
            score1=0
        end
        if ( isnan(score2) )
        score2=0
        end
        if ( isnan(score3) )
        score3=0
        end
        if ( isnan(score4) )
        score4=0
    end
    avgscore = (score1 + score2 +score3+score4 )/4;
    vec_res =[vec_res,avgscore];
    if maxx<avgscore
        maxx = avgscore;
        matchedphoto=Testarr{i};
        matchedperosn = i;
    end
     
 end
 person =[person ,matchedperosn];
 
 x = max(vec_res);
 score1 = compare_distances(TrainDistances1,TestDistances);
 score2 = compare_distances(TrainDistances2,TestDistances);
 score3 = compare_distances(TrainDistances3,TestDistances);
 score4 = compare_distances(TrainDistances4,TestDistances);
 avgscore = (score1 + score2 +score3+score4 )/4;


end
identficationrate = 0
mismatch =0;
for i=1:30
    if (person(i) ~= i  )
        mismatch = mismatch+1;
    end
end
identficationrate = 100 - ((mismatch/30 )* 100)
disp(identficationrate);
