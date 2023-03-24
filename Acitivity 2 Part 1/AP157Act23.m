%% 2.3 Correlation 

% Get the FFT2 of both images
phrase = rgb2gray(im2double(imread('RAIN.png')));
phrase_FFT2 = fft2(phrase);

% letter A

A = rgb2gray(im2double(imread('A.png'))); 
A_FFT2 = fft2(A); 

% Multiply the Letter_A_FFT2 and conjugate Phrase_FFT2
product = phrase_FFT2.*conj(A_FFT2); 

% Get the IFFT of the product and display as abs() 
Inverse_Product = fftshift(ifft2(product)); 

% Display image 
figure(1);
subplot(1,3,1);
imshow(phrase);
title("Phrase");
subplot(1,3,2);
imshow(A);
title("Letter");
subplot(1,3,3);
imagesc(abs(Inverse_Product));
title("Matched");

colormap gray; axis image;

% letter I

A = rgb2gray(im2double(imread('I.png'))); 
A_FFT2 = fft2(A); 

% Multiply the Letter_A_FFT2 and conjugate Phrase_FFT2
product = phrase_FFT2.*conj(A_FFT2); 

% Get the IFFT of the product and display as abs() 
Inverse_Product = fftshift(ifft2(product)); 

% Display image 
figure(2);
subplot(1,3,1);
imshow(phrase);
title("Phrase");
subplot(1,3,2);
imshow(A);
title("Letter");
subplot(1,3,3);
imagesc(abs(Inverse_Product));
title("Matched");

colormap gray; axis image;

% letter N

A = rgb2gray(im2double(imread('N.png'))); 
A_FFT2 = fft2(A); 

% Multiply the Letter_A_FFT2 and conjugate Phrase_FFT2
product = phrase_FFT2.*conj(A_FFT2); 

% Get the IFFT of the product and display as abs() 
Inverse_Product = fftshift(ifft2(product)); 

% Display image 
figure(3);
subplot(1,3,1);
imshow(phrase);
title("Phrase");
subplot(1,3,2);
imshow(A);
title("Letter");
subplot(1,3,3);
imagesc(abs(Inverse_Product));
title("Matched");

colormap gray; axis image;

% letters IN

A = rgb2gray(im2double(imread('IN.png'))); 
A_FFT2 = fft2(A); 

% Multiply the Letter_A_FFT2 and conjugate Phrase_FFT2
product = phrase_FFT2.*conj(A_FFT2); 

%Get the IFFT of the product and display as abs() 
Inverse_Product = fftshift(ifft2(product)); 

%Display image 
figure(4);
subplot(1,3,1);
imshow(phrase);
title("Phrase");
subplot(1,3,2);
imshow(A);
title("Letter");
subplot(1,3,3);
imagesc(abs(Inverse_Product));
title("Matched");

colormap gray; axis image;