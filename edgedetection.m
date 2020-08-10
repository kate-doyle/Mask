
iFish = 3;
 A = imread(['bf p' num2str(iFish),'.png']);
%convert image to gray scale 
 A2d = rgb2gray(A);
imshow(A2d)
%convert to double array 
I = im2double(A2d);
 
bw = imbinarize(A2d);
imshow(bw)

Kmedian = medfilt2(bw);
figure
imshowpair(bw,Kmedian,'montage')

bm = bwconvhull(Kmedian,'objects');
bm1 = bwconvhull(bm,'objects');
bm2 = bwconvhull(bm1,'objects');
bm3 = bwconvhull(bm2,'objects');
bm4 = bwconvhull(bm3,'objects');
bm5 = bwconvhull(bm4,'objects');
bm6 = bwconvhull(bm5,'objects');

imshow(bm6)


