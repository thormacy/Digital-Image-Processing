close all;
clear all;
%Load Image
a=imread('/Users/shengwan/Desktop/lenna.ppm');
%Obtain R,G,B Component
R = a(:,:,1);
G = a(:,:,2);
B = a(:,:,3);
%Obtain Y,I,Q Component
Y = 0.299*R + 0.587*G + 0.114*B;
I = 0.596*R - 0.274*G - 0.322*B;
Q = 0.211*R - 0.523*G + 0.312*B;
%Histogram Equalization on Y
[M,N] = size(Y);
H = imhist(Y);
H = H/(M*N); 
for k=1:256
    g(k) = uint8(sum(H(1:k))*255);
end
histeq_Y = g(Y+1);
%Change back to RGB image
R = histeq_Y + 0.956*I + 0.621*Q;
G = histeq_Y - 0.272*I - 0.649*Q;
B = histeq_Y - 1.106*I + 1.703*Q;
F(:,:,1) = R;
F(:,:,2) = G;
F(:,:,3) = B;
%Save output image
imwrite(Y,'/Users/shengwan/Desktop/Q2-Y.jpg')
imwrite(histeq_Y,'/Users/shengwan/Desktop/Q2-histeq_Y.jpg')
imwrite(F,'/Users/shengwan/Desktop/Q2-2.jpg')

