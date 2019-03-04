clc
clear

%this program does tophat background subtraction and is ideally suited to
%low-signal high-background staining like GFAP and IBA1.  It plots %area to excel files,
%but does not currently count cells (cluster counting could be added later)

%creating blank matrices to fill with data later on
areaMatrix149QQ = zeros(40,1);
areaMatrix149RR = zeros(40,1);
areaMatrix2QQ = zeros(40,1);
areaMatrix2RR = zeros(40,1);
%blank matrices for mouse ID#s
stringMatrix149QQ = strings(40,1);
stringMatrix149RR = strings(40,1);
stringMatrix2QQ = strings(40,1);
stringMatrix2RR = strings(40,1);

avgLevel = 0.5; %defines lower threshold, keep between 0.05 and 0.2
se = strel('disk', 40); %defines cluster size, keep between 10 and 50

%source files of original tifs for processing
myFolder149QQ = 'C:\Users\Kitty\Documents\MATLAB\GP_MCTX_EXP1\ORIGINAL_TIF\149QQ';
myFolder149RR = 'C:\Users\Kitty\Documents\MATLAB\GP_MCTX_EXP1\ORIGINAL_TIF\149RR';
myFolder2QQ = 'C:\Users\Kitty\Documents\MATLAB\GP_MCTX_EXP1\ORIGINAL_TIF\2QQ';
myFolder2RR = 'C:\Users\Kitty\Documents\MATLAB\GP_MCTX_EXP1\ORIGINAL_TIF\2RR';

%filepaths for writing montaged images
myFolder149QQproc = 'C:\Users\Kitty\Documents\MATLAB\GP_MCTX_EXP1\TOPHAT\149QQ';
myFolder149RRproc = 'C:\Users\Kitty\Documents\MATLAB\GP_MCTX_EXP1\TOPHAT\149RR';
myFolder2QQproc = 'C:\Users\Kitty\Documents\MATLAB\GP_MCTX_EXP1\TOPHAT\2QQ';
myFolder2RRproc = 'C:\Users\Kitty\Documents\MATLAB\GP_MCTX_EXP1\TOPHAT\2RR';
    

filePattern = fullfile(myFolder149QQ, '*.tif');
theFiles = dir(filePattern);
    %run through each file individually
    for k = 1:length(theFiles)
                baseFileName = theFiles(k).name;
                fullFileName = fullfile(myFolder149QQ, baseFileName);
                %separates green channel and reduces red/green to black
                myimage = imread(fullFileName);
                red = myimage(:,:,1);
                blue = myimage(:,:,3);
                myimage = myimage(:,:,2);
                myimage = cat(3,red,myimage,red);
                original = myimage;
                %tophat filtering
                imageforproc = rgb2gray(myimage);
                tophatFiltered = imtophat(imageforproc,se);
                level = graythresh(imageforproc);
                if level >= avgLevel
                    BW = imbinarize(tophatFiltered, level);
                else
                    BW = imbinarize(tophatFiltered, avgLevel);
                end
                %calculates percent area of pixels=1, puts in vector
                area = 100*(numel(find(BW==1)))/(numel(BW));
                areaMatrix149QQ(k,1) = area;
                %montaging images and writing them to a new folder
                baseFileName = theFiles(k).name;
                fullFileName = fullfile(myFolder149QQproc, baseFileName);
                imshowpair(original, BW, 'montage');
                saveas(gcf, fullFileName, 'tif');
                [filepath,name,ext] = fileparts(baseFileName);
                name = name(1:4);
                name = string(name);
                stringMatrix149QQ(k,1) = name;

    end
    

filePattern = fullfile(myFolder149RR, '*.tif');
theFiles = dir(filePattern);
    %run through each file individually  
    for k = 1:length(theFiles)
                baseFileName = theFiles(k).name;
                fullFileName = fullfile(myFolder149RR, baseFileName);
                %separates green channel and reduces red/green to black
                myimage = imread(fullFileName);
                red = myimage(:,:,1);
                blue = myimage(:,:,3);
                myimage = myimage(:,:,2);
                myimage = cat(3,red,myimage,red);
                original = myimage;
                %tophat filtering
                imageforproc = rgb2gray(myimage);
                tophatFiltered = imtophat(imageforproc,se);
                level = graythresh(imageforproc);
                if level >= avgLevel
                    BW = imbinarize(tophatFiltered, level);
                else
                    BW = imbinarize(tophatFiltered, avgLevel);
                end
                area = 100*(numel(find(BW==1)))/(numel(BW));
                areaMatrix149RR(k,1) = area;
                %montaging images and writing them to a new folder
                baseFileName = theFiles(k).name;
                fullFileName = fullfile(myFolder149RRproc, baseFileName);
                imshowpair(original, BW, 'montage');
                saveas(gcf, fullFileName, 'tif');
                [filepath,name,ext] = fileparts(baseFileName);
                name = name(1:4);
                name = string(name);
                stringMatrix149RR(k,1) = name;

    end
    

filePattern = fullfile(myFolder2QQ, '*.tif');
theFiles = dir(filePattern);
    %run through each file individually  
    for k = 1:length(theFiles)
                baseFileName = theFiles(k).name;
                fullFileName = fullfile(myFolder2QQ, baseFileName);
                %separates green channel and reduces red/green to black
                myimage = imread(fullFileName);
                red = myimage(:,:,1);
                blue = myimage(:,:,3);
                myimage = myimage(:,:,2);
                myimage = cat(3,red,myimage,red);
                original = myimage;
                %tophat filtering
                imageforproc = rgb2gray(myimage);
                tophatFiltered = imtophat(imageforproc,se);
                level = graythresh(imageforproc);
                if level >= avgLevel
                    BW = imbinarize(tophatFiltered, level);
                else
                    BW = imbinarize(tophatFiltered, avgLevel);
                end
                area = 100*(numel(find(BW==1)))/(numel(BW));
                areaMatrix2QQ(k,1) = area;
                %montaging images and writing them to a new folder
                baseFileName = theFiles(k).name;
                fullFileName = fullfile(myFolder2QQproc, baseFileName);
                imshowpair(original, BW, 'montage');
                saveas(gcf, fullFileName, 'tif');
               [filepath,name,ext] = fileparts(baseFileName);
                name = name(1:4);
                name = string(name);
                stringMatrix2QQ(k,1) = name;

    end
    
    

filePattern = fullfile(myFolder2RR, '*.tif');
theFiles = dir(filePattern);
    %run through each file individually  
    for k = 1:length(theFiles)
                baseFileName = theFiles(k).name;
                fullFileName = fullfile(myFolder2RR, baseFileName);
                %separates green channel and reduces red/green to black
                myimage = imread(fullFileName);
                red = myimage(:,:,1);
                blue = myimage(:,:,3);
                myimage = myimage(:,:,2);
                myimage = cat(3,red,myimage,red);
                original = myimage;
                %tophat filtering
                imageforproc = rgb2gray(myimage);
                tophatFiltered = imtophat(imageforproc,se);
                level = graythresh(imageforproc);
                if level >= avgLevel
                    BW = imbinarize(tophatFiltered, level);
                else
                    BW = imbinarize(tophatFiltered, avgLevel);
                end
                area = 100*(numel(find(BW==1)))/(numel(BW));
                areaMatrix2RR(k,1) = area;
                %montaging images and writing them to a new folder
                baseFileName = theFiles(k).name;
                fullFileName = fullfile(myFolder2RRproc, baseFileName);
                imshowpair(original, BW, 'montage');
                saveas(gcf, fullFileName, 'tif');
                [filepath,name,ext] = fileparts(baseFileName);
                name = name(1:4);
                name = string(name);
                stringMatrix2RR(k,1) = name;

    end

totalAreaMatrix = [stringMatrix2QQ, areaMatrix2QQ, stringMatrix2RR, areaMatrix2RR, stringMatrix149QQ, areaMatrix149QQ, stringMatrix149RR, areaMatrix149RR];
xlswrite('tophatArea_GP_MCTX_EXP1.xlsx',totalAreaMatrix);
