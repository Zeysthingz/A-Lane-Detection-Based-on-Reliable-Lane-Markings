
clear all;close;clc;

img=imread('lane1.png');
figure;imshow(img);title('Original Image');hold on ;

%Converting grayscale
img2 = img(:,:,1)*0.299+img(:,:,2)*0.587+img(:,:,3)*0.114; % Red channel %Gray channel ,%Blue channel
norm_img=rescale(img2); %squize image 0-1
figure;imshow(norm_img);title('Grayscale Image');hold on ;
% % ROI
rectangle('Position',[150 103 350 350],...  
 'LineWidth',2,'EdgeColor','red')


%Convert grayscale image itself to binary
[w1,h1]=size(norm_img)
I_zeros= zeros(w1,h1);
I_binary=binarization(norm_img,I_zeros);
imshow(I_binary);title('Binary Grayscale Image');hold on ; 
hold on;
%binary ROI 
rectangle('Position',[150 103 350 350],...
'LineWidth',2,'EdgeColor','red')

% %Cropping ROI
 %binaryG_crop = imcrop(I_binary,[150 103 350 350]);
% figure;imshow(binaryG_crop);title('Cropped Binary Grayscale');hold on ; 

% Applying Sobel Filter
I_sobel=sobel_filter(norm_img);
figure;imshow(I_sobel);title('Sobel Filter Image');hold on ;

%rectangle('Position',[200,173,300,300],...
rectangle('Position',[150 103 350 350],...
'LineWidth',2,'EdgeColor','red')

% Convert sobel filter applied image to binary image
 I_bins=binarization(I_sobel,I_zeros);
 figure;imshow(I_bins);title('Binary Sobel Image');hold on ; 
 
rectangle('Position',[150 103 350 350],...
'LineWidth',2,'EdgeColor','red')


% %Cropping Roý 
%binaryS_crop = imcrop(I_binary,[150 103 350 350]);
% figure;imshow(binaryS_crop);title('Cropped Binary Sobel Image');hold on ;

%Applying neighbourhood and operation for strengts common features 
and_op_img=neigbourhood_AND(I_binary ,I_bins);
%res2=sum(sum(and_op_img))
figure;imshow(and_op_img);title('AND Operated Image');hold on ;
rectangle('Position',[150 103 350 350],...
'LineWidth',2,'EdgeColor','red')


%imwrite(and_op_img, 'And_3.jpg');

%Aplying bir eye viev


function [I3]=binarization(img,I)
[w1,h1]=size(img);
for i =1:1:w1;
    for j=1:1:h1;
        if img(i,j)>0.6
            I3(i,j)=1;  %binarization funcion 
        else
            I3(i,j)=0;
        end
    end
end
end



            