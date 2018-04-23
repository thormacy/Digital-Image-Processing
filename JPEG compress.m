image = imread('/Users/shengwan/Desktop/lena512.jpg');
image = double(image) - 128;
fun = @dct2;
DCT_image = blkproc(image,[8,8],fun);
Quantization = [[16,11,10,16,24,40,51,61];
                [12,12,14,19,26,58,60,55];
                [14,13,16,24,40,57,69,56];
                [14,17,22,29,51,87,80,62];
                [18,22,37,56,68,109,103,77];
                [24,35,55,64,81,104,113,92];
                [49,64,78,87,103,121,120,101];
                [72,92,95,98,112,100,103,99]];
for i = 0.5:3:20
    scale = i;
    QM = Quantization * scale;
    fun = @(x) round(x./QM).*QM;
    Qantization_DCT = blkproc(DCT_image,[8,8],fun);
    fun = @idct2;
    Reconstruct_image = blkproc(Qantization_DCT,[8,8],fun);
    Reconstruct_image = Reconstruct_image + 128;
    imshow(Reconstruct_image,[])
    dir = strcat('/Users/Shengwan/Desktop/',num2str(i),'.jpg');
    imwrite(Reconstruct_image/255,dir);
    pause
end

