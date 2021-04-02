clc;
clear all;
close all;
 
img = imread('lena.png');
I = rgb2gray(img);
I = imnoise(I,'Gaussian',0.04,0.003);
 
% making a gaussian kernel
sigma = 1;         % standard deviation of the distribution
% since we are going to normalize the kernel anyway, hence only exponential
% part will matter.
kernel = zeros(5,5);      % for a 5x5 kernel
W = 0;                    % sum of elements of kernel (for normalization)
for i = 1:5
    for j=1:5
        sq_dist = (i-3)^2+ (j-3)^2;
        kernel(i,j) = exp(-1*(sq_dist)/(2*sigma*sigma));
        W = W + kernel(i,j);
    end
end
kernel = kernel/W;
 
% now we apply the filter to the image
[m,n] = size(I);
output = zeros(m,n);
Im = padarray(I,[2 2]);
 
for i=1:m
    for j=1:n
        temp = Im(i:i+4 , j:j+4);
        temp = double(temp);
        conv = temp.*kernel;
        output(i,j) = sum(conv(:));
    end
end
 
output = uint8(output);
 
% now we can show original and filtered image
figure(1);
set(gcf,'Position',get(0,'Screensize'));
subplot(121),imshow(I),title('original Image');
subplot(122),imshow(output),title('output of gaussian filter');