% create 2D sinusoid
N = 100;
x = linspace(-1,1,N);
y = x;
[X,Y] = meshgrid(x,y);
f = 4; %frequency
z = sin(2*pi*4*X);
figure(1);
subplot(2,2,1);
imshow(z);
title("Function");

% apply fft
FA = fft2(z);
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

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
title("Log Scale")
colormap hot;
axis equal;
axis off;
axis image;

% pattern combination
theta = 45;
A = sin(2*pi*4*(Y*sin(theta) + X*cos(theta)));
figure(2);
subplot(2,2,1);
imshow(A);
title("Function");

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

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
title("Log Scale")
colormap hot;
axis equal;
axis off;
axis image;

Z = sin(2*pi*f*X).*sin(2*pi*f*Y);
figure(3);
subplot(2,2,1);
imshow(Z)
title("Function");

% apply fft
FA = fft2(Z);
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

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
title("Log Scale")
colormap hot;
axis equal;
axis off;
axis image;

% pattern combination
Q = sin(2*pi*4*(Y*sin(theta) + X*cos(theta)));
W = sin(2*pi*10*(Y*sin(theta) + X*cos(theta)));
E = sin(2*pi*15*(Y*sin(theta) + X*cos(theta)));

G = Q+W+E;
figure(4);
subplot(2,2,1);
imshow(G)
title("Function");

% apply fft
FA = fft2(G);
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

% log
subplot(2,2,4);
imagesc(log(abs(FAshifted + 1)));
title("Log Scale")
colormap hot;
axis equal;
axis off;
axis image;