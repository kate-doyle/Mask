    
    function fishtracks(A,B)
%call previous function to create fishmask
    fishmask(A)
%plot all tracks on mask
N = length(B.Y)
  for k = 1:N
 Y1 = B.Y{1,k};
 x = Y1(:,1);
 y = Y1(:,2);
 hold on 
 plot(x,y)
 hold off
 title('Image mask with Tracking Data')
  end 
%plot all tracks on original image 
figure;
  imshow(A)
    for k = 1:N
 Y1 = B.Y{1,k};
 x = Y1(:,1);
 y = Y1(:,2);
 hold on 
 plot(x,y)
 hold off
 title('Original image with Tracking Data')
    end 
    end