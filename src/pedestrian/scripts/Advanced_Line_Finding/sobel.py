
image = mpimg.imread('signs_vehicles_xygrad.png')
gray = cv2.cvtColor(image, cv2.COLOR_RGB2GRAY

#1
abs_sobel = np.absolute(cv2.Sobel(gray, cv2.CV_64F, 1, 0))    
abs_sobel = np.absolute(cv2.Sobel(gray, cv2.CV_64F, 0, 1))    

scaled_sobel = np.uint8(255*abs_sobel/np.max(abs_sobel))    
binary_output = np.zeros_like(scaled_sobel)    
binary_output[(scaled_sobel >= thresh_min) & (scaled_sobel <= thresh_max)] = 1    

#2	
sobelx = cv2.Sobel(gray, cv2.CV_64F, 1, 0)    
sobely = cv2.Sobel(gray, cv2.CV_64F, 0, 1)    
abs_sobelxy=np.sqrt(sobelx**2 + sobely**2)

#3
direction = np.arctan2(abs_sobely, abs_sobelx)

#4
combined = np.zeros_like(dir_binary) 
combined[((gradx == 1) & (grady == 1)) | ((mag_binary == 1) & (dir_binary == 1))] = 1 

