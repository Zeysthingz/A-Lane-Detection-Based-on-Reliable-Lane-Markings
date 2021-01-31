
function[And_img]=neigbourhood_AND(G,S)
k=ones(5,5);
[wk hk]=size(k);
w =floor(wk/2);
[wc,hc]=size(G);

img_1=zeros(wc,hc);
img_2=zeros(wc,hc);

Img_1=zeros(wc,hc);
Img_2=zeros(wc,hc);
for i=4:1:wc-wk
    for j=4:1:hc-hk
        
        img_1=G(i-w:i+w,j-w:j+w);
        img_2=S(i-w:i+w,j-w:j+w);
        
        Img_1(i,j)= sum(sum(img_1.*k));
        Img_2(i,j)=sum(sum(img_2.*k));
        
        if Img_1(i,j).*Img_2(i,j)==0
            
            And_img(i,j)=0;
        else
            And_img(i,j)=1;
        end   
       
        
        
    end
end
end



