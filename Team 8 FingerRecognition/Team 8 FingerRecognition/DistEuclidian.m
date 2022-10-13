function D=DistEuclidian(x_points,y_points)
echo off;
D=[];
%h = waitbar(0,'Distance Computation');
c = numel(x_points);
counter =2; %strart from second coordinate

for cord1 = 1:c-1 %strart from first coord
   % inate 
    
     for cord2=counter:c
         x1 = x_points(cord1);
         x2 = x_points(cord2);
         y1 = y_points(cord1);
         y2 = y_points(cord2);
        distance =sqrt( (x2-x1)^2 +  (y2-y1)^2 );
        D=[D,distance];          
     end
      counter = counter +1;
end

       
end
%close(h)