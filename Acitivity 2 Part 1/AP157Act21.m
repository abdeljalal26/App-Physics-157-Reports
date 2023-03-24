%% 2.1 Discrete FT

% make a circle
x = linspace(-1,1,400);
y = x;
[X,Y] = meshgrid(x,y);
R = sqrt(X.^2 + Y.^2);
A = zeros(size(R));
A(R<0.8) = 1;
figure(1);
subplot(2,2,1);
imshow(A);
title("White Circle")

% apply fft
FA = fft2(A);
subplot(2,2,2);
imagesc(abs(FA));
title("FFT")
colormap hot;
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FA);
subplot(2,2,3);
imagesc(abs(FAshifted))
title("FFT Shifted")
colormap hot;
axis equal;
axis off;
axis image;

% image(rescale(log(abs(FAshifted + 1)),0,256));
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
title("Log Scale")
colormap hot;
axis equal;
axis off;
axis image;

% SQUARE

% make a square
A = zeros(400);
A(150:250,150:250) = 1;
figure(2);
subplot(2,2,1);
imshow(A);
title("White Square")

% apply fft
FA = fft2(A);
subplot(2,2,2);
imagesc(abs(FA));
title("FFT")
colormap hot;
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FA);
subplot(2,2,3);
imagesc(abs(FAshifted))
title("FFT Shifted")
colormap hot;
axis equal;
axis image;
axis off;

% image(rescale(log(abs(FAshifted + 1)),0,256));
subplot(2,2,4);
imagesc(log(abs(FAshifted)));
title("Log Scale")
colormap hot;
axis equal;
axis image;
axis off;


% Image

I = rgb2gray(imread("cat2.jpg"));
figure(3);
subplot(1,3,1);
imshow(I);
title("Image")

% double FFT
Irec = fft2(fft2(I));
subplot(1,3,2);
imagesc(abs(Irec));
colormap gray;
axis image;
title("Double FFT")

% inverse FFT
Irec2 = ifft2(fft2(I));
subplot(1,3,3);
imagesc(abs(Irec2));
colormap gray;
axis image;
axis off;
title("Inverse FFT")
