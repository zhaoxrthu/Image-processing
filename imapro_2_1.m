clear all, close all, clc
load('hall.mat');
S=128*ones(10,10);
[m,n]=size(hall_gray);
mcenter=round(m/2);
ncenter=round(n/2);
Ppri=double(hall_gray(mcenter-4:mcenter+5,ncenter-4:ncenter+5));
P=Ppri-S;
C1=dct2(P);								%DCT after substracting
C2=dct2(Ppri)-dct2(S);					%DCT and substracting
Paft1=idct2(C1);
Paft2=idct2(C2);
del=abs(C1-C2)
maxdel=max(max(abs(C1-C2)))

figure;
subplot(1,3,1);
imshow(hall_gray(mcenter-4:mcenter+5,ncenter-4:ncenter+5));
title('original image');
subplot(1,3,2);
imshow(uint8(Paft1+128*ones(10,10)));
title('substracting before translating');
subplot(1,3,3);
imshow(uint8(Paft2+128*ones(10,10)));
title('substracting after translating');