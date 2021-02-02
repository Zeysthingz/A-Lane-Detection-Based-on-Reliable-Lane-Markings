# A-Lane-Detection-Based-on-Reliable-Lane-Markings
This project proposes effective lane detection aproach for parallel lanes
First two binary images are obtained from region of interest of gray-scale images. The obtained binary images are merged by a novel neigborhood AND operator and then 
transformed to bird's eye viev via inverse perspective mapping. Then gaussian probablity density functions fit to left and right histogram image
acuired from bird's eye view. Then a polynomal lane model is estimated from the identified regions
You can see the article using for this project.

# Results   

![image](https://user-images.githubusercontent.com/55089534/106598947-7abb5180-6569-11eb-8d6c-41a168d2f2fa.png)


