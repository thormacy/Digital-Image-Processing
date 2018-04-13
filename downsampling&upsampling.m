close all;
clear all;
%import image
img = imread('/Users/shengwan/Desktop/barbara.bmp');
img = im2double(img);
[M,N] = size(img);
m = round(M/2);
n = round(N/2);
%down sampling
down_img = zeros(m,n);     %down sampling without average filter
down_img_avg = zeros(m,n); %down sampling with average filter
for i = 1:m
    for j = 1:n
        down_img(i,j) = img(2*i,2*j); 
        down_img_avg(i,j) = (img(2*i,2*j)+img(2*i-1,2*j)+img(2*i,2*j-1)+img(2*i-1,2*j-1))/4;
    end
end
%up sampling
up_img_NN = zeros(M,N); %pixel replication method on down_img
up_img_BL = zeros(M,N); %bilinear interpolation method on down_img
up_img_avg_NN = zeros(M,N); %pixel replication method on down_img_avg
up_img_avg_BL = zeros(M,N); %bilinear interpolation method on down_img_avg
for i = 1:M-1
    for j = 1:N-1
        up_img_NN(i,j) = down_img(round(i/2),round(j/2)); 
        up_img_avg_NN(i,j) = down_img_avg(round(i/2),round(j/2));
        
        if mod(i,2) == 1 
            if mod(j,2) == 1
                up_img_BL(i,j) = down_img((i+1)/2,(j+1)/2);
                up_img_avg_BL(i,j) = down_img_avg((i+1)/2,(j+1)/2);
            else
                up_img_BL(i,j) = (down_img((i+1)/2,j/2)+down_img((i+1)/2,j/2+1))/2;
                up_img_avg_BL(i,j) = (down_img_avg((i+1)/2,j/2)+down_img_avg((i+1)/2,j/2+1))/2;
            end
        else
            if mod(j,2) == 1
                up_img_BL(i,j) = (down_img(i/2,(j+1)/2) + down_img(i/2+1,(j+1)/2))/2;
                up_img_avg_BL(i,j) = (down_img_avg(i/2,(j+1)/2) + down_img_avg(i/2+1,(j+1)/2))/2;
            else
                up_img_BL(i,j) = (down_img(i/2,j/2)+down_img(i/2,j/2+1)+...
                    down_img(i/2+1,j/2)+down_img(i/2+1,j/2+1))/4;
                up_img_avg_BL(i,j) = (down_img_avg(i/2,j/2)+down_img_avg(i/2,j/2+1)+...
                    down_img_avg(i/2+1,j/2)+down_img_avg(i/2+1,j/2+1))/4;
            end
        end
    end
end

subplot(2,4,1);
imshow(img);
title('origin image')
subplot(2,4,2);
imshow(down_img);
title('down-sampling')
subplot(2,4,3);
imshow(down_img_avg);
title('down-sampling-avg')
subplot(2,4,5);
imshow(up_img_NN);
title('NN on down-sampling')
subplot(2,4,6);
imshow(up_img_BL);
title('BL on down-sampling')
subplot(2,4,7);
imshow(up_img_avg_NN);
title('NN on down-sampling-avg')
subplot(2,4,8);
imshow(up_img_avg_BL);
title('BL on down-sampling-avg')

imwrite(down_img,'/Users/shengwan/Desktop/down_img.jpg')
imwrite(down_img_avg,'/Users/shengwan/Desktop/down_img_avg.jpg')
imwrite(up_img_NN,'/Users/shengwan/Desktop/up_img_NN.jpg')
imwrite(up_img_BL,'/Users/shengwan/Desktop/up_img_BL.jpg')
imwrite(up_img_avg_NN,'/Users/shengwan/Desktop/up_img_avg_NN.jpg')
imwrite(up_img_avg_BL,'/Users/shengwan/Desktop/up_img_avg_BL.jpg')






