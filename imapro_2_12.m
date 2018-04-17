clear all, close all, clc
load('hall.mat');
load('JpegCoeff.mat');
[M,N]=size(hall_gray);
presize=8*M*N;
M=8*ceil(M/8);
N=8*ceil(N/8);

% 1 is the standard quantification
% 2 is the half-longth quantification
Ans1=quant(hall_gray,QTAB);
Ans2=quant(hall_gray,(QTAB./2));
[DCcode1,ACcode1]=code(Ans1,DCTAB,ACTAB);
[DCcode2,ACcode2]=code(Ans2,DCTAB,ACTAB);
P1=decode(DCcode1,ACcode1,M,N,DCTAB,ACTAB,QTAB);
P2=decode(DCcode2,ACcode2,M,N,DCTAB,ACTAB,(QTAB./2));

comrat1=presize/(length(DCcode1)+length(ACcode1))
comrat2=presize/(length(DCcode2)+length(ACcode2))

PSNR1=myPSNR(hall_gray,P1)
PSNR2=myPSNR(hall_gray,P2)

figure;
subplot(1,2,1);
imshow(uint8(P1));
title('standard quantization');
subplot(1,2,2);
imshow(uint8(P2));
title('half-length quantization');