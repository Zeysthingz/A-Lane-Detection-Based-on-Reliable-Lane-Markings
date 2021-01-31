clc;clear all; close all;


I=imread('Binary BEV1.jpg'); %Uýnt olarak kaydettýgý ýcýn býnary ye cevýrmem gerektý tekrardan 
level=graythresh(I);         
BW = imbinarize(I,level);  %finding histogram
BW=double(BW);
figure;imshow(BW);title('BEV  Image');hold on ;
I2=imread('RGB BEV1.jpg');

my_lane=load('my_lane.mat');
my_lane=my_lane.my_lane;

cordinateR=load('cordinateR.mat');
%cordinateL=load('cordinateL.mat');
[w ,h ]=size(BW);




% if strcmp(my_lane,left)
cordinateR=max(cordinateR.cordinateR); %kordýnat datamý alýcam 
%     
% else
%     cordinateL=cordinateL.cordinateL;
% end

%Last square error Lse ile lane ýn uzerýnden gececek polýnomu cýzdýrýyorum.



piksel_val=0;

for j=1:1:h/2
    for i=1:1:w
        if BW(i,j)==1
            piksel_val=piksel_val+1; %left region relýable regýon burdaký 1 olan pýksellerý buluyorum
        end                          %polynomal matrýslerým o boyutta olucak cunku 
    end
end
       
A_matris=zeros(piksel_val,3);
j_matris=zeros(piksel_val,1);
x_matris=zeros(3,1);
value=1;

for i=1:1:w
    for j=1:1:h/2
        if BW(i,j)==1
            A_matris(value,1)=i*i;
            A_matris(value,2)=i;  %rowlar ýle doduruyorum
            A_matris(value,3)=1;
            
            j_matris(value,1)=j; %column ýle dolduruyorum
            value=value+1
        end
        
        
    end
end

val2=inv(A_matris' * A_matris);   %lse maatrislerýmý olusturdum
x_matris=val2*A_matris'*j_matris;  



%lane fýt etmek ýcýn polýnom katsayýlarýný olusturuyorum.
lane=zeros(w,h);
k=1;

for i =1:1:w
    
    point=(i^2*x_matris(1)+1*x_matris(2)+x_matris(3)); %Lane olan yerýn row u
    point=round(point);
    
    if k ==1
        d=point-cordinateR ; %yansýma ýle aradaký mesafeyý buluyorum 
    end
       k=k+1
    lane(i,point-6:point+6)=1;  %yukarýdan asaagýya dogru lane doldurmus oluyorum 
    lane(i,point-d:point-d+10)=1;%yansaýtma noktasý
    
    I2(i,point-6:point+6) = 1;
    I2(i,point-d:point-d+10) = 1;  %rgb yansýtma
end

figure;
subplot(1,2,1);imshow(lane); title('Detectec Binary Image');
subplot(1,2,2);imshow(I2); title('Detectec RGB Image');



