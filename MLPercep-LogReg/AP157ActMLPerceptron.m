%Eccentricity of Red Apple and Yellow Banana
ecc = zeros(100, 1); 
for sample = 1:50
    fruit =  rgb2gray(imread('ban'+string(sample)+'.jpg')); 
    
    bifruit = ~imbinarize(fruit); 
    bifruit = imfill(bifruit,'holes'); 
    
    %No need to label if only 1 object
    props = regionprops(bifruit,"Eccentricity");

    ecc(sample) = props.Eccentricity; 
end
for sample = 1:50
    fruit = rgb2gray(imread('ap'+string(sample)+'.jpg')); 
    
    bifruit = ~imbinarize(fruit); 
    bifruit = imfill(bifruit,'holes'); 
    
    %No need to label if only 1 object
    props = regionprops(bifruit,"Eccentricity");

    ecc(50+sample) = props.Eccentricity; 
end

%%

%Greenness of Apple and Banana
greenness = zeros(100, 1); 

for sample = 1:50
    %Read the image
    fruit =  imread('ban'+string(sample)+'.jpg'); 
    %Binarize
    bifruit = ~imbinarize(fruit);  
    %Isolate the fruit part
    just_fruit = fruit.*cast(bifruit,"like",fruit); 
    %Only consider the green layer
    green_just_fruit = just_fruit(:,:,2); 
    %Calculate the man of the non-zero pixels 
    mask = logical(green_just_fruit ~= 0);
    meanValue = mean(green_just_fruit(mask)); 
    greenness(sample) = meanValue; 
end

for sample = 1:50
    %Read the image
    fruit = imread('ap'+string(sample)+'.jpg'); 
    %Binarize
    bifruit = ~imbinarize(fruit);  
    %Isolate the fruit part
    just_fruit = fruit.*cast(bifruit,"like",fruit); 
    %Only consider the green layer
    green_just_fruit = just_fruit(:,:,2); 
    %Calculate the man of the non-zero pixels 
    mask = logical(green_just_fruit ~= 0);
    meanValue = mean(green_just_fruit(mask)); 
    greenness(50+sample) = meanValue; 
end

%%

%Combine the data 
Bias = ones(100,1); 
Fruit_Label = zeros(100, 1);
Fruit_Label(1:50) = 1; %Banana
Fruit_Label(51:100) = -1; %Apple 

%Concatenate all data 
Fruit_Properties = [Bias ecc greenness Fruit_Label]; 

save("Fruit_Properties.mat","Fruit_Properties","-mat");

%%

% Load the Extracted Features of the Fruit Data
load("Fruit_Properties.mat");

% Initialize the perceptron weights
w = rand(3, 1) * 0.01; % Initialize weights with small random values close to zero

% Set the learning rate and number of epochs
learning_rate = 0.01;
num_epochs = 15000;

% Training loop
for epoch = 1:num_epochs
    % Iterate over each training example
    for i = 1:size(Fruit_Properties, 1)
        % Compute the activation
        activation = dot(Fruit_Properties(i, 1:3), w);
        
        % Apply the activation function (Step function)
        if activation >= 0
            output = 1;
        else
            output = -1;
        end
        
        % Calculate the weight change
        delta_weight_change = learning_rate * (Fruit_Properties(i, 4) - output) * Fruit_Properties(i, 1:3)';
        
        % Update the weights
        w = w + delta_weight_change;
    end
end 

%%

% Plot the data points and decision boundary
figure;
gscatter(Fruit_Properties(:, 2), Fruit_Properties(:, 3), Fruit_Properties(:,4),'ry');
hold on; 
xlabel('Eccentricity');
ylabel('Greenness'); 
title('Apple ? Banana');
axis 'auto xy'; 
slope = -(w(2)./w(3));
y_intercept = -(w(1)./w(3)); 
xLine = linspace(min(Fruit_Properties(:,2)),max(Fruit_Properties(:,2)),100); 
yLine = slope * xLine + y_intercept;
plot(xLine, yLine, 'k-', 'LineWidth', 2); 
legend('Banana', 'Apple', 'Decision Line'); 
hold off;

%%

%--Testing the Perceptron 
%Read a random fruit from the combined folder
sample = randi([1, 130]);
fruit =  imread(string(sample)+'.jpg'); 
imshow(fruit); title('Sample ' + string(sample)); 

%Get the eccentricity
gray_fruit = rgb2gray(fruit);
bifruit = ~imbinarize(gray_fruit); 
bifruit = imfill(bifruit,'holes'); 
%No need to label if only 1 object
props = regionprops(bifruit,"Eccentricity");
fruit_eccentricity = props.Eccentricity; 

%Get the level of Greenness 
fruit_binarizing_mask = ~imbinarize(fruit);  
%Isolate the fruit part
just_fruit = fruit.*cast(fruit_binarizing_mask,"like",fruit); 
%Only consider the green layer
green_just_fruit = just_fruit(:,:,2); 
%Calculate the man of the non-zero pixels 
mask = logical(green_just_fruit ~= 0);
meanValue = mean(green_just_fruit(mask));
fruit_greenness = meanValue; 

%Combine the properties
Unknown_Fruit_Properties = [1 fruit_eccentricity fruit_greenness]; 

%Solve for the dot product
neuron_dot = dot(Unknown_Fruit_Properties, w);
% Apply the activation function (Step function)
if neuron_dot >= 0
    xlabel("Banana");
else
    xlabel("Apple");
end 
