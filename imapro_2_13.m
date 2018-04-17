clear all, close all, clc
load('snow.mat');
load('JpegCoeff.mat');
[M,N]=size(snow);
presize=8*M*N;
M=8*ceil(M/8);
N=8*ceil(N/8);

Ans=quant(snow,QTAB);
preAns=Ans;
[DCcode,ACcode]=code(Ans,DCTAB,ACTAB);
P=decode(DCcode,ACcode,M,N,DCTAB,ACTAB,QTAB);

comrat=presize/(length(DCcode)+length(ACcode))
PSNR=myPSNR(snow,P)

figure;
subplot(1,2,1);
imshow(uint8(snow));
title('original image');
subplot(1,2,2);
imshow(uint8(P));
title('after coding and decoding');
