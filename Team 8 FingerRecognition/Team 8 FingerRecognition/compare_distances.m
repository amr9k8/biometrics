function score=compare_distances(d1,d2)
echo off;
 c1 = numel(d1);
 c2 = numel(d2);
 
 
 simillar = 0;
%  intersectionarr =[]
%  x1 = [55,55,55,65,41,13,4,4]
%  x2 = [1,2,55,55,55,4,4]
%  xx1 = numel(x1);
%  xx2 = numel(x2);
 used = [];
 for j=1:c2
     flag = 0;
     for k=1:numel(used)
             if used(k) == d2(j)
                 flag =1;
                 break
             end
     end
     
     if flag ==1 
         continue
     end
         
     lia = ismember(d1,d2(j));% 1 0 0 0 1 1 1 0  ==> 4 occurence
     flag2 = 0; % if item in 2nd array found in first one , add it in used[] 
     for i=1:c1
         if lia(i) == 1 
             simillar =simillar+1; 
             flag2=1;
         end
     end
     if flag2 == 1
          used = [ used ,d2(j)];
     end
     
 end
     
 
 
 [val,pos]=intersect(d1,d2);
 simillar_distances = numel(val); %count common items
 
 
 
 %factor = c2/c1;
 factor = 1.5;
 score = factor * ( (simillar/c2)*100 ) ;
 
end
