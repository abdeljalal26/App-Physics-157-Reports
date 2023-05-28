%% Open image and convert to grayscale (BEADS)
orig_image = imread("beads.png");
gray_image = rgb2gray(orig_image);
figure(1);
subplot(1,2,1);
imshow(orig_image);
title('Original Image');
subplot(1,2,2);
imshow(gray_image);
title('Grayscale Image');

% binarization and histogram thresholding
figure(2);
imhist(gray_image);
title('Image Histogram');
axis auto
BW1 = and(gray_image > 150, gray_image < 256);
figure(3);
imshow(BW1);
title('Binarized Image');

% removing background particulates
BW2 = bwmorph(BW1,"majority");
figure(4);
imshow(BW2);
title('Morphologically Operated');
strucel = strel("disk",4);
figure(5);
BW3 = imopen(BW2,strucel);
imshow(BW3);
title('imopen(Erosion - Dilation)');

% calling regionprops to obtain features
BWL = bwlabel(BW3);
figure(6);
imagesc(BWL);
title('bwlabel(BW3)');
axis equal
colorbar
features = regionprops(BWL,"Area","BoundingBox","Centroid","Orientation","Solidity");

% determining object centroid
centroid = cat(1,features.Centroid);
figure(6);
hold on;
plot(centroid(:,1),centroid(:,2),'r+');
title('Object Centroid');

% numbering object centroid
figure(7);
imagesc(BWL);
title('Numbered Objects');
axis equal
hold on;
for i = 1:size(centroid,1)
    text(centroid(i,1), centroid(i,2), num2str(i));
end

% object boundary
figure(8);
imagesc(BWL);
title("Object Boundary");
hold on;
%plot(centroid(:,1),centroid(:,2),'r+');
axis equal
box = cat(1,features.BoundingBox);
for i = 1:size(features,1)
    rectangle('Position',box(i,:),'EdgeColor','r');
end

%% Open image and convert to grayscale (COINS)
orig_image = imread("coins.png");
gray_image = rgb2gray(orig_image);
figure(1);
subplot(1,2,1);
imshow(orig_image);
title('Original Image');
subplot(1,2,2);
imshow(gray_image);
title('Grayscale Image');

% binarization and histogram thresholding
figure(2);
imhist(gray_image);
title('Image Histogram');
axis auto
BW1 = and(gray_image > 143, gray_image < 256);
figure(3);
imshow(BW1);
title('Binarized Image');

% removing background particulates
BW2 = bwmorph(BW1,"majority");
figure(4);
imshow(BW2);
title('Morphologically Operated');
strucel = strel("disk",4);
figure(5);
BW3 = imopen(BW2,strucel);
imshow(BW3);
title('imopen(Erosion - Dilation)');
figure(6);
BW4 = imclose(BW3,strucel);
imshow(BW4);
title('imclose(Dilation - Erosion)');

% calling regionprops to obtain features
BWL = bwlabel(BW4);
figure(7);
imagesc(BWL);
title('bwlabel(BW4)');
axis equal
colorbar
features = regionprops(BWL,"Area","BoundingBox","Centroid","Orientation","Solidity");

% determining object centroid
centroid = cat(1,features.Centroid);
figure(7);
hold on;
plot(centroid(:,1),centroid(:,2),'r+');
title('Object Centroid');

% numbering object centroid
figure(8);
imagesc(BWL);
title('Numbered Objects');
axis equal
hold on;
for i = 1:size(centroid,1)
    text(centroid(i,1), centroid(i,2), num2str(i));
end

% object boundary
figure(9);
imagesc(BWL);
title("Object Boundary and Centroid");
hold on;
plot(centroid(:,1),centroid(:,2),'r+');
axis equal
box = cat(1,features.BoundingBox);
for i = 1:size(features,1)
    rectangle('Position',box(i,:),'EdgeColor','r');
end

%% Open image and convert to grayscale (DICE)
orig_image = imread("dice.png");
gray_image = rgb2gray(orig_image);
figure(1);
subplot(1,2,1);
imshow(orig_image);
title('Original Image');
subplot(1,2,2);
imshow(gray_image);
title('Grayscale Image');

% binarization and histogram thresholding
figure(2);
imhist(gray_image);
title('Image Histogram');
axis auto
BW1 = and(gray_image > 130, gray_image < 256);
figure(3);
imshow(BW1);
title('Binarized Image');

% removing background particulates
BW2 = bwmorph(BW1,"majority");
figure(4);
imshow(BW2);
title('Morphologically Operated');
strucel = strel("disk",5);
figure(5);
BW3 = imopen(BW2,strucel);
imshow(BW3);
title('imopen(Erosion - Dilation)');
figure(6);
BW4 = imclose(BW3,strucel);
imshow(BW4);
title('imclose(Dilation - Erosion)');

% calling regionprops to obtain features
BWL = bwlabel(BW4);
figure(7);
imagesc(BWL);
title('bwlabel(BW4)');
axis equal
colorbar
features = regionprops(BWL,"Area","BoundingBox","Centroid","Orientation","Solidity");

% determining object centroid
centroid = cat(1,features.Centroid);
figure(7);
hold on;
plot(centroid(:,1),centroid(:,2),'r+');
title('Object Centroid');

% numbering object centroid
figure(8);
imagesc(BWL);
title('Numbered Objects');
axis equal
hold on;
for i = 1:size(centroid,1)
    text(centroid(i,1), centroid(i,2), num2str(i));
end

% object boundary
figure(9);
imagesc(BWL);
title("Object Boundary and Centroid");
hold on;
plot(centroid(:,1),centroid(:,2),'r+');
axis equal
box = cat(1,features.BoundingBox);
for i = 1:size(features,1)
    rectangle('Position',box(i,:),'EdgeColor','r');
end

%% Open image and convert to grayscale (RICE)
orig_image = imread("rice.png");
gray_image = rgb2gray(orig_image);
figure(1);
subplot(1,2,1);
imshow(orig_image);
title('Original Image');
subplot(1,2,2);
imshow(gray_image);
title('Grayscale Image');

% binarization and histogram thresholding
figure(2);
imhist(gray_image);
title('Image Histogram');
axis auto
BW1 = and(gray_image > 143, gray_image < 256);
figure(3);
imshow(BW1);
title('Binarized Image');

% removing background particulates
BW2 = bwmorph(BW1,"majority");
figure(4);
imshow(BW2);
title('Morphologically Operated');
strucel = strel("disk",4);
figure(5);
BW3 = imopen(BW2,strucel);
imshow(BW3);
title('imopen(Erosion - Dilation)');

% calling regionprops to obtain features
BWL = bwlabel(BW3);
figure(6);
imagesc(BWL);
title('bwlabel(BW3)');
axis equal
colorbar
features = regionprops(BWL,"Area","BoundingBox","Centroid","Orientation","Solidity");

% determining object centroid
centroid = cat(1,features.Centroid);
figure(6);
hold on;
plot(centroid(:,1),centroid(:,2),'r+');
title('Object Centroid');

% numbering object centroid
figure(7);
imagesc(BWL);
title('Numbered Objects');
axis equal
hold on;
for i = 1:size(centroid,1)
    text(centroid(i,1), centroid(i,2), num2str(i));
end

% object boundary
figure(8);
imagesc(BWL);
title("Object Boundary");
hold on;
%plot(centroid(:,1),centroid(:,2),'r+');
axis equal
box = cat(1,features.BoundingBox);
for i = 1:size(features,1)
    rectangle('Position',box(i,:),'EdgeColor','r');
end

%% Open image and convert to grayscale (HUBBLE)
orig_image = imread("hubble.jpeg");
gray_image = rgb2gray(orig_image);
figure(1);
subplot(1,2,1);
imshow(orig_image);
title('Original Image');
subplot(1,2,2);
imshow(gray_image);
title('Grayscale Image');

% binarization and histogram thresholding
figure(2);
imhist(gray_image);
title('Image Histogram');
axis auto
BW1 = and(gray_image > 60, gray_image < 256);
figure(3);
imshow(BW1);
title('Binarized Image');

% removing background particulates
BW2 = bwmorph(BW1,"majority");
figure(4);
imshow(BW2);
title('Morphologically Operated');
strucel = strel("disk",4);
figure(5);
BW3 = imopen(BW2,strucel);
imshow(BW3);
title('imopen(Erosion - Dilation)');
figure(6);
BW4 = imclose(BW3,strucel);
imshow(BW4);
title('imclose(Dilation - Erosion)');

% calling regionprops to obtain features
BWL = bwlabel(BW4);
figure(7);
imagesc(BWL);
title('bwlabel(BW4)');
axis equal
colorbar
features = regionprops(BWL,"Area","BoundingBox","Centroid","Orientation","Solidity");

% determining object centroid
centroid = cat(1,features.Centroid);
figure(7);
hold on;
plot(centroid(:,1),centroid(:,2),'r+');
title('Object Centroid');

% numbering object centroid
figure(8);
imagesc(BWL);
title('Numbered Objects');
axis equal
hold on;
for i = 1:size(centroid,1)
    text(centroid(i,1), centroid(i,2), num2str(i));
end

% object boundary
figure(9);
imagesc(BWL);
title("Object Boundary");
hold on;
%plot(centroid(:,1),centroid(:,2),'r+');
axis equal
box = cat(1,features.BoundingBox);
for i = 1:size(features,1)
    rectangle('Position',box(i,:),'EdgeColor','r');
end