% grayscale image
A = double(im2gray(imread("apollo.tif")));
Aave = double(mean2(A));
subtract = A - Aave;
figure(1);
imshow(subtract);

% apply fft
FA = fft2(subtract);
figure(2);
subplot(1,3,1);
imagesc(abs(FA));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FA);
subplot(1,3,2);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(1,3,3);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis image;

% log
figure(3);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis image;

% filter mask
[X,Y] = size(A);
filter = ones(X,Y);
% zero at sinusoidal peak points
filter(1:1383,943:951) = 0; 
filter(688:697,1:1892) = 0;
filtershift = fftshift(filter); % filter FFT shift 

Original_Image = im2double(imread("apollo.tif"));
R = Original_Image(:,:,1);
G = Original_Image(:,:,2);
B = Original_Image(:,:,3);
R_orig = double(R);
G_orig = double(G);
B_orig = double(B);

RFT = double(fft2(R_orig));
GFT = double(fft2(G_orig));
BFT = double(fft2(B_orig));

% filter FFT shift times RGB FT
Rfilter = double(RFT.*filtershift);
Gfilter = double(GFT.*filtershift);
Bfilter = double(BFT.*filtershift);

% Inverse FFT
IRfilter = double(ifft2(Rfilter));
IGfilter = double(ifft2(Gfilter));
IBfilter = double(ifft2(Bfilter));

% Overlay of RGB channels
Restored_Image(:,:,1) = double(IRfilter);
Restored_Image(:,:,2) = double(IGfilter);
Restored_Image(:,:,3) = double(IBfilter);

figure(4);
imshow(Original_Image), title('Original Image');
figure(5);
imshow(Restored_Image), title('Restored Image');

%%

% grayscale image
A = double(im2gray(imread("apollo.tif")));
Aave = double(mean2(A));
subtract = A - Aave;
figure(1);
imshow(subtract);

% apply fft
FA = fft2(subtract);
figure(2);
subplot(1,3,1);
imagesc(abs(FA));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FA);
subplot(1,3,2);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(1,3,3);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis image;

% log
figure(3);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis image;

% filter mask
[X,Y] = size(A);
filter = ones(X,Y);
% zero at sinusoidal peak points
filter(1:1383,943:951) = 0; 
filter(688:697,1:1892) = 0;
filtershift = fftshift(filter); % filter FFT shift 

Original_Image = im2double(imread("apollo.tif"));

RFT = double(fft2(Original_Image));

% filter FFT shift times RGB FT
Rfilter = double(RFT.*filtershift);

% Inverse FFT
IRfilter = double(ifft2(Rfilter));

% Overlay of RGB channels

figure(4);
imshow(Original_Image), title('Original Image');
figure(5);
imshow(IRfilter*3), title('Restored Image');

%%

Original_Lunar = im2double(imread("apollo.tif"));
figure(1);
imshow(Original_Lunar);

Gray_Lunar = im2gray(Original_Lunar); 
figure(2);
imshow(Gray_Lunar);

Gray_Lunar_meanfiltered = Gray_Lunar - mean2(Gray_Lunar);
figure(3);
imshow(Gray_Lunar_meanfiltered); 

%Take the FT of the mean-subtracted image
FFT_Gray_Lunar_meanfiltered = fft2(Gray_Lunar_meanfiltered);
figure(4);
imagesc(log(abs(fftshift(FFT_Gray_Lunar_meanfiltered)))); colormap gray;

%Make a Manual Mask
[A,B] = size(Original_Lunar); 

mask_template = ones(A,B); 

mask_template(1:A,930:950) = 0; 
mask_template(680:700,1:B) = 0; 
mask_template(665:715,915:965) = 1;
figure(5);
imshow(mask_template); 

%FFT shift of the mask
figure(6);
imshow(Original_Lunar); 
fftshifted_mask = fftshift(mask_template); 

FT_Orig_Image = fft2(Original_Lunar);

%FT of Image multiplied to mask
FT_Image_Mask = fftshifted_mask.*FT_Orig_Image; 

Filtered_Image = ifft2(FT_Image_Mask); 
figure(7);
imshow(abs(Filtered_Image));