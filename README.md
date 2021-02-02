# A-Lane-Detection-Based-on-Reliable-Lane-Markings
This project proposes effective lane detection aproach for parallel lanes
First two binary images are obtained from region of interest of gray-scale images. The obtained binary images are merged by a novel neigborhood AND operator and then 
transformed to bird's eye viev via inverse perspective mapping. Then gaussian probablity density functions fit to left and right histogram image
acuired from bird's eye view. Then a polynomal lane model is estimated from the identified regions
You can see the article using for this project.

# Results   
<p float="left">
 
![image](https://user-images.githubusercontent.com/55089534/106598947-7abb5180-6569-11eb-8d6c-41a168d2f2fa.png) ![image](https://user-images.githubusercontent.com/55089534/106599462-2664a180-656a-11eb-80f0-b47ee96e982d.png)   

 ### Original Image 

![image](https://user-images.githubusercontent.com/55089534/106599462-2664a180-656a-11eb-80f0-b47ee96e982d.png)
 ### Grayscale ROI Selected Image
 </p>
                        
 ![image](https://user-images.githubusercontent.com/55089534/106599812-a5f27080-656a-11eb-91cd-58d617e3b883.png)
 ### Binary Image

![image](https://user-images.githubusercontent.com/55089534/106600363-5ceeec00-656b-11eb-8d74-fabf4ad7150f.png)
### Sobel Filter Applied Image 

![image](https://user-images.githubusercontent.com/55089534/106600605-b35c2a80-656b-11eb-9187-20c55c7dd7a2.png)
### Converting to Binary Image 
