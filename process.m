%{
% will be used later for faster h,w calculations
ratio = 3000 / 1790;
scale = 2;
h = r * 10 * scale;
w = 1 * 10 * scale
%}
h = 20;
w =  34;
filelist = readdir("pictures");
imglist = [];
y = [];
% keeps track of index because i will include extra files
j = 1;
for i = 1:size(filelist,1)
  if (regexp(filelist{i},"(\\.jpg)"))
    img = imread(["pictures/" filelist{i}]);
    img = rgb2gray(img);
    img = imresize(img, [h, w]);
    %imshow(img);
    imglist(j,:) = img(:);
    % get the class of the img from file name
    y(j,1) = str2num(strsplit(filelist{i},{"_","."}){2});
    j = j + 1;
  endif
endfor
save('processedimages.mat','h','w','imglist','y');



%{
I = imread('pictures/20180924_131439.jpg');
info = imfinfo('pictures/20180924_131439.jpg')
I = rgb2gray(I);
I = imresize(I, [h, w]);
size(I)
imshow(I);
%}
