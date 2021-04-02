clear all; 
close all;

a = imread('finc.png');
a = double(a);
[m,n] = size(a);


hi = histcounts(a,m)/ (m*n)
s = cumsum(hi);

for i = 1:m
    for j= 1:n
        b(i,j) = s((a(i,j)))*m;
    end
end

figure(11)
imshow(b,[])
