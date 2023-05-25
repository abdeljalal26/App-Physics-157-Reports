%% Morphology

background = zeros(30);
% 5x5 square
background(5:9,5:9) = 1;
% 10x10 hollow square
background(5:14,16:25) = 1;
background(7:12,18:23) = 0;
% dumbbell
background(20:24,5:9) = 1;
background(22,10:12) = 1;
background(20:24,13:17) = 1;
% plus
background(20:24,26) = 1;
background(22,24:28) = 1;

% strel 2x2
strucel1 = strel('square',2);
% strel 2x1
strucel2 = strel('line',2,0);
% strel 5x5
strucel3 = strel('square',5);

figure(1);
imshow(background);
title('Original Shapes')

% erode strel 2x2
strucel1erode = imerode(background,strucel1);
% dilate strel 2x2
strucel1dilate = imdilate(background,strucel1);
% plot
figure(2);
subplot(1,2,1);
imshow(strucel1erode);
title('Erosion');
subplot(1,2,2);
imshow(strucel1dilate);
title('Dilation');


% erode strel 2x1
strucel2erode = imerode(background,strucel2);
% dilate strel 2x1
strucel2dilate = imdilate(background,strucel2);
% plot
figure(3);
subplot(1,2,1);
imshow(strucel2erode);
title('Erosion')
subplot(1,2,2);
imshow(strucel2dilate);
title('Dilation');


% erode strel 5x5
strucel3erode = imerode(background,strucel3);
% dilate strel 5x5
strucel3dilate = imdilate(background,strucel3);
% plot
figure(4);
subplot(1,2,1);
imshow(strucel3erode);
title('Erosion');
subplot(1,2,2);
imshow(strucel3dilate);
title('Dilation');

%% Malaria

I = imread("malaria(1).jpeg");
Igray = rgb2gray(I);
figure(1);
subplot(1,2,1);
imshow(I);
title('Original');
subplot(1,2,2);
imshow(Igray);
title('Grayscale');

figure(2);
imhist(Igray);
BW = and(Igray < 164, Igray > 100); %you may change these thresholds
title('Image Histogram');
figure(3);
imshow(BW);
title('Binarization');

BW2 = bwmorph(BW,"majority");
figure(4);
imshow(BW2);
title('Morphological Operation')
SE = strel("disk",2);
figure(5);
BW3 = imopen(BW,SE);
imshow(BW3);;
title('imopen');
figure(6);
BW4 = imclose(BW,SE);
imshow(BW4);
title('imclose');
