function Eimg = EnhanceFP(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m0=100;
v0=10000;
img=rgb2gray(img);
[L,W] =size(img);
Eimg=(zeros(L,W));
img =im2double(img);
m=mean2(img);
v=std2(img).^2; %main ,variance
for length=1:L
    for width=1:W
        z=((img(length,width)-m).^2);
        x=((z-m).^2);
        y=sqrt(x*v0/v);
     
         if (img(length,width)>m)
             Eimg(length,width)=m0 + y;
             
         else
             Eimg(length,width)=m0 - y;
         end
     end    
end

end