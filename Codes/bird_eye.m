
 img1=imread('And_1.jpg'); %binary ýmgemý aldým
 img2=imread('lane1.png'); 
 
 result=BEV(img1);
 %imwrite(result, 'Binary BEV3.jpg'); %bev görüntüsünü kaydettim.
 result2=BEV(img2);
 %imwrite(result2,'RGB BEV3.jpg');
 figure;
 subplot(1,2,1);imshow(result); title('Binay Bev Image');
 subplot(1,2,2);imshow(result2); title('Rgb Bev Image');
 

function[result]=BEV(img1)

focalLength = [309.4362 344.2161]; %odak noktasý 
principalPoint = [318.9034 257.5352];% [fx, fy] in pixel units
imageSize = [473 626];% [cx, cy] optical center in pixel coordinates BEV ÇIKTISI
camIntrinsics = cameraIntrinsics(focalLength,principalPoint,imageSize);
height = 2.1798; %height of camera
pitch = 14;
sensor = monoCamera(camIntrinsics,height,'Pitch',pitch);
distAhead =25;  %ne kadarlýk alaný BEV edecek
spaceToOneSide =5; %geniþlik
bottomOffset = 8;

outView = [bottomOffset,distAhead,-spaceToOneSide,spaceToOneSide];

outsize = [500,250];

birdsEye = birdsEyeView(sensor,outView,outsize);

result = transformImage(birdsEye,img1);
% 
% imagePoint = vehicleToImage(birdsEye,[20 0]);
% annotatedBEV = insertMarker(Bird_eye_viev,imagePoint);
% annotatedBEV = insertText(annotatedBEV,imagePoint + 30,'20 meters');

end





