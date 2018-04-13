close all;
clear all;
%Load Image
[a,MAP]=imread('/Users/shengwan/Desktop/parrots.jpeg');
%Obtain R,G,B components
R = a(:,:,1);
G = a(:,:,2);
B = a(:,:,3);
%Quantize R, G,B components to 3,3,2 bits
[M,N] = size(R);
eq_R = zeros(M,N);
eq_G = zeros(M,N);
eq_B = zeros(M,N);
B = 256;
q1 = B/8;
q2 = B/8;
for i = 1:M
    for j = 1:N
        eq_R(i,j) = floor(R(i,j)/q1)*q1 + q1/2 + 0;
        eq_G(i,j) = floor(G(i,j)/q1)*q1 + q1/2 + 0;
        eq_B(i,j) = floor(G(i,j)/q2)*q1 + q2/2 + 0;
    end
end
%Change back to RGB image
F(:,:,1) = uint8(eq_R);
F(:,:,2) = uint8(eq_G);
F(:,:,3) = uint8(eq_B);
imshow(F,MAP)
%Save Image
imwrite(F,'/Users/shengwan/Desktop/Q3.jpg')

