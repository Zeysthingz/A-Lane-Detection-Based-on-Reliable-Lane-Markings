
clear all;close;clc;

I=imread('Binary BEV1.jpg'); %Uýnt olarak kaydettýgý ýcýn býnary ye cevýrmem gerektý tekrardan

%I2=imread('RGB Bev.jpg');

level=graythresh(I);         
BW = imbinarize(I,level);  %finding histogram
hist=zeys_hist(BW);
%hist_rgb=zeys_hist(I2);
%imwrite(hist,'histogram.jpg');
figure;plot(hist); xlabel('Column indexes');ylabel('Number of Pixels');hold on;
%figure;plot(hist_rgb); xlabel('Column indexes');ylabel('Number of Pixels');hold on;

[w h]=size(I);
BW=double(BW);
Left_BW=hist(:,1:125);
Left_BW2=Left_BW(:);
[values]=mle(Left_BW2);  %finding mean and std value for Left area
meanL=floor(values(1));
stdL=floor(values(2));


Right_BW=hist(:,125:250);
Right_BW2=Right_BW(:);
[values2]=mle(Right_BW2);

meanR=floor(values2(1));
stdR=floor(values2(2)) ;


%%DETERMÝNE REGÝONS 

PL=max(max(hist(1:125)));  %Y values en buyuk degerý buluyorum
PR=max(max(hist(125:250)));
t=5;

if (t*PL-stdL) >(t*PR-stdR) %regýon ssartý
    
    my_lane='left';
    [cordinateR]=find(hist(125:250)==PR); %yansýma yapacagýn yerýn koordýnatý
    cordinateR=cordinateR+125;
    save('cordinateR','cordinateR');
else
    my_lane='right';
    [cordinateL]=find(hist(1:125)==PL);
    save('cordinateL','cordinateL');
end
 
 save('my_lane','my_lane');




function [hist] = zeys_hist(image)
[~,h] = size(image);
hist = zeros(1,h);
for i=1:1:h
    hist(i) = sum(image(:,i));
    
end
end




