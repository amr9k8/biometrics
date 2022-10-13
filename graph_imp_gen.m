function [] = graph_imp_gen( input_args )
%GRAPH_IMP_GEN Summary of this function goes here
%   Detailed explanation goes here


%%%       Get trainMatrix,testMatrix 

trainMatrix=dlmread('trained_data.txt');
testMatrix=dlmread('test_data.txt');

%%%       Get Distance 
[r1,c1] = size(testMatrix);
[r2,c2] = size(testMatrix);
smalltrainMatrix = trainMatrix(1:r2,1:c2)
dist_matrix = zeros(r2,c2)
for i = 1:r2
    for j = 1:c2
    dist_matrix(i,j) = sqrt(sum((smalltrainMatrix(:,j) - testMatrix(:,i)) .^ 2));
    end
end

%%%       Get imp and genuin

counter = 1;
gen_bool = 0;
imp_bool = 0;
gen_vec = [];
imp_vec = [];
diag_count_bool = 0
 for r = 1:r2
       
        spoint1 = ((counter*5)-5)+1; 
        spoint2 = spoint1;
        Epoint1 = counter*5;
        Epoint2 = Epoint1
        x = r-1;
        if( x+1 ~= 1 && mod(x,5) == 0 )
            diag_count_bool = 1
        end
        
        for c = 1:c2
            if(c >= spoint2 && c <= Epoint2 &&  r >= spoint1 && r <= Epoint1 )
               gen_bool = 1;
            else
                imp_bool = 1;
            end 
            if (gen_bool == 1)
                gen_vec = [gen_vec,dist_matrix(r,c)];
                gen_bool = 0;
            end
            if (imp_bool == 1)
                imp_vec = [imp_vec,dist_matrix(r,c)];
                imp_bool = 0;
            end
            
            
        end
        
       if( diag_count_bool )
            counter = counter + 1;
            diag_count_bool=0
        end
end


   
    %%%       Plot Data 
    
    
maxdiff = max(  max(gen_vec), max(imp_vec) ) - min(min(gen_vec), min(imp_vec))
normalizedGen = (gen_vec- ( min( min(gen_vec), min(imp_vec) )))/(maxdiff);
normalizedImp = (imp_vec-(min(min(gen_vec), min(imp_vec)) ) )/(maxdiff);
hold on
hg1=  histogram(normalizedGen,'Normalization','pdf')
hg2 =  histogram(normalizedImp,'Normalization','pdf')
ylabel('Normalized Frequencies');
xlabel('Matching Scores');
legend('Genuine','Imposter')
end

