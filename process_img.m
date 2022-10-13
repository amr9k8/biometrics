function thin_img=process_img(img_name,varargin)
echo off;
I = imread(img_name);
% 
% figure;
% imshow(I)
% title('original image');   


% check if optional param sent then use faster filter for AllforAll.m
if numel(varargin) > 0
x = EnhanceFP(I);
end

% check if  No  optional param sent
if numel(varargin) == 0
x = preprocessing3(I);
end
% figure;
% imshow(x)
% title('enhansed  image');
% 

b=binarization(x);


figure;
imshow(b)
title('binarized  image');

thin_img=bwmorph(b,'thin','inf');
% 
% figure;
% imshow(thin_img)
% title('thinned  image');

%thin_img = hello(I); % first method of preprocessing


end