#This matlab program shows high frequecncy part and low frequency part after DFT. Low frequency part will preserve most of information
clear all;
close all;
grayfile=imread('/Users/shengwan/Desktop/lena512.bmp');
Ft=fft2(grayfile);
[M,N]=size(Ft);

T=1/8;
H1=zeros(M,N);
for i=1:M*T
    for j=1:M*T
        H1(i,j)=1;
    end
    for j=(1-T)*M:M
        H1(i,j)=1;
    end
end
for i=(1-T)*M:M
    for j=1:M*T
        H1(i,j)=1;
    end
    for j=(1-T)*M:M
        H1(i,j)=1;
    end
end
subplot(2,2,1);
imshow(H1);

H2=zeros(M,N);
for i=T*M:(1-T)*M
    for j=1:M
        H2(i,j)=1;
    end
end
for i=1:M
    for j=T*M:(1-T)*M
        H2(i,j)=1;
    end
end
subplot(2,2,2);
imshow(H2);

g1=real(ifft2(Ft.*H1))/255;
subplot(2,2,3);
imshow(g1);

g2=real(ifft2(Ft.*H2))/255;
subplot(2,2,4);
imshow(g2);

imwrite(g1,'/Users/shengwan/Desktop/g1.jpg','jpg');
imwrite(g2,'/Users/shengwan/Desktop/g2.jpg','jpg');


