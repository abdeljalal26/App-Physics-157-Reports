%RGB of Unripe Mangoes 
rgb = zeros(8,3); 

for sample = 1:4 
    %Read the unripe images
    fruit =  imread('Unripe Mango ('+string(sample)+').jpg'); 
    fruit_gray = rgb2gray(fruit); 
    %Binarize and make a mask to cover the background
    fruit_binarized = ~imbinarize(fruit_gray);  
    %Isolate the fruit part
    just_fruit = fruit.*cast(fruit_binarized,"like",fruit); 
    
    %Isolate the red layer
    red_just_fruit = just_fruit(:,:,1); 
    %Calculate the mean of the non-zero red pixels 
    mask = logical(red_just_fruit ~= 0);
    meanRed = mean(red_just_fruit(mask))/255; 
    rgb(sample, 1) = meanRed; 

    %Isolate the green layer
    green_just_fruit = just_fruit(:,:,2); 
    %Calculate the mean of the non-zero green pixels 
    mask = logical(green_just_fruit ~= 0);
    meanGreen = mean(green_just_fruit(mask))/255; 
    rgb(sample, 2) = meanGreen; 

    %Isolate the blue layer
    blue_just_fruit = just_fruit(:,:,3); 
    %Calculate the mean of the non-zero blue pixels 
    mask = logical(blue_just_fruit ~= 0);
    meanBlue = mean(blue_just_fruit(mask))/255; 
    rgb(sample, 3) = meanBlue; 
end

%%

%RGB of Ripe Mangoes 
for sample = 1:4 
    %Read the unripe images
    fruit =  imread('Ripe Mango ('+string(sample)+').jpg'); 
    fruit_gray = rgb2gray(fruit); 
    %Binarize and make a mask to cover the background
    fruit_binarized = ~imbinarize(fruit_gray);  
    %Isolate the fruit part
    just_fruit = fruit.*cast(fruit_binarized,"like",fruit); 
    
    %Isolate the red layer
    red_just_fruit = just_fruit(:,:,1); 
    %Calculate the mean of the non-zero red pixels 
    mask = logical(red_just_fruit ~= 0);
    meanRed = mean(red_just_fruit(mask))/255; 
    rgb(sample+4, 1) = meanRed; 

    %Isolate the green layer
    green_just_fruit = just_fruit(:,:,2); 
    %Calculate the mean of the non-zero green pixels 
    mask = logical(green_just_fruit ~= 0);
    meanGreen = mean(green_just_fruit(mask))/255; 
    rgb(sample+4, 2) = meanGreen; 

    %Isolate the blue layer
    blue_just_fruit = just_fruit(:,:,3); 
    %Calculate the mean of the non-zero blue pixels 
    mask = logical(blue_just_fruit ~= 0);
    meanBlue = mean(blue_just_fruit(mask))/255; 
    rgb(sample+4, 3) = meanBlue; 
end 

%%

%Combine the data 
Bias = ones(8,1); 
Ripeness_Label = zeros(8, 1);
Ripeness_Label(1:4) = 0; %Unripe
Ripeness_Label(5:8) = 1; %Ripe 

%Concatenate all data 
Mango_Properties = [Bias rgb Ripeness_Label]; 

save("Mango_Properties.mat","Mango_Properties","-mat"); 

%%

% For Report Visualization Only

fruit =  imread('Mango (3).jpg');
imagesc(fruit); axis off; 
fruit_gray = rgb2gray(fruit); 
%Binarize and make a mask to cover the background
fruit_binarized = ~imbinarize(fruit_gray);  
%Isolate the fruit part
just_fruit = fruit.*cast(fruit_binarized,"like",fruit); 
imagesc(just_fruit); axis off; 

channel = just_fruit(:,:,3); 
all_black_layer = zeros(size(fruit, 1), size(fruit, 2), 'uint8');
recombined_layers = cat(3, all_black_layer, all_black_layer, channel); 
imagesc(recombined_layers); axis off;

%%

% Load the Extracted Features of the Mango Data
load("Mango_Properties.mat");

% Initialize the perceptron weights
w = rand(4, 1)*0.01; % Initialize weights with small random values close to zero

% Set the learning rate and number of epochs
learning_rate = 0.01;
num_epochs = 10000; 

% Training loop
for epoch = 1:num_epochs
    % Iterate over each training example
    for i = 1:size(Mango_Properties, 1)
        % Compute the activation
        activation = dot(Mango_Properties(i, 1:4), w);
        
        % Apply the activation function (Sigmoid function)
        output = sigmoid(activation); 
        
        % Calculate the weight change
        delta_weight_change = learning_rate * (Mango_Properties(i, 5) - output) * Mango_Properties(i, 1:4)';
        
        % Update the weights
        w = w + delta_weight_change;
    end
end 

%%

%--Testing the Perceptron 
%Read a random fruit from the combined folder
sample = randi([1, 6]); 
%sample = 6; 
fruit =  imread('Mango ('+string(sample)+').jpg'); 
imshow(fruit); 

%Get RGB of the Mango
fruit_gray = rgb2gray(fruit); 
%Binarize and make a mask to cover the background
fruit_binarized = ~imbinarize(fruit_gray);  
%Isolate the fruit part
just_fruit = fruit.*cast(fruit_binarized,"like",fruit); 

%Isolate the red layer
red_just_fruit = just_fruit(:,:,1); 
%Calculate the mean of the non-zero red pixels 
mask = logical(red_just_fruit ~= 0);
meanRed = mean(red_just_fruit(mask))/255; 

%Isolate the green layer
green_just_fruit = just_fruit(:,:,2); 
%Calculate the mean of the non-zero green pixels 
mask = logical(green_just_fruit ~= 0);
meanGreen = mean(green_just_fruit(mask))/255; 

%Isolate the blue layer
blue_just_fruit = just_fruit(:,:,3); 
%Calculate the mean of the non-zero blue pixels 
mask = logical(blue_just_fruit ~= 0);
meanBlue = mean(blue_just_fruit(mask))/255; 

title('Mango mean RGB = [' + string(round(meanRed,2)) + ", " + string(round(meanGreen,2)) + ", " + string(round(meanBlue,2)) +"]"); 

%Combine the properties 
Unknown_Fruit_Properties = [1 meanRed meanGreen meanBlue]; 

%Solve for the dot product
neuron_dot = dot(Unknown_Fruit_Properties, w);
% Apply the activation function (Sigmoid function)
neuron_test = sigmoid(neuron_dot);
xlabel("This Mango is " + string(round(neuron_test*100)) +"% Ripe"); 

%%

function g = sigmoid(z)
    g = 1 ./ (1 + exp(-z));
end