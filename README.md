# A-Lane-Detection-Based-on-Reliable-Lane-Markings
This project proposes effective lane detection aproach for parallel lanes
First two binary images are obtained from region of interest of gray-scale images. The obtained binary images are merged by a novel neigborhood AND operator and then 
transformed to bird's eye viev via inverse perspective mapping. Then gaussian probablity density functions fit to left and right histogram image
acuired from bird's eye view. Then a polynomal lane model is estimated from the identified regions. I used RGB images which is taken from the CalTech database.
In this project, the methods in the following article have been implemented. 

You can view the article.
https://ieeexplore.ieee.org/document/8404486



## Results   

![image](https://user-images.githubusercontent.com/55089534/106601838-30d46a80-656d-11eb-923a-1bafb9a4ea45.png)

### Histogram of Lane Regions Piksel Density for First Image 

![image](https://user-images.githubusercontent.com/55089534/106602125-9f192d00-656d-11eb-887b-354654bef052.png)

### Input of First Test Image / Output of First Test Image 


![image](https://user-images.githubusercontent.com/55089534/106602474-1ea6fc00-656e-11eb-8477-801e74c4cd9c.png)

### Input of Second Test Image / Output of Second  Test Image 


![image](https://user-images.githubusercontent.com/55089534/106602633-557d1200-656e-11eb-87f5-aee45d112d7f.png)

### Input of Third Test Image / Output of Third  Test Image 
