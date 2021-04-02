clear ; 
close all;

a = imread('finc.png');
[m,n] = size(a);
a=double(a);

for k= 0:7
for i =1:m
    for j = 1: n
       if bitand(2.^k, a(i,j))==0
           b(i,j)=0;
       else 
           b(i,j)=255;
       end
    end
end
figure(k+1);
imshow(b,[]);
end

