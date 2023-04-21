% mean-center grayscale value
print = double(rgb2gray(imread("finger.jpg")));
Aave = double(mean2(print));
subtract = print - Aave;
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

%% from Richmond

Original_Fingerprint = im2double(imread("finger.jpg"));
figure(1);
imshow(Original_Fingerprint); 

Gray_Fingerprint = rgb2gray(Original_Fingerprint);
figure(2);
imshow(Gray_Fingerprint); 

Gray_Fingerprint_Filtered = Gray_Fingerprint - mean2(Gray_Fingerprint); 
figure(3);
imshow(Gray_Fingerprint_Filtered); 

%Obtain the FT of the mean-centered grayscale image
FT_Gray_Fingerprint_Filtered = fft2(Gray_Fingerprint_Filtered); 
figure(4);
imagesc(log(abs(fftshift(FT_Gray_Fingerprint_Filtered)))); 

% Calculate the power spectrum of the Fourier transform
intensity = log(abs(fftshift(FT_Gray_Fingerprint_Filtered)));

% Define a threshold for the power spectrum
threshold_remove = 0.25 * max(intensity(:)); 

% Create the mask as a binary array with 1's in areas of low power and 0's in areas of high power
Mask_Template = zeros(size(intensity));
Mask_Template(intensity <= threshold_remove) = 1;
Mask_Template(172:210,128:164) = 1;

figure(5);
imshow(Mask_Template); 

%FFT shift of the mask 
fftshifted_mask = fftshift(~Mask_Template); 

%Take the Red, Green, and Blue Channels of the image 
Red_Channel = Original_Fingerprint(:,:,1); 
Blue_Channel = Original_Fingerprint(:,:,2); 
Green_Channel = Original_Fingerprint(:,:,3); 

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

figure(6);
imshow(abs(Filtered_Image)); 

Binarized_Fingerprint = imbinarize(im2gray(abs(Filtered_Image))); 

figure(7);
imshow(~Binarized_Fingerprint);
