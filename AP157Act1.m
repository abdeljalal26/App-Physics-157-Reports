%% sinusoid 2D

N = 500;
x = linspace(-2,2,N);
y = 2*sin(8*pi*x);

plot(x,y); % plots y as a function of x
title("2D Sinusoid")
xlabel("x-direction (cm)")
ylabel("y-direction (cm)")
axis equal
ylim([-2 2])


%% sinusoid (3D)

N = 500;
x = linspace(-2,2,N);
y = x;
[X,~] = meshgrid(x,y); % creates matrix of x by y
z = 2*sin(8*pi*X);
g = rescale(z,0,255); % rescales ranges from -/+ to 0 to 255
figure(2);
mesh(x,y,g); % plots 3D surface with height g
title("3D Sinusoid")
xlabel("x-direction (cm)")
ylabel("y-direction (cm)")
zlabel("Rescaled Range")

%% grating

M = 500;
a = linspace(-2,2,M);
b = a;
[A,~] = meshgrid(a,b); % creates matrix of a by b
c = sin(10*pi*A);
G = zeros(size(c));
G(c<0.1) = 1;
figure(1);
imshow(G); % 2D view of G
title("2D Grating")
figure(2);
mesh(a,b,G) % plots 3D surface with height G
title("3D Grating")
%% annulus(2D)

t = 0.1:0.1:2*pi;
x1 = 6*cos(t);
y1 = 6*sin(t);
x2 = 2*cos(t);
y2 = 2*sin(t);
pgon = polyshape({x1,x2},{y1,y2}); % sets two concentric circles
plot(pgon)
title("Annulus")
axis equal

%% annulus(3D)

q = linspace(0,2*pi,64);
p = linspace(1,3,16);
[T,R] = meshgrid(q,p); % creates matrix of q by p
Q = R.*cos(T);
P = R.*sin(T);
Z = Q.^2 - P.^2;
figure(1);
surf(Q,P,Z) % plots 3D surface with height Z
title("Hyperbolic Paraboloid with Central Hole")
c
%% hexagon array
hold on

% plots each hexagon in specific coordinates
for i = [-3 3]                 % hexagon x-coordinates
    for j = -1.745:1.745:1.745 % hexagon y-coordinates
    hex = nsidedpoly(6,'Center',[i j],'SideLength',1);
    plot(hex, "FaceColor", "[0.9290, 0.6940, 0.1250]");
    end
end

for i = [-1.5 1.5]                 % hexagon x-coordinates
    for j = linspace(-2.6,2.6,4)   % hexagon y-coordinates
    hex = nsidedpoly(6,'Center',[i j],'SideLength',1);
    plot(hex, "FaceColor", "[0.9290, 0.6940, 0.1250]");
    end
end

for j = [-3.49 -1.745 3.49 1.745]  % hexagon y-coordinates
    hex = nsidedpoly(6,'Center',[0 j],'SideLength',1);
    plot(hex, "FaceColor", "[0.9290, 0.6940, 0.1250]");
end

% plots outer circle
t = 0.1:0.1:2*pi;
x1 = 4.7*cos(t);
y1 = 4.7*sin(t);
x2 = 4.5*cos(t);
y2 = 4.5*sin(t);
pgon = polyshape({x1,x2},{y1,y2}); % sets two concentric circles
p2 = plot(pgon,"FaceColor", "k");

title("JWST Mirror Hexagon Array")

axis equal
%% Olympics

N = 1000;
angle = linspace(pi/4,9*pi/4,N);
% coordinating the circles
xb = cos(angle) * 0.9;
yb = sin(angle) * 0.9;
xy = cos(angle) * 0.9 + 1;
yy = sin(angle) * 0.9 - 1;
xk = cos(angle) * 0.9 + 2;
yk = sin(angle) * 0.9;
xg = cos(angle) * 0.9 + 3;
yg = sin(angle) * 0.9 - 1;
xr = cos(angle) * 0.9 + 4;
yr = sin(angle) * 0.9;

hold on
% plotting the circles
plot(xb(1:3*N/4),yb(1:3*N/4),'b','linewidth',6);
plot(xy(N/4:N),yy(N/4:N),'y','linewidth',6)

plot(xk(1:3*N/4),yk(1:3*N/4),'k','linewidth',6);
plot(xy(1:N/4),yy(1:N/4),'y','linewidth',6);
plot(xb(3*N/4:end),yb(3*N/4:end),'b','linewidth',6);

plot(xr(1:N/2),yr(1:N/2),'r','linewidth',6);
plot(xg(1:N),yg(1:N),'g','linewidth',6);

plot(xk(3*N/4:N),yk(3*N/4:N),'k','linewidth',6);
plot(xr(N/2:N),yr(N/2:N),'r','linewidth',6);

axis equal
title("Olympics")
xlim([-1.2 5.2])
set(h1,'Color',[1 1 1])
hold off

%% Creating colored images

N = 500;
x = linspace(-10,10,N);
y = x;
[X,Y] = meshgrid(x,y);
Rd = zeros(N,N);
Gn = Rd;
Bl = Rd;
% draw colored circles
Rt = 3;
RC = 4;
deg = 30;
xt = Rt*cosd(deg);
yt = Rt*sind(deg);
R = sqrt((X.^2) + (Y+Rt).^2);
Rd (find (R<RC)) = 1;
figure(1);
imshow(Rd);
R = sqrt((X-xt).^2 + (Y-yt).^2);
Gn (find(R<RC)) = 1;
figure(2);
imshow(Gn);
R = sqrt((X+xt).^2 + (Y-yt).^2);
Bl (find(R<RC)) = 1;
figure(3);
imshow(Bl);
I(:,:,1) = Rd;
I(:,:,2) = Gn;
I(:,:,3) = Bl;
figure;
image(I);
axis equal;

%% Histogram Backprojection
Igray = rgb2gray(imread('cat.jpg'));
imshow(Igray);
PDF = hist(Igray(:), 0:255)/numel(Igray);
CDF = cumsum(PDF);
figure;
plot(0:255, CDF);
x = 0:255;
desiredCDF = (1/255) * x;
newGS = interp1(desiredCDF, x, CDF(Igray(:)+1));
Igraynew = reshape(newGS, size(Igray));
figure;
imshow(uint8(Igraynew));

%% Contrast Enhancement

Original_Image = rgb2gray(imread('cat.jpg'));

% contrast stretching formula
Rold = double(Original_Image);
Rmin = double(min(Original_Image));
Pmin1 = prctile(Rmin, 10);
Rmax = double(max(Original_Image));
Pmax1 = prctile(Rmax, 10);
contrast = ((Rold - Pmin1)./(Pmax1 - Pmin1));

% Compare the Original and Contrast Stretched Image
figure(1);
imshow(Original_Image), title('Original Image');
figure(2);
imshow(contrast), title('Contrast Stretched Image');

% compare the histograms of the original and contrast streched images
PDF = hist(Original_Image(:), 0:255)/numel(Original_Image);
figure(3);
plot(0:255, PDF);

PDF = hist(contrast(:), 0:255)/numel(contrast);
figure(4);
plot(0:255, PDF);
xlim([0 10])


%% Restoring faded colored photographs - Contrast Stretching

Original_Image = imread("cat.jpg");

%Divide the image into RGB layers
R = Original_Image(:,:,1);
G = Original_Image(:,:,2);
B = Original_Image(:,:,3);

%Compare the Original Image and the Graylevel intensity of the RGB layers. 
figure(1);
imshow(Original_Image), title('Original Image')
figure(2);
imshow(R), title('Red')
figure(3);
imshow(G), title('Green')
figure(4);
imshow(B), title('Blue')

%Red Contrast Stretching
Rold = double(R);
Rmin = double(min(R));
Pmin1 = prctile(Rmin, 20);
Rmax = double(max(R));
Pmax1 = prctile(Rmax, 20);
Rcontrast = ((Rold - Pmin1)./(Pmax1 - Pmin1));

%Green Contrast Stretching
Gold = double(G);
Gmin = double(min(G));
Pmin2 = prctile(Gmin, 20);
Gmax = double(max(G));
Pmax2 = prctile(Gmax, 20);
Gcontrast = ((Rold - Pmin2)./(Pmax2 - Pmin2));

%Blue Contrast Stretching
Bold = double(B);
Bmin = double(min(B));
Pmin3 = prctile(Bmin, 20);
Bmax = double(max(B));
Pmax3 = prctile(Bmax, 20);
Bcontrast = ((Bold - Pmin3)./(Pmax3 - Pmin3));

%Put the Contrast Stretched RGB into the RGB layers of the new image. 
I_restored(:,:,1) = Rcontrast;
I_restored(:,:,2) = Gcontrast;
I_restored(:,:,3) = Bcontrast;

%Compare the Original and Contrast Stretched Image
figure(5);
imshow(I_restored), title('Contrast Stretched Image');

%Compare the histograms of the original and contrast streched images
PDF = hist(Original_Image(:), 0:255)/numel(Original_Image);
figure(6);
plot(0:255, PDF);

PDF = hist(I_restored(:), 0:255)/numel(I_restored);
figure(7);
plot(0:255, PDF);
xlim([0 10])

%% Restoring faded colored photographs - Gray World Algorithm

Original_Image = imread("cat.jpg");

%Divide the original image into its RGB layers.

R = Original_Image(:,:,1);
G = Original_Image(:,:,2);
B = Original_Image(:,:,3);
R_layer = double(R);
G_layer = double(G);
B_layer = double(B);

%Calculate for the average value of the red, green and blue channel. 
Rave = double(mean2(R_layer));
Bave = double(mean2(B_layer));
Gave = double(mean2(G_layer));

%To get the white balanced image, divide each RGB channel by the respective averages. 
Rwb = R_layer./Rave;
Gwb = G_layer./Gave;
Bwb = B_layer./Bave;

%Put the balanced RGB layers into the new image. 
Restored_Image(:,:,1) = Rwb;
Restored_Image(:,:,2) = Gwb;
Restored_Image(:,:,3) = Bwb;

figure(1);
imshow(Original_Image), title('Original Image');
figure(2);
imshow(Restored_Image*0.5), title('Restored Image');

%% Restoring faded colored photographs - White Patch Algorithm

Original_Image = imread("cat.jpg");

%Divide the original image into its RGB layers.
R = Original_Image(:,:,1);
G = Original_Image(:,:,2);
B = Original_Image(:,:,3);
R_orig = double(R);
G_orig = double(G);
B_orig = double(B);

%Crop a region of white patch in the original image
white_patch = imcrop(Original_Image);

%Divide the cropped white patch into it RGB layers
R_whitepatch = double(white_patch(:,:,1));
G_whitepatch = double(white_patch(:,:,2));
B_whitepatch = double(white_patch(:,:,3)); 

%Average the RGB of the white pixels to get R_whiteAve, G_whiteAve, B_whiteAve, separately
R_whiteAve = double(mean2(R_whitepatch));
G_whiteAve = double(mean2(G_whitepatch));
B_whiteAve = double(mean2(B_whitepatch));

%Divide each channel with the whole original image with the respective white averages from each channel
R_restored = R_orig./R_whiteAve;
G_restored = G_orig./G_whiteAve;
B_restored = B_orig./B_whiteAve;

%Put the balanced RGB layers into the new image I_restored.
I_restored(:,:,1) = R_restored;
I_restored(:,:,2) = G_restored;
I_restored(:,:,3) = B_restored;

%Show the difference of the Original and Balanced Image
figure(1);
imshow(Original_Image), title('Original Image');
figure(2);
imshow(I_restored), title('Enhanced');
