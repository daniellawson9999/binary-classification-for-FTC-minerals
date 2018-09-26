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
for i = 1:size(filelist,1)
  if (regexp(filelist{i},"(\\.jpg)"))
    img = imread(["pictures/" filelist{i}]);
    img = rgb2gray(img);
    img = imresize(img, [h, w]);
    %imshow(img);
    imglist(i,:) = img(:);
    i
  endif
endfor
save('processedimages.mat','h','w','imglist');



%{
I = imread('pictures/20180924_131439.jpg');
info = imfinfo('pictures/20180924_131439.jpg')
I = rgb2gray(I);
I = imresize(I, [h, w]);
size(I)
imshow(I);
%}
