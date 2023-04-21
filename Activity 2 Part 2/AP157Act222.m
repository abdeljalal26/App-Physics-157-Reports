% grayscale image
A = double(rgb2gray(imread("185-8526_IMG.jpeg")));
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

% filter mask
[X,Y] = size(A);
filter = ones(X,Y);
% zero at sinusoidal peak points
filter(290:310,490:510) = 0; 
filter(410:430,490:510) = 0; 
filter(540:560,505:525) = 0; 
filter(660:680,515:535) = 0; 
filter(780:800,525:545) = 0; 
filter(595:615,640:660) = 0;
filter(715:735,650:670) = 0;
filter(840:860,655:675) = 0;
filter(350:370,625:645) = 0;
filter(225:245,615:635) = 0;
filter(105:125,605:625) = 0;
filter(410:430,760:780) = 0;
filter(530:550,765:785) = 0;
filter(650:670,775:795) = 0;
filter(775:795,780:800) = 0;
filter(285:305,750:770) = 0;
filter(165:185,740:760) = 0;
filter(170:190,480:500) = 0;
filtershift = fftshift(filter); % filter FFT shift 

Original_Image = im2double(imread("185-8526_IMG.jpeg"));
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

figure(3);
imshow(Original_Image), title('Original Image');
figure(4);
imshow(Restored_Image), title('Restored Image');

% inverted filter mask
[X,Y] = size(A);
filter = zeros(X,Y);
filter(290:310,490:510) = 1; 
filter(410:430,490:510) = 1; 
filter(540:560,505:525) = 1; 
filter(660:680,515:535) = 1; 
filter(780:800,525:545) = 1; 
filter(595:615,640:660) = 1;
filter(715:735,650:670) = 1;
filter(840:860,655:675) = 1;
filter(350:370,625:645) = 1;
filter(225:245,615:635) = 1;
filter(105:125,605:625) = 1;
filter(410:430,760:780) = 1;
filter(530:550,765:785) = 1;
filter(650:670,775:795) = 1;
filter(775:795,780:800) = 1;
filter(285:305,750:770) = 1;
filter(165:185,740:760) = 1;
filter(170:190,480:500) = 1;
filtershift = fftshift(filter);

Original_Image = im2double(imread("185-8526_IMG.jpeg"));
R = Original_Image(:,:,1);
G = Original_Image(:,:,2);
B = Original_Image(:,:,3);
R_orig = double(R);
G_orig = double(G);
B_orig = double(B);

RFT = double(fft2(R_orig));
GFT = double(fft2(G_orig));
BFT = double(fft2(B_orig));

Rfilter = double(RFT.*filtershift);
Gfilter = double(GFT.*filtershift);
Bfilter = double(BFT.*filtershift);

IRfilter = double(ifft2(Rfilter));
IGfilter = double(ifft2(Gfilter));
IBfilter = double(ifft2(Bfilter));

Restored_Image(:,:,1) = double(IRfilter);
Restored_Image(:,:,2) = double(IGfilter);
Restored_Image(:,:,3) = double(IBfilter);

figure(5);
imshow(Restored_Image), title('Canvas Weave');

%% Challenge 1 and 2

A = double(rgb2gray(imread("educ.jpg")));
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

% filter mask
[X,Y] = size(A);
filter = ones(X,Y);
% zero at sinusoidal peak points
filter(1480:1500,1650:1690) = 0; 
filter(1370:1385,1805:1830) = 0; 
filter(1590:1615,1825:1845) = 0; 
filter(1245:1275,1955:1985) = 0; 
filter(1700:1725,1985:2015) = 0; 
filter(1370:1385,2128:2144) = 0;
filter(1590:1610,2145:2163) = 0;
filter(1472:1505,2283:2315) = 0;
filter(1140:1165,1795:1810) = 0;
filter(1250:1270,1640:1665) = 0;
filter(1595:1615,1500:1520) = 0;
filter(1830:1845,1840:1855) = 0;
filter(1810:1840,2155:2180) = 0;
filter(1710:1730,2310:2330) = 0;
filter(1360:1385,2450:2468) = 0;
filter(1135:1155,2115:2130) = 0;
filtershift = fftshift(filter); % filter FFT shift

Original_Image = im2double(imread("educ.jpg"));
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

% inverse FFT
IRfilter = double(ifft2(Rfilter));
IGfilter = double(ifft2(Gfilter));
IBfilter = double(ifft2(Bfilter));

% Overlay of RGB channels
Restored_Image(:,:,1) = double(IRfilter);
Restored_Image(:,:,2) = double(IGfilter);
Restored_Image(:,:,3) = double(IBfilter);

figure(3);
imshow(Original_Image), title('Original Image');
figure(4);
imshow(Restored_Image), title('Restored Image');

% inverted filter mask
[X,Y] = size(A);
filter = zeros(X,Y);
filter(1480:1500,1650:1690) = 1; 
filter(1370:1385,1805:1830) = 1; 
filter(1590:1615,1825:1845) = 1; 
filter(1245:1275,1955:1985) = 1; 
filter(1700:1725,1985:2015) = 1; 
filter(1370:1385,2128:2144) = 1;
filter(1590:1610,2145:2163) = 1;
filter(1472:1505,2283:2315) = 1;
filter(1140:1165,1795:1810) = 1;
filter(1250:1270,1640:1665) = 1;
filter(1595:1615,1500:1520) = 1;
filter(1830:1845,1840:1855) = 1;
filter(1810:1840,2155:2180) = 1;
filter(1710:1730,2310:2330) = 1;
filter(1360:1385,2450:2468) = 1;
filter(1135:1155,2115:2130) = 1;
filtershift = fftshift(filter);

Original_Image = im2double(imread("educ.jpg"));
R = Original_Image(:,:,1);
G = Original_Image(:,:,2);
B = Original_Image(:,:,3);
R_orig = double(R);
G_orig = double(G);
B_orig = double(B);

RFT = double(fft2(R_orig));
GFT = double(fft2(G_orig));
BFT = double(fft2(B_orig));

Rfilter = double(RFT.*filtershift);
Gfilter = double(GFT.*filtershift);
Bfilter = double(BFT.*filtershift);

IRfilter = double(ifft2(Rfilter));
IGfilter = double(ifft2(Gfilter));
IBfilter = double(ifft2(Bfilter));

Restored_Image(:,:,1) = double(IRfilter);
Restored_Image(:,:,2) = double(IGfilter);
Restored_Image(:,:,3) = double(IBfilter);

figure(5);
imshow(Restored_Image), title('Canvas Weave');

%% Challenge 2

Original_Image = im2double(imread('educ.jpg')); 
imshow(Original_Image);

Gray_Image = rgb2gray(Original_Image); 
imshow(Gray_Image)

Gray_Image_meanfiltered = Gray_Image - mean2(Gray_Image); 
imshow(Gray_Image_meanfiltered)

%Take the FT of the mean-subtracted image
FFT_meanfiltered = fftshift(fft2(Gray_Image_meanfiltered)); 
    imagesc(log(abs(FFT_meanfiltered))); 

% Calculate the power spectrum of the Fourier transform
intensity = log(abs(FFT_meanfiltered));

% Define a threshold for the power spectrum
threshold_remove = 0.50 * max(intensity(:));

% Create the mask as a binary array with 1's in areas of low power and 0's in areas of high power
Mask_Template = zeros(size(intensity));
Mask_Template(intensity <= threshold_remove) = 1;
Mask_Template(1480:1500,1650:1690) = 1; 
Mask_Template(1370:1385,1805:1830) = 1; 
Mask_Template(1590:1615,1825:1845) = 1; 
Mask_Template(1245:1275,1955:1985) = 1; 
Mask_Template(1700:1725,1985:2015) = 1; 
Mask_Template(1370:1385,2128:2144) = 1;
Mask_Template(1590:1610,2145:2163) = 1;
Mask_Template(1472:1505,2283:2315) = 1;
Mask_Template(1140:1165,1795:1810) = 1;
Mask_Template(1250:1270,1640:1665) = 1;
Mask_Template(1595:1615,1500:1520) = 1;
Mask_Template(1830:1845,1840:1855) = 1;
Mask_Template(1810:1840,2155:2180) = 1;
Mask_Template(1710:1730,2310:2330) = 1;
Mask_Template(1360:1385,2450:2468) = 1;
Mask_Template(1135:1155,2115:2130) = 1;


imshow(Mask_Template); 

%FFT shift of the mask 
fftshifted_mask = fftshift(Mask_Template); 

%Take the Red, Green, and Blue Channels of the image 
Red_Channel = Original_Image(:,:,1); 
Blue_Channel = Original_Image(:,:,2); 
Green_Channel = Original_Image(:,:,3); 

%FT of each channel 
FT_Red_Channel = fft2(Red_Channel);
FT_Blue_Channel = fft2(Blue_Channel); 
FT_Green_Channel = fft2(Green_Channel); 

%FT of Channel multiplied to mask
Mask_FT_Red_Channel = fftshifted_mask.*FT_Red_Channel; 
Mask_FT_Blue_Channel = fftshifted_mask.*FT_Blue_Channel; 
Mask_FT_Green_Channel = fftshifted_mask.*FT_Green_Channel; 

%Inverse FT of the masked FT of the Channel 
Filtered_Red_Channel = ifft2(Mask_FT_Red_Channel); 
Filtered_Blue_Channel = ifft2(Mask_FT_Blue_Channel); 
Filtered_Green_Channel = ifft2(Mask_FT_Green_Channel); 

%Overlay the new filtered layers 
Filtered_Image(:,:,1) = Filtered_Red_Channel; 
Filtered_Image(:,:,2) = Filtered_Blue_Channel; 
Filtered_Image(:,:,3) = Filtered_Green_Channel; 

imshow(abs(Filtered_Image)); 

%Invert of the filter mask 
inverted_Mask = ~Mask_Template; 
%imshow(inv_Mask); 

IFFT_inv_Mask = ifft2(inverted_Mask); 
figure; 
imshow(rescale(abs(IFFT_inv_Mask),0,255)); 

%FFT shift of the inverse of the mask 
inv_fftshifted_mask = fftshift(~Mask_Template); 

%Take the Red, Green, and Blue Channels of the image 
Red_Channel = Original_Image(:,:,1); 
Blue_Channel = Original_Image(:,:,2); 
Green_Channel = Original_Image(:,:,3); 

%FT of each channel 
FT_Red_Channel = fft2(Red_Channel);
FT_Blue_Channel = fft2(Blue_Channel); 
FT_Green_Channel = fft2(Green_Channel); 

%FT of Channel multiplied to mask
inv_Mask_FT_Red_Channel = inv_fftshifted_mask.*FT_Red_Channel; 
inv_Mask_FT_Blue_Channel = inv_fftshifted_mask.*FT_Blue_Channel; 
inv_Mask_FT_Green_Channel = inv_fftshifted_mask.*FT_Green_Channel; 

%Inverse FT of the masked FT of the Channel 
inv_Filtered_Red_Channel = ifft2(inv_Mask_FT_Red_Channel); 
inv_Filtered_Blue_Channel = ifft2(inv_Mask_FT_Blue_Channel); 
inv_Filtered_Green_Channel = ifft2(inv_Mask_FT_Green_Channel); 

%Overlay the new filtered layers 
inv_Filtered_Image(:,:,1) = inv_Filtered_Red_Channel; 
inv_Filtered_Image(:,:,2) = inv_Filtered_Blue_Channel; 
inv_Filtered_Image(:,:,3) = inv_Filtered_Green_Channel; 

imshow(abs(inv_Filtered_Red_Channel)); colormap gray

imshowpair(Original_Image, abs(Filtered_Image), "montage");