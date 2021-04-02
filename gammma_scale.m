clear;
close all;

i = imread('cameraman.tif');
a = rgb2gray(i);
g = input('Type the value of gamma\n');
a = double(a);
b=a.^g;
figure(1);
subplot(2,1,1)

bb = b - min(b(:));
bb = bb*255/max(bb(:));
bb = uint8(bb);
imshow(a,[]);
subplot(2,1,2)
imshow(bb);
%imwrite(bb, 'new.bmp');