clc;
clear all;
close all;
 
img = imread('pattern.png');
I = rgb2gray(img);
 
[m,n] = size(I);
% we are going to denote bit planes as mxnx8 array. where bit(i,j,1) will
% denote bit plane-0 and bit(i,j,8) will denote bit plane-7
bit = zeros(m,n,8);
 
for i=1:m
    for j=1:n
        k=0;
        num = I(i,j);
        while (num>0)
            k = k+1;
            bit(i,j,k) = uint8(num/2) - uint8((num-1)/2);
            num = uint8((num-1)/2);
        end
    end
end
 
% now we will show the bit planes separately
out = 255*bit;
out = uint8(out);
 
figure;
set(gcf,'Position',get(0,'Screensize'));
subplot(241);imshow(out(:,:,1));title('bit plane 0');
subplot(242);imshow(out(:,:,2));title('bit plane 1');
subplot(243);imshow(out(:,:,3));title('bit plane 2');
subplot(244);imshow(out(:,:,4));title('bit plane 3');
subplot(245);imshow(out(:,:,5));title('bit plane 4');
subplot(246);imshow(out(:,:,6));title('bit plane 5');
subplot(247);imshow(out(:,:,7));title('bit plane 6');
subplot(248);imshow(out(:,:,8));title('bit plane 7');
 
figure(2);
imshow(I);title('original image');
 
%reconstruction using bit plane 7,6,5,4
recon = zeros(m,n);
for q=1:m
    for r=1:n
        recon(q,r) = (2^7*bit(q,r,8)) + (2^6*bit(q,r,7)) + (2^5*bit(q,r,6)) + (2^4*bit(q,r,5));
    end
end
 
recon = uint8(recon);
figure(3);
imshow(recon);title('image reconstructed using only bit planes 7,6,5,4');