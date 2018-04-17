clear all, close all, clc
load('hall.mat');
Ppri=double(hall_gray);
[M,N]=size(Ppri);
P=Ppri-128*ones(M,N);
C=dct2(P);

figure;
subplot(2,2,1);
imshow(uint8(idct2(C)+128*ones(M,N)));
title('inverse transformation');
subplot(2,2,2);
imshow(uint8(idct2(C')+128*ones(N,M)));
title('transpose');
subplot(2,2,3);
imshow(uint8(idct2(rot90(C)+128*ones(N,M))));
title('rot90');
subplot(2,2,4);
imshow(uint8(idct2(rot90(rot90(C)))+128*ones(M,N)));
title('rot180');