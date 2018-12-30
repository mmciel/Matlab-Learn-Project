
robot = java.awt.Robot(); 
rectangle = java.awt.Rectangle(); 
%scnsize = get(0,'MonitorPosition');   
%ImageWidth = scnsize(3)     
%ImageHeight = scnsize(4)
%because size too big ,jvm error:java.lang.OutOfMemoryError: Java heap space

rectangle.x = 1; 
rectangle.y = 1; 
rectangle.width = 1000; 
rectangle.height = 800; 

image = robot.createScreenCapture(rectangle); 
w = image.getWidth(); 
h = image.getHeight(); 
raster = image.getData(); 
I = zeros(w*h*3,1); 
I = raster.getPixels(0,0,w,h,I); 
I = uint8(I); 
I1 = I(1:3:length(I)); 
I1 = reshape(I1,w,h); 
I2 = I(2:3:length(I)); 
I2 = reshape(I2,w,h); 
I3 = I(3:3:length(I)); 
I3 = reshape(I3,w,h); 
I = uint8(zeros(w,h,3)); 
I(1:w,1:h,1) = I1; 
I(1:w,1:h,2) = I2; 
I(1:w,1:h,3) = I3; 
I = imrotate(I,-90,'nearest'); 
I = flipdim(I,2); 
figure;
imshow(I); 