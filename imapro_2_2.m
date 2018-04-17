clear all, close all, clc
load('hall.mat');
[m,n]=size(hall_gray);
mcenter=round(m/2);
ncenter=round(n/2);
P=double(hall_gray(mcenter-4:mcenter+5,ncenter-4:ncenter+5));
C1=dct2(P);
C2=mydct2(P);
delC=abs(C1-C2);
maxdel=max(max(delC));

subplot(1,2,1);
imshow(uint8(idct2(C1)));
title('translating by library function');
subplot(1,2,2);
imshow(uint8(idct2(C2)));
title('translating by my own function');