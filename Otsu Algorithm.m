%Otsu Algorithm, ouput image is an binary image depends on threshold T
clear all;
image = imread('/Users/shengwan/Desktop/flower.bmp');
[m,n] = size(image);
h = imhist(image)';
N = sum(h);
P = h/N;
max = 0;
sigma = [0] * 256;

for i = 1:256
    P1 = sum(P(1:i));
    P2 = sum(P(i+1:256));
    u1 = 0;
    for j = 0:i-1
        u1 = u1 + j * P(j+1);
    end
    u2 = 0;
    for j = i:255
        u2 = u2 + j * P(j+1);
    end
    m1 = u1 / P1;
    m2 = u2 / P2;
    sigma(i) = P1 * P2 * ((m1 - m2)^2);
    if sigma(i) > max
        max = sigma(i);
        T = i-1;
    end
end

Binary_image = image;
for i = 1:m
    for j = 1:n
        if image(i,j) > T
            Binary_image(i,j) = 255;
        else
            Binary_image(i,j) = 0;
        end
    end
end
subplot(1,2,1)
imshow(image)
title('Input Image')
subplot(1,2,2)
imshow(Binary_image)
title(strcat('Output Image(Threshold:',num2str(T),')'))
            
    
