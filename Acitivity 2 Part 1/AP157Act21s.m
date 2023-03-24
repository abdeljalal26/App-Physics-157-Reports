%% 2.1 Discrete FT

% apply fft
FA = fft2(Sinusoid(5,0));
figure(1);
imagesc(abs(FA));
colormap hot;
axis off;
axis equal;

% apply fftshift
FAshifted = fftshift(FA);
figure(2);
subplot(1,2,1);
imagesc(abs(FAshifted))
title("FFT Shift");
colormap hot;
axis equal;
axis image;

% image(rescale(log(abs(FAshifted + 1)),0,256));
subplot(1,2,2);
imagesc(log(abs(FAshifted)));
title("Log Scale");
colormap hot;
axis equal;
axis image;

function A = Sinusoid(f, d)
    N = 256;
    x = linspace(-2,2,N);
    y = x;
    [X,Y] = meshgrid(x,y);
    A = sin(2*f*(sin(d)*Y + cos(d)*X));
end