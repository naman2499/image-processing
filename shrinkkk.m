clear all;
close all;
a= imread('cameraman.tif');
b = a(:,:,1);

figure(2)
subplot(2,1,1) 
imshow(b)
[m,n] = size(b);
c = b(1:3:m , 1:3:n);
whos
subplot(2,1,2)
imshow(c)
