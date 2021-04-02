clc;
clear all;
close all;
a = imread('cameraman.tif');
a = double(a);
[m,n] = size(a);
b=a;
msk = -[1 1 1 ; 1 -9 1; 1 1 1];

for i = 2:m-1
    for j = 2:n-1
        b(i,j) = sum(sum(a(i-1:i+1,j-1:j+1).*msk));
    end
end

figure(1);
subplot(2,1,1);
imshow(a,[]);
subplot(2,1,2);
imshow(uint8(b));