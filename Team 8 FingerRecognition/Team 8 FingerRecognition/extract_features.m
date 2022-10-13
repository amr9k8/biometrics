function [ birfy,birfx ,endingy, endingx ] = extract_features( padded_img )
echo off;
birfx  =  []; 
birfy  =  []; 
endingx  =  []; 
endingy  =  []; 
nighbors = [];
score = 0;
%[row,col]=size(padded_img);
[row,col]=size(padded_img);
%padded_img = zeros(row+2,col+2);
%padded_img = padarray(padded_imgg,[1 1])

for  i = 30:1 : row-30     %skip added rows from padding 
    for j= 30:1: col-30     %skip added cols from padding 
        
         e=1;
         score = 0;
        for k=i-1:i+1
            f=1;
            for l=j-1:j+1
                mat(e,f)=padded_img(k,l);
                f=f+1;
            end
            e=e+1;
        end;
        
        if ( mat(2,2) == 1 )
            score = nnz(mat); % count nonzero elemments
            if ( score == 2) %ridge ending 
                endingy = [endingy,i];
                endingx = [endingx,j];
             end

        if ( score == 4) %ridge burfication
            birfy = [birfy,i];
            birfx = [birfx,j];
        end

            
        end
 
    end
end

 

temp=zeros(row+2,col+2)
temp((2):(end-1),(2):(end-1))=padded_img(:,:);

len1=length(endingx);
len2=length(birfx);


%For Display
outImg=zeros(row+2,col+2,3);
outImg(:,:,1) = temp .* 255;
outImg(:,:,2) = temp .* 255;
outImg(:,:,3) = temp .* 255;




%For Display
for i=1:len1
    outImg((endingx(i)-3):(endingx(i)+3),(endingy(i)-3),2:3)=0;
    outImg((endingx(i)-3):(endingx(i)+3),(endingy(i)+3),2:3)=0;
    outImg((endingx(i)-3),(endingy(i)-3):(endingy(i)+3),2:3)=0;
    outImg((endingx(i)+3),(endingy(i)-3):(endingy(i)+3),2:3)=0;
    
    outImg((endingx(i)-3):(endingx(i)+3),(endingy(i)-3),1)=255;
    outImg((endingx(i)-3):(endingx(i)+3),(endingy(i)+3),1)=255;
    outImg((endingx(i)-3),(endingy(i)-3):(endingy(i)+3),1)=255;
    outImg((endingx(i)+3),(endingy(i)-3):(endingy(i)+3),1)=255;
end


%For Display
for i=1:len2
    outImg((birfx(i)-3):(birfx(i)+3),(birfy(i)-3),1:2)=0;
    outImg((birfx(i)-3):(birfx(i)+3),(birfy(i)+3),1:2)=0;
    outImg((birfx(i)-3),(birfy(i)-3):(birfy(i)+3),1:2)=0;
    outImg((birfx(i)+3),(birfy(i)-3):(birfy(i)+3),1:2)=0;
    
    outImg((birfx(i)-3):(birfx(i)+3),(birfy(i)-3),3)=255;
    outImg((birfx(i)-3):(birfx(i)+3),(birfy(i)+3),3)=255;
    outImg((birfx(i)-3),(birfy(i)-3):(birfy(i)+3),3)=255;
    outImg((birfx(i)+3),(birfy(i)-3):(birfy(i)+3),3)=255;
end
figure;imshow(outImg);title('Minutiae');



end













% padded_img((2):(end-1),(2):(end-1))=thin_img(:,:); %padding with zeros 
% 
% for  i = 2 : row-1
%     for j= 2: col-1
%         val = thin_img(i-1,j-1) ;
%         
%         padded_img(i,j) = val;
%  
%     end
% end