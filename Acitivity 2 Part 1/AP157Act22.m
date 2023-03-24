%% 2.2 Convolution NIP

x = linspace(-1,1,256);
y = x;
[X,Y] = meshgrid(x,y);
R = sqrt(X.^2 + Y.^2);
A = zeros(size(R));

% diameter 10%
A(R<0.1) = 1;
figure(1);
subplot(1,2,1);
imshow(A);
title("Circle 10%");
FA = fftshift(A);
Fnip = fft2(rgb2gray(imread("nip.tif")));
H = FA.*Fnip;
h = ifft2(H);
subplot(1,2,2);
imagesc(abs(h));
title("Convoluted");
colormap gray;
axis image;

% diameter 25%
A(R<0.25) = 1;
figure(2);
subplot(1,2,1);
imshow(A);
title("Circle 25%");
FA = fftshift(A);
Fnip = fft2(rgb2gray(imread("nip.tif")));
H = FA.*Fnip;
h = ifft2(H);
subplot(1,2,2);
imagesc(abs(h));
title("Convoluted");
colormap gray;
axis image;

% diameter 50%
A(R<0.50) = 1;
figure(3);
subplot(1,2,1);
imshow(A);
title("Circle 50%");
FA = fftshift(A);
Fnip = fft2(rgb2gray(imread("nip.tif")));
H = FA.*Fnip;
h = ifft2(H);
subplot(1,2,2);
imagesc(abs(h));
title("Convoluted");
colormap gray;
axis image;

% diameter 75%
A(R<0.75) = 1;
figure(4);
subplot(1,2,1);
imshow(A);
title("Circle 75%");
FA = fftshift(A);
Fnip = fft2(rgb2gray(imread("nip.tif")));
H = FA.*Fnip;
h = ifft2(H);
subplot(1,2,2);
imagesc(abs(h));
title("Convoluted")

colormap gray;
axis image;

% diameter 100%
A(R<1) = 1;
figure(5);
subplot(1,2,1);
imshow(A);
title("Circle 100%")
FA = fftshift(A);
Fnip = fft2(rgb2gray(imread("nip.tif")));
H = FA.*Fnip;
h = ifft2(H);
subplot(1,2,2);
imagesc(abs(h));
title("Convoluted")
colormap gray;
axis image;

%% 2.2 Convolution JWST

% JWST Mirror size variation

% make a circle/star
x = linspace(-1,1,256);
y = x;
[X,Y] = meshgrid(x,y);
R = sqrt(X.^2 + Y.^2);
A = ones(size(R));
A(R<0.2) = 0;
imwrite(A,"star.png")

% JWST size 1

% FFT shift JWST mirror
camera = im2double(imread("1.png"));
camera_channel = camera(:,:,1);
camera_shift = fftshift(camera_channel);

% FFT star
star = im2double(imread('star.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(1);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;


% JWST size 2

% FFT shift JWST mirror
camera = im2double(imread("2.png"));
camera_channel = camera(:,:,1);
camera_shift = fftshift(camera_channel);

% FFT star
star = im2double(imread('star.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(2);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;


% JWST size 3

% FFT shift JWST mirror
camera = im2double(imread("3.png"));
camera_channel = camera(:,:,1);
camera_shift = fftshift(camera_channel);

% FFT star
star = im2double(imread('star.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(3);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;


% JWST size 4

% FFT shift JWST mirror
camera = im2double(imread("4.png"));
camera_channel = camera(:,:,1);
camera_shift = fftshift(camera_channel);

% FFT star
star = im2double(imread('star.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(4);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;


% JWST size 5

% FFT shift JWST mirror
camera = im2double(imread("5.png"));
camera_channel = camera(:,:,1);
camera_shift = fftshift(camera_channel);

% FFT star
star = im2double(imread('star.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(5);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;


% Star size variation

% make a circle/star
x = linspace(-1,1,256);
y = x;
[X,Y] = meshgrid(x,y);
R = sqrt(X.^2 + Y.^2);
A = ones(size(R));

% star size 1
A(R<0.2) = 0;
imwrite(A,"star.png")

% FFT shift JWST mirror
camera = im2double(imread("1.png"));
camera_channel = camera(:,:,1);
camera_shift = fftshift(camera_channel);

% FFT star
star = im2double(imread('star.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(6);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;


% star size 2
A(R<0.4) = 0;
imwrite(A,"star.png")

% FFT shift JWST mirror
camera = im2double(imread("1.png"));
camera_channel = camera(:,:,1);
camera_shift = fftshift(camera_channel);

% FFT star
star = im2double(imread('star.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(7);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;


% star size 3
A(R<0.6) = 0;
imwrite(A,"star.png")

% FFT shift JWST mirror
camera = im2double(imread("1.png"));
camera_channel = camera(:,:,1);
camera_shift = fftshift(camera_channel);

% FFT star
star = im2double(imread('star.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(8);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;


% star size 4
A(R<0.8) = 0;
imwrite(A,"star.png")

% FFT shift JWST mirror
camera = im2double(imread("1.png"));
camera_channel = camera(:,:,1);
camera_shift = fftshift(camera_channel);

% FFT star
star = im2double(imread('star.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(9);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;


% star size 5
A(R<1) = 0;
imwrite(A,"star.png")

% FFT shift JWST mirror
camera = im2double(imread("1.png"));
camera_channel = camera(:,:,1);
camera_shift = fftshift(camera_channel);

% FFT star
star = im2double(imread('star.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(10);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;


% binary star

% FFT star
star = im2double(imread('dot.png'));
star_channel = star(:,:,1);
fft2_star = fft2(star_channel);

% fftshift * fft2 & invfft
cameraxstar = camera_shift.*fft2_star;
invcameraxstar = ifft2(cameraxstar); 

% plotting 

figure(11);
subplot(2,2,1);
imagesc(camera);
axis image; axis off;
title('JWST Mirror');
colormap gray;

subplot(2,2,2);
imagesc(star);
axis image; axis off;
title('Star');
colormap gray;

subplot(2,2,3);
imagesc(abs(invcameraxstar));
axis image; axis off;
title('Star Image');
colormap hot;

subplot(2,2,4);
imagesc(log(abs(invcameraxstar)));
axis image; axis off;
title('Star Image (log scale)');
colormap hot;