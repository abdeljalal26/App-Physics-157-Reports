%% Grayscale thresholding

% image upload and grayscale
note = imread("einstein2.jpeg");
note_gray = im2gray(note);

% display image
figure(1);
subplot(2,1,1);
imshow(note);
title("Original");
subplot(2,1,2);
imshow(note_gray);
title("Grayscale");

% image histogram
[count,cells] = imhist(note_gray,256);
min = 150;
max = 210;
figure(2);
plot(cells,count);
title("Image Histogram");
xlabel("Bins");
ylabel("Frequency");
xline(min,'--r','Min');
xline(max,'--r','Max');

% setting of region of interest and segmentation display
min = 150;
max = 210;
ROI = (note_gray > min) & (note_gray < max);
figure(3);
imshow(~ROI);
title("Segmented Image");

%% RGB thresholding

% image upload and grayscale
carina = imread("carina.jpg");
figure(1);
subplot(2,1,1);
imshow(carina);
title("RGB");
subplot(2,1,2);
imshow(im2gray(carina));
title("Grayscale");

% RGB channel separation and histogram
R = carina(:,:,1);
G = carina(:,:,2);
B = carina(:,:,3);
[Rcount,Rcells] = imhist(R,256);
[Gcount,Gcells] = imhist(G,256);
[Bcount,Bcells] = imhist(B,256);

% R channel histogram display
figure(2);
plot(Rcells,Rcount);
title("R Channel Image Histogram");
xlabel("Bins");
ylabel("Frequency");

% R channel setting of region of interest and segmentation display
Rthresh = R < 125;
figure(3);
subplot(2,1,1);
imshow(R);
title("R Channel")
subplot(2,1,2);
imshow(~Rthresh);
title("Segmented R Image");

% G channel histogram display
figure(4);
plot(Gcells,Gcount);
title("G Channel Image Histogram");
xlabel("Bins");
ylabel("Frequency");

% G channel setting of region of interest and segmentation display
Gthresh = G < 125;
figure(5);
subplot(2,1,1);
imshow(G);
title("G Channel")
subplot(2,1,2);
imshow(~Gthresh);
title("Segmented G Image");

% B channel histogram display
figure(6);
plot(Bcells,Bcount);
title("B Channel Image Histogram");
xlabel("Bins");
ylabel("Frequency");

% B channel setting of region of interest and segmentation display
Bthresh = B < 125;
figure(7);
subplot(2,1,1);
imshow(B);
title("B Channel")
subplot(2,1,2);
imshow(~Bthresh);
title("Segmented B Image");

%% histogram (from Maam Jing)

BINS = 32;
J = imread("Gretag-Macbeth_ColorChecker.jpeg");
go_on = 'y';
while go_on == 'y'
    figure(1);
    I = imcrop(J);
    I = double(I);
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);
    Int = R + G + B;
    Int(find(Int == 0)) = 100000;
    r = R./Int;
    g = G./Int;
    rint = round(r*(BINS - 1) + 1);
    gint = round(g*(BINS - 1) + 1);
    colors = gint(:) + (rint(:) - 1)*BINS;
    hist = zeros(BINS,BINS);
    for row = 1:BINS
        for col = 1:(BINS - row + 1)
            hist(row,col) = length(find(colors == (((col + (row - 1)*BINS)))));
        end
    end
    figure(2);
    imagesc(imrotate((hist),90));
    colormap jet;
    go_on = input("Again? y/n","s");
    if go_on == 'n'
        break
    end
end

%% Histogram Backprojection Script
% MSoriano 2022
% Open an image and crop a region of interest

clear all ; close all;
BINS = 32;
[filename,pathname] = uigetfile('Gretag-Macbeth_ColorChecker.jpeg');
J = imread([pathname,filename]);
[I, rect] = imcrop(J);

J = double(J);
R = J(:,:,1); G = J(:,:,2); B = J(:,:,3);
Int= R + G + B;
Int(find(Int==0))=100000; %to prevent NaNs
rJ = R./ Int; gJ = G./Int;

%% Crop the region of interest in the rg space
     
r = imcrop(rJ, rect);
g = imcrop(gJ, rect);
rint = round( r*(BINS-1) + 1);
gint = round (g*(BINS-1) + 1);
colors = gint(:) + (rint(:)-1)*BINS;
    
%% Compute rg-histogram
% This is the 1-d version of a 2-d histogram
hist = zeros(BINS*BINS,1);
for row = 1:BINS
    for col = 1:(BINS-row+1)
        hist(col+(row-1)*BINS) = length(find(colors==(((col+(row-1)*BINS)))));
    end
end

%% Backproject histogram
rJint = round( rJ*(BINS-1) + 1);
gJint = round (gJ*(BINS-1) + 1);
colorsJ = gJint(:) + (rJint(:)-1)*BINS;
HB = hist(colorsJ);
HBImage = reshape(HB,size(J,[1,2]));
figure (2); imagesc(HBImage); 
colormap (gray);

%% Parametric

clear;close;
I = im2double(imread('naturergb.jpeg'));
origR = double(I(:,:,1));
origG = double(I(:,:,2));
origB = double(I(:,:,3));  
[NCC_orig_r, NCC_orig_g] = NCC(origR,origG,origB);

C = im2double(imcrop(I));
CR = double(C(:,:,1));
CG = double(C(:,:,2));
CB = double(C(:,:,3));

[NCC_C_r, NCC_C_g] = NCC(CR,CG,CB);

imshow(PDF(NCC_orig_r, NCC_C_r, NCC_orig_g, NCC_C_g));

function jointpdf = PDF(imager,croppedr, imageg, croppedg)
    mean_r = mean2(croppedr);
    mean_g = mean2(croppedg);
    std_r = std2(croppedr);
    std_g = std2(croppedg);
    pdf_r = (1/(std_r*sqrt(2*pi))) * (exp(-(((imager-mean_r).^2)/(2*(std_r).^2))));
    pdf_g = (1/(std_g*sqrt(2*pi))) * (exp(-(((imageg-mean_g).^2)/(2*(std_g).^2))));
    jointpdf = pdf_r .* pdf_g;
end
function [r,g] = NCC(R, G, B)
    I = R + G + B; 

    I(I==0) = 1e5;

    r = R./I;
    g = G./I;
end