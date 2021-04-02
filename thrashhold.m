clear;
close all;

i = imread('cameraman.tif');
a = rgb2gray(i);
whos
imshow(a);

[m,n] = size(a);
avg = mean(a(:));

for i = 1:m
    for j = 1:n
        if(a(i,j)<avg)
            a(i,j)=0;
        else
            a(i,j)=255;
        end
    end
end
figure(12)
imshow(a);
a

