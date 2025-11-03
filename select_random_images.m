% select_random_images.m
% This script randomly selects 155 image files from a folder of 11076 files

% --- User settings ---
srcFolder = 'Hands';     % Folder containing all 11076 images
dstFolder = 'input_images_real';   % Folder to save the selected 155 images
numImages = 155;                          % Number of random images to select

% --- Make sure the destination folder exists ---
if ~exist(dstFolder, 'dir')
    mkdir(dstFolder);
end

% --- Get list of image files ---
imgExtensions = {'*.jpg', '*.jpeg', '*.png', '*.bmp', '*.tif', '*.tiff'};
allFiles = [];

for i = 1:numel(imgExtensions)
    allFiles = [allFiles; dir(fullfile(srcFolder, imgExtensions{i}))];
end

numFiles = numel(allFiles);
fprintf('Found %d image files in folder.\n', numFiles);

% --- Safety check ---
if numFiles < numImages
    error('Not enough images in folder to select %d files.', numImages);
end

% --- Random selection ---
randIdx = randperm(numFiles, numImages);
selectedFiles = allFiles(randIdx);

% --- Copy selected files to destination folder ---
for i = 1:numImages
    srcFile = fullfile(selectedFiles(i).folder, selectedFiles(i).name);
    dstFile = fullfile(dstFolder, selectedFiles(i).name);
    copyfile(srcFile, dstFile);
end

fprintf('Successfully copied %d random images to:\n%s\n', numImages, dstFolder);
