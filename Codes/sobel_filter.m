
function[I3]=sobel_filter(img)


kernel=[1,0,-1;2,0,-2;1,0,-1]; %horizontal sobel
%norm_kernel=kernel/(sum(sum(kernel)));inf

[w,h]=size(img);
I3=zeros(w,h);
 
 for i =2:1:w-1;
    
       for j=2:1:h-1;
        piece=img(i-1:i+1,j-1:j+1);
        I3(i,j)=sum(sum(piece.*kernel));
       end
       
     end


end
