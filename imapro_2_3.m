clear all, close all, clc
load('hall.mat');
Ppri=double(hall_gray);
[M,N]=size(Ppri);
P=Ppri-128*ones(M,N);
C=dct2(P);
Cleft=[zeros(M,4),C(1:M,5:N)];
Cright=[C(1:M,1:(N-4)),zeros(M,4)];

subplot(2,2,1);
imshow(hall_gray);
title('original image');
subplot(2,2,2);
imshow(uint8(idct2(C)+128*ones(M,N)));
title('inverse transformation');
subplot(2,2,3);
imshow(uint8(idct2(Cright)+128*ones(M,N)));
title('turning to 0s in right');
subplot(2,2,4);
imshow(uint8(idct2(Cleft)+128*ones(M,N)));
title('turning to 0s in left');
