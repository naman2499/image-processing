clear ; 
close all;

a = imread('finc.png');
[m,n] = size(a);
a=double(a);

x = input('Enter value of A:')
msk = -[0 1 0; 1 -(x+3)  1 ;0 1 0 ];
b=a;
for i =2:m-1
    for j = 2: n-1
       b(i,j) = sum(sum(a(i-1:i+1,j-1:j+1).*msk));
    end
end
 
figure(1)
subplot(2,1,1);imshow(a,[]);
subplot(2,1,2);imshow(uint8(b)); %imp, if low resoln use this