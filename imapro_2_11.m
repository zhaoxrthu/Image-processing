clear all, close all, clc
load('hall.mat');
load('jpegcodes.mat');
load('JpegCoeff.mat');

P=decode(DCcode,ACcode,M,N,DCTAB,ACTAB,QTAB);
psnr=myPSNR(hall_gray,P)

figure;
subplot(1,2,1);
imshow(uint8(hall_gray));
title('original image');
subplot(1,2,2);
imshow(uint8(P));
title('after coding and decoding');
