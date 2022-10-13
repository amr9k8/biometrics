function [ final ] = preprocessing3( image )
I=double(image)
[w,h]=size(I)
%out=I
w1=floor(w/8)*8
h1=floor(h/8)*8
inner=zeros(w1,h1)
for i=1:8:w1
    for j=1:8:h1
        a=i+7;
        b=j+7;
        F=fft2(I(i:a,j:b));
        factor=abs(F).^0.45;
        block=abs(ifft2(F.*factor));
        res=max(block(:));
        if(res==0)
            res=1;
        end;
        block=block./res;
        inner(i:a,j:b)=block;
    end;
end;
final=inner*255;
final=histeq(uint8(final));
end

