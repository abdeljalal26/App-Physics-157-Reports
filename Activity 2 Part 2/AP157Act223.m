% binary image of 2 dots
matrix = zeros(201);
matrix(101,90) = 1;
matrix(101,111) = 1;
figure(1);
subplot(2,2,1);
imshow(matrix);
title("Binary Dots");

% FFT
FT = fft2(matrix);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;

%% Circle Size 1

A = rgb2gray(im2double(imread("circle1.png")));
figure(2);
subplot(2,2,1);
imshow(A);
title("Circles");

% FFT
FT = fft2(A);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;

%% Circle Size 2

A = rgb2gray(im2double(imread("circle2.png")));
figure(3);
subplot(2,2,1);
imshow(A);
title("Circles");

% FFT
FT = fft2(A);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;

%% Circle Size 3

A = rgb2gray(im2double(imread("circle3.png")));
figure(4);
subplot(2,2,1);
imshow(A);
title("Circles");

% FFT
FT = fft2(A);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;

%% Circle Size 4

A = rgb2gray(im2double(imread("circle4.png")));
figure(5);
subplot(2,2,1);
imshow(A);
title("Circles");

% FFT
FT = fft2(A);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;

%% Square Size 1

A = rgb2gray(im2double(imread("square1.png")));
figure(6);
subplot(2,2,1);
imshow(A);
title("Squares");

% FFT
FT = fft2(A);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;

%% Square Size 2

A = rgb2gray(im2double(imread("square2.png")));
figure(7);
subplot(2,2,1);
imshow(A);
title("Squares");

% FFT
FT = fft2(A);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;

%% Square Size 3

A = rgb2gray(im2double(imread("square3.png")));
figure(8);
subplot(2,2,1);
imshow(A);
title("Squares");

% FFT
FT = fft2(A);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;

%% Square Size 4

A = rgb2gray(im2double(imread("square4.png")));
figure(9);
subplot(2,2,1);
imshow(A);
title("Squares");

% FFT
FT = fft2(A);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;

%% Convolution

% array pattern
A = zeros(200);
A(113,24) = 1;
A(3,81) = 1;
A(156,19) = 1;
A(63,64) = 1;
A(11,24) = 1;
A(99,12) = 1;
A(163,71) = 1;
A(10,143) = 1;
A(157,67) = 1;
A(101,78) = 1;

% square pattern
D = rgb2gray(imread("box.png"));
% convolution
tet = conv2(A,D);

figure(10);
subplot(1,3,1);
imshow(A);
title("Array Pattern");
subplot(1,3,2);
imshow(tet);
title("Convoluted")
colormap gray;
axis image;

% cross pattern
D = rgb2gray(imread("cross.png"));
% convolution
tet = conv2(A,D);

subplot(1,3,3);
imshow(tet);
title("Convoluted")
colormap gray;
axis image;

%%

% array pattern with equal spacing
A = zeros(200);
for i = [20 40 60 80 100 120 140 160 180 200]
    A(i,20) = 1
end
for i = [20 40 60 80 100 120 140 160 180 200]
    A(i,40) = 1
end
for i = [20 40 60 80 100 120 140 160 180 200]
    A(i,60) = 1
end
for i = [20 40 60 80 100 120 140 160 180 200]
    A(i,80) = 1
end
for i = [20 40 60 80 100 120 140 160 180 200]
    A(i,100) = 1
end
for i = [20 40 60 80 100 120 140 160 180 200]
    A(i,120) = 1
end
for i = [20 40 60 80 100 120 140 160 180 200]
    A(i,140) = 1
end
for i = [20 40 60 80 100 120 140 160 180 200]
    A(i,160) = 1
end
for i = [20 40 60 80 100 120 140 160 180 200]
    A(i,180) = 1
end
for i = [20 40 60 80 100 120 140 160 180 200]
    A(i,200) = 1
end

figure(11);
subplot(2,2,1);
imshow(A);
title("Array");

% FFT
FT = fft2(A);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;

% array pattern with equal spacing
A = zeros(200);
for i = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200]
    A(i,20) = 1
end
for i = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200]
    A(i,40) = 1
end
for i = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200]
    A(i,60) = 1
end
for i = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200]
    A(i,80) = 1
end
for i = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200]
    A(i,100) = 1
end
for i = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200]
    A(i,120) = 1
end
for i = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200]
    A(i,140) = 1
end
for i = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200]
    A(i,160) = 1
end
for i = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200]
    A(i,180) = 1
end
for i = [10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200]
    A(i,200) = 1
end

figure(12);
subplot(2,2,1);
imshow(A);
title("Array");

% FFT
FT = fft2(A);
subplot(2,2,2);
imagesc(abs(FT));
colormap hot;
title("FFT")
axis off;
axis equal;
axis image;

% apply fftshift
FAshifted = fftshift(FT);
subplot(2,2,3);
imagesc(abs(FAshifted))
colormap hot;
title("FFT Shifted")
axis equal;
axis off;
axis image;

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
colormap hot;
title("Log Scale")
axis equal;
axis off;
axis image;
