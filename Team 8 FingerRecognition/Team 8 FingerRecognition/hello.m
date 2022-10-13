function im = hello(x)
I = x;
I=EnhanceFP(I);




%figure;imshow(I);title('enhancement');
I = mat2gray(I);
%I = imtophat(I,strel('disk',15));
I = imbinarize(I);
I=bwmorph(I,'thin','inf');
im=I;
%imshow(I);

end