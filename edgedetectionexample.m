% reading image 
iFish = 1;
 A = imread(['bf p' num2str(iFish),'.png']);
 imshow(A)
 %convert image to gray scale 
 A2d = rgb2gray(A);
 %use edge function to obtain threshold value of image 
 [~,threshold] = edge(A2d,'canny');
 fudgeFactor = 0.5
 %use edge to obtain mask with tuned threshold
 BWs = edge(A2d,'canny',threshold*fudgeFactor);
 imshow(BWs)
 % fill gaps by dilating sobel image
 %two perpendicular linear structing elements
 se90 = strel('line',3,90);
 se0 = strel('line',3,0);
 BWsdil = imdilate(BWs,[se90 se0]);
imshow(BWsdil)
title('Dilated Gradient Mask')
 % fill interior gaps
BWdfill = imfill(BWsdil,'holes');
imshow(BWdfill)
title('Binary Image with Filled Holes')

BWnobord = imclearborder(BWdfill,4);
BWmidd = BWdfill - BWnobord;
imshow(BWmidd)
%getting rid of small objects with under 7000 pixels
BW2 = bwareaopen(BWmidd, 7000);

seD = strel('diamond',1);
BWfinal = imerode(BW2,seD);
BWfinal = imerode(BWfinal,seD);
imshow(BWfinal)
title('Segmented Image');