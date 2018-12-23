import cv2
import numpy as np

def tulu_detection(image):
    
    image = cv2.resize(image, (image.shape[1]/2, image.shape[0]/2))
    cv2.imshow('axis_image', image)
    
    
    ### Histogram equalization
    hist,bins = np.histogram(image.flatten(),256,[0,256])

    cdf = hist.cumsum()
    cdf_normalized = cdf * hist.max()/ cdf.max()

    cdf_m = np.ma.masked_equal(cdf,0)
    cdf_m = (cdf_m - cdf_m.min())*255/(cdf_m.max()-cdf_m.min())

    cdf = np.ma.filled(cdf_m,0).astype('uint8')

    #image = cdf[image]
    #cv2.imshow('axis_image_histogram', image)
    
    
    ### BGR2HSV
    hsv=cv2.cvtColor(image,cv2.COLOR_BGR2HSV)

    ##set green color
    lower_green=np.array([15,0,0])
    upper_green=np.array([255,255,255])
    mask_green=cv2.inRange(hsv,lower_green,upper_green)
    T, mask_green = cv2.threshold(mask_green, 0, 255, cv2.THRESH_BINARY_INV)
    #res=cv2.bitwise_and(image,image,mask=mask)
    
    
    ### keep the bottom half
    imshape = image.shape
    mask = np.zeros_like(mask_green)
    ignore_mask_color = 255
    vertices = np.array([[(0,imshape[0]),(0,imshape[0]/2+30), (imshape[1],imshape[0]/2+30 ), (imshape[1],imshape[0])]],dtype=np.int32)
    cv2.fillPoly(mask, vertices, ignore_mask_color)

    masked_down = cv2.bitwise_and(mask_green, mask)
    
    
    ### open and close operation
    #ret, binary = cv2.threshold(masked_down, 0, 255, cv.THRESH_BINARY | cv.THRESH_OTSU)
    kernel_open = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
    kernel_close = cv2.getStructuringElement(cv2.MORPH_RECT, (19, 19))
    #masked_down = cv2.morphologyEx(masked_down, cv2.MORPH_OPEN, kernel_open)
    masked_down = cv2.morphologyEx(masked_down, cv2.MORPH_CLOSE, kernel_close)
    
    
    ### extra operation
    #kernel = np.ones((70, 70), np.uint8)
    #binary = cv2.dilate(binary, kernel)
    #binary = cv2.medianBlur(binary,3)
   
    return masked_down
    #cv2.imshow("open", masked_down)
    
    #cv2.imshow('mask',masked_down)
    ##cv2.imshow('res',res)

def tulu_detection_OSTN(image):

    image = cv2.resize(image, (image.shape[1]/2, image.shape[0]/2))
    cv2.imshow('axis_image', image)
    
    imshape = image.shape
    image = image[imshape[0]/2+50:imshape[0], 0:imshape[1]]
    
  
    ### Histogram equalization
    hist,bins = np.histogram(image.flatten(),256,[0,256])
    

    cdf = hist.cumsum()
    cdf_normalized = cdf * hist.max()/ cdf.max()

    cdf_m = np.ma.masked_equal(cdf,0)
    cdf_m = (cdf_m - cdf_m.min())*255/(cdf_m.max()-cdf_m.min())

    cdf = np.ma.filled(cdf_m,0).astype('uint8')

    image = cdf[image]
    cv2.imshow('axis_image_histogram', image)
    
    image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    ret, image_gray = cv2.threshold(image, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
    
    kernel_open = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
    kernel_close = cv2.getStructuringElement(cv2.MORPH_RECT, (9, 9))
    #image_gray = cv2.morphologyEx(image_gray, cv2.MORPH_OPEN, kernel_open)
    #image_gray = cv2.morphologyEx(image_gray, cv2.MORPH_CLOSE, kernel_close)
    cv2.imshow("OSTN", image_gray)

    

