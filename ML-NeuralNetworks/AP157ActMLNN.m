%% Perceptron Classification

% Set the path to the dataset folder
datasetPath = 'C:\Users\abdel\OneDrive\Desktop\AppleBraeburn';

% Create an imageDatastore to load the dataset
imageData = imageDatastore(datasetPath, ...
    'IncludeSubfolders', true, 'LabelSource', 'foldernames');

% Split the dataset into training and validation sets
[trainData, valData] = splitEachLabel(imageData, 0.8, 'randomized');

% Define the layers of the neural network
layers = [
    imageInputLayer([100 100 3])
    convolution2dLayer(3, 32, 'Padding', 'same')
    reluLayer
    maxPooling2dLayer(2, 'Stride', 2)
    convolution2dLayer(3, 64, 'Padding', 'same')
    reluLayer
    maxPooling2dLayer(2, 'Stride', 2)
    fullyConnectedLayer(128)
    reluLayer
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer
];

% Set training options
options = trainingOptions('adam', ...
    'MiniBatchSize', 32, ...
    'MaxEpochs', 10, ...
    'ValidationData', valData, ...
    'ValidationFrequency', 30, ...
    'Plots', 'training-progress');

% Train the neural network
net = trainNetwork(trainData, layers, options);

%%

% Classify a test image
testImagePath = 'C:\Users\abdel\Downloads\archive\fruits-360_dataset\fruits-360\Test\Apple Crimson Snow\r_184_100.jpg';
testImage = imread(testImagePath);
testImage = imresize(testImage, [100 100]);  % Resize the image to match input size
predictedLabel = classify(net, testImage);

% Display the predicted label
disp('Predicted label:');
disp(predictedLabel);

figure;
imshow(testImagePath);
title(predictedLabel)


%% Function Training

% Generate input and target data
x = 0:0.1:2*pi;                 % Input data
y = log(x);                     % Target data

% Create a feedforward neural network
net = feedforwardnet(10);       % 10 neurons in the hidden layer

% Set up the training parameters
net.trainParam.epochs = 1000;               % Number of training epochs
net.trainParam.lr = 0.01;                   % Learning rate
net.trainParam.goal = 1e-5;                 % Training goal (minimum performance)
net.trainParam.showWindow = true;          % Disable the training window

% Set up the training data
trainData = [x; y];

% Train the network
net = train(net, trainData(1,:), trainData(2,:));

% Generate test data
xTest = 0:0.01:2*pi;            % Test input data
yTest = net(xTest);             % Test output data

% Plot the results
figure;
plot(x, y, 'b--', 'LineWidth', 2);   % Plot target data
hold on;
plot(xTest, yTest, 'r--');         % Plot network output
legend('Target', 'Network Output');
xlabel('x');
ylabel('y');
title('Logarithmic Function Approximation');
