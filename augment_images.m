% augment_images_numbered.m
% Loads all JPG and PNG images from an input folder,
% rotates (90°, 180°, 270°) and flips (horizontal & vertical) each image,
% saves all versions as sequentially numbered JPGs (01.jpg, 02.jpg, etc.)
% in the output folder.

% === USER SETTINGS ===
inputFolder = 'hand-data/test/real';      % Folder with source images
outputFolder = 'hand-data/test2/real'; % Folder to save outputs

% Create output folder if it doesn't exist
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Get all image files (JPG + PNG)
imageFiles = [dir(fullfile(inputFolder, '*.jpg')); ...
              dir(fullfile(inputFolder, '*.png'))];

% Initialize counter for filenames
imgCounter = 1;

% Process each image
for i = 1:length(imageFiles)
    % Read current image
    fileName = imageFiles(i).name;
    filePath = fullfile(inputFolder, fileName);
    img = imread(filePath);

    % === Save original image ===
    outName = sprintf('%02d.jpg', imgCounter);
    imwrite(img, fullfile(outputFolder, outName), 'jpg');
    imgCounter = imgCounter + 1;

    % % === ROTATIONS (90°, 180°, 270°) ===
    % rotationAngles = [90, 180, 270];
    % for a = 1:length(rotationAngles)
    %     rotatedImg = imrotate(img, rotationAngles(a));
    %     outName = sprintf('%02d.jpg', imgCounter);
    %     imwrite(rotatedImg, fullfile(outputFolder, outName), 'jpg');
    %     imgCounter = imgCounter + 1;
    % end
    % 
    % % === FLIPS (horizontal & vertical) ===
    % flippedH = flip(img, 2); % Horizontal
    % flippedV = flip(img, 1); % Vertical
    % 
    % outName = sprintf('%02d.jpg', imgCounter);
    % imwrite(flippedH, fullfile(outputFolder, outName), 'jpg');
    % imgCounter = imgCounter + 1;
    % 
    % outName = sprintf('%02d.jpg', imgCounter);
    % imwrite(flippedV, fullfile(outputFolder, outName), 'jpg');
    % imgCounter = imgCounter + 1;

    % Print progress
    fprintf('Processed %s (%d of %d)\n', fileName, i, length(imageFiles));
end
