function [bifurcation_y ,bifurcation_x,ridge_y,ridge_x] = Minutiae_extraction3( thin_image )
echo off;
 %%% Minutiae extraction
s=size(thin_image);
N=3;%window size
n=1;
r=s(1)+2;
c=s(2)+2;
double padded_window_3x3rix(r,c);   
padded_window_3x3rix=zeros(r,c);bifurcation=zeros(r,c);ridge=zeros(r,c);
%copy old window_3x3rix to new padded window_3x3rix
padded_window_3x3rix((2):(end-1),(2):(end-1))=thin_image(:,:); 

for x=12:(s(1)-12)
    for y=(12):(s(2)-12)
        
        e=1;
        for k=x-n:x+n
            f=1;
            for l=y-n:y+n

                window_3x3(e,f)=padded_window_3x3rix(k,l); 
                f=f+1;
        %%% from big img to 3x3 window window_3x3rix
%                 window_3x3(1,1) = img[1,1]
%                 window_3x3(1,2) = img[1,2]
%                 window_3x3(1,3) = img[1,3]
%                 window_3x3(2,1) = img[2,1]
%                 window_3x3(2,2) = img[2,2]
%                 window_3x3(2,3) = img[2,3]
%                 window_3x3(3,1) = img[3,1]
%                 window_3x3(3,2) = img[3,2]
%                 window_3x3(3,3) = img[3,3]
            end
            e=e+1;
        end;
        
            if(window_3x3(2,2)==0)
             xx = sum(~window_3x3); % sum of each row using not
             yy=  sum(xx); %sum of 3 the values 
            ridge(x,y)=yy;
            bifurcation(x,y)=yy;
         end
         
    end;
end;

 %%%RIDGE END FINDING
[ridge_x ridge_y]=find(ridge==2);


 %%%BIFURCATION FINDING
[bifurcation_x bifurcation_y]=find(bifurcation==4);



len1=length(ridge_x);
len2=length(bifurcation_x);

% 
% 
%  %%For Display
% outImg=zeros(r,c,3);
% outImg(:,:,1) = padded_window_3x3rix .* 255;
% outImg(:,:,2) = padded_window_3x3rix .* 255;
% outImg(:,:,3) = padded_window_3x3rix .* 255;
% 
% 
% 
% 
%  %%For Display
% for i=1:len1
%     outImg((ridge_x(i)-3):(ridge_x(i)+3),(ridge_y(i)-3),2:3)=0;
%     outImg((ridge_x(i)-3):(ridge_x(i)+3),(ridge_y(i)+3),2:3)=0;
%     outImg((ridge_x(i)-3),(ridge_y(i)-3):(ridge_y(i)+3),2:3)=0;
%     outImg((ridge_x(i)+3),(ridge_y(i)-3):(ridge_y(i)+3),2:3)=0;
%     
%     outImg((ridge_x(i)-3):(ridge_x(i)+3),(ridge_y(i)-3),1)=255;
%     outImg((ridge_x(i)-3):(ridge_x(i)+3),(ridge_y(i)+3),1)=255;
%     outImg((ridge_x(i)-3),(ridge_y(i)-3):(ridge_y(i)+3),1)=255;
%     outImg((ridge_x(i)+3),(ridge_y(i)-3):(ridge_y(i)+3),1)=255;
% end
% 
% 
%  %% For Display
% for i=1:len2
%     outImg((bifurcation_x(i)-3):(bifurcation_x(i)+3),(bifurcation_y(i)-3),1:2)=0;
%     outImg((bifurcation_x(i)-3):(bifurcation_x(i)+3),(bifurcation_y(i)+3),1:2)=0;
%     outImg((bifurcation_x(i)-3),(bifurcation_y(i)-3):(bifurcation_y(i)+3),1:2)=0;
%     outImg((bifurcation_x(i)+3),(bifurcation_y(i)-3):(bifurcation_y(i)+3),1:2)=0;
%     
%     outImg((bifurcation_x(i)-3):(bifurcation_x(i)+3),(bifurcation_y(i)-3),3)=255;
%     outImg((bifurcation_x(i)-3):(bifurcation_x(i)+3),(bifurcation_y(i)+3),3)=255;
%     outImg((bifurcation_x(i)-3),(bifurcation_y(i)-3):(bifurcation_y(i)+3),3)=255;
%     outImg((bifurcation_x(i)+3),(bifurcation_y(i)-3):(bifurcation_y(i)+3),3)=255;
% end
% figure;imshow(outImg);title('Minutiae');
% 



end

