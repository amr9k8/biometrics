function [ output_args ] = writefeatures(fid,d1,d2,d3,d4)
%WRITEFEATURES Summary of this function goes here
%   Detailed explanation goes here

% d1 =[1,2,3,4,5]
% d2 =[1,2,3,4,5,1,2,3,4,5]
% d3 =[1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4 ]
% d4 = [1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4,2,3,4,5,1,2,3,4,5,2,3,4,5,1,2,3,4]

%fid = fopen('trained_data.txt','wt');
fprintf(fid,'%d ',d1);
fprintf(fid,'\n');
fprintf(fid,'%d ',d2);
fprintf(fid,'\n');
fprintf(fid,'%d ',d3);
fprintf(fid,'\n');
fprintf(fid,'%d ',d4);
fprintf(fid,'\n');
%fclose(fid);
end
