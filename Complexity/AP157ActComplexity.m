%% Elementary Cellular Automata

% set the rule
rule = 110;

% set the number of generations/timesteps
generation = 150;

% convert decimal rule to binary
ruleset = (int2bit(rule,8,0))';

% set the grid
grid = zeros(151,301);
grid(1,151) = 1;

% grid = randi([0 1], 151, 301);

% loop of generation/timestep
for i = 1:generation
% loop of assigning value to next generation
    for j = 2:300
        if grid(i,j-1:j+1) == [0 0 0]
            grid(i+1,j) = ruleset(1);
        elseif grid(i,j-1:j+1) == [0 0 1]
            grid(i+1,j) = ruleset(2);
        elseif grid(i,j-1:j+1) == [0 1 0]
            grid(i+1,j) = ruleset(3);
        elseif grid(i,j-1:j+1) == [0 1 1]
            grid(i+1,j) = ruleset(4);
        elseif grid(i,j-1:j+1) == [1 0 0]
            grid(i+1,j) = ruleset(5);
        elseif grid(i,j-1:j+1) == [1 0 1]
            grid(i+1,j) = ruleset(6);
        elseif grid(i,j-1:j+1) == [1 1 0]
            grid(i+1,j) = ruleset(7);
        else
            grid(i+1,j) = ruleset(8);
        end
    end
end

figure(1);
imagesc(grid);
axis image
axis off
title("Cellular Automata: Rule "+ rule );

%% Elementary Cellular Automata (Real Time Generation)

% set the rule
rule = 110;

% set the number of generations/timesteps
generation = 150;

% convert decimal rule to binary
ruleset = (int2bit(rule,8,0))';

% set the grid
grid = zeros(151,301);
grid(1,151) = 1;

% loop of generation/timestep
for i = 1:generation
    imagesc(grid);   % display grid
    title(['CA Rule ' num2str(rule)]);
    axis image
    axis off
    drawnow;
    nextGrid = grid;

% loop of assigning value to next generation
    for j = 2:300
        if grid(i,j-1:j+1) == [0 0 0]
            nextGrid(i+1,j) = ruleset(1);
        elseif grid(i,j-1:j+1) == [0 0 1]
            nextGrid(i+1,j) = ruleset(2);
        elseif grid(i,j-1:j+1) == [0 1 0]
            nextGrid(i+1,j) = ruleset(3);
        elseif grid(i,j-1:j+1) == [0 1 1]
            nextGrid(i+1,j) = ruleset(4);
        elseif grid(i,j-1:j+1) == [1 0 0]
            nextGrid(i+1,j) = ruleset(5);
        elseif grid(i,j-1:j+1) == [1 0 1]
            nextGrid(i+1,j) = ruleset(6);
        elseif grid(i,j-1:j+1) == [1 1 0]
            nextGrid(i+1,j) = ruleset(7);
        else
            nextGrid(i+1,j) = ruleset(8);
        end
    end
    grid = nextGrid;    
end

%% Game of Life - Cellular Automaton

% set the grid size
gridSize = 100;

% set the number of generations/timesteps
numGenerations = 2000;

% randomized grid with binary values
grid = randi([0, 1], gridSize, gridSize);

% GRIDS WITH FAMOUS INITIAL STATES/SHAPES
% glider
% grid = zeros(100);
% grid(90,91:93) = 1;
% grid(91,91) = 1;
% grid(92,92) = 1;

% lightweight spaceship
% grid = zeros(gridSize);
% grid(91:93,91) = 1;
% grid(93,92:94) = 1;
% grid(90,92) = 1;
% grid(90,95) = 1;
% grid(92,95) = 1;

% pi heptomino
% grid = zeros(gridSize);
% grid(51:53,51) = 1;
% grid(51,52) = 1;
% grid(51:53,53) = 1;

% quad
% grid = zeros(gridSize);
% grid(51,51:52) = 1;
% grid(51,55:56) = 1;
% grid(56,51:52) = 1;
% grid(56,55:56) = 1;
% grid(52,51) = 1;
% grid(52,56) = 1;
% grid(55,51) = 1;
% grid(55,56) = 1;
% grid(53,52) = 1;
% grid(52,54) = 1;
% grid(55,53) = 1;
% grid(54,55) = 1;

figure;

% loop of generation
for generation = 1:numGenerations
    % display of current generation
    imagesc(grid);
    title(['Generation: ' num2str(generation)]);
    drawnow;
    pause(0.0001);
    nextGrid = grid;
    
    % implement rules of game of life
    for i = 1:gridSize
        for j = 1:gridSize
            numNeighbors = sum(sum(grid(max(i-1,1):min(i+1,gridSize), max(j-1,1):min(j+1,gridSize)))) - grid(i, j);
            if grid(i, j) == 1 % Cell is alive
                if numNeighbors < 2 || numNeighbors > 3
                    nextGrid(i, j) = 0; % Cell dies
                end
            else % Cell is dead
                if numNeighbors == 3
                    nextGrid(i, j) = 1; % Cell becomes alive
                end
            end
        end
    end    
    % update grid for next generation
    grid = nextGrid;    
end
