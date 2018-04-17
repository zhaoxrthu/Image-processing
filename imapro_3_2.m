clear all, close all, clc
load('hall.mat');
load('JpegCoeff.mat');
[M,N]=size(hall_gray);
presize=8*M*N;

array='White Album';
Ans=quant(hall_gray,QTAB);
Ans1=TransfieldHidden1(Ans,array);
Ans2=TransfieldHidden2(Ans,array);
Ans3=TransfieldHidden3(Ans,array);
[DCcode1,ACcode1]=code(Ans1,DCTAB,ACTAB);
[DCcode2,ACcode2]=code(Ans2,DCTAB,ACTAB);
[DCcode3,ACcode3]=code(Ans3,DCTAB,ACTAB);
P1=decode(DCcode1,ACcode1,M,N,DCTAB,ACTAB,QTAB);
P2=decode(DCcode2,ACcode2,M,N,DCTAB,ACTAB,QTAB);
P3=decode(DCcode3,ACcode3,M,N,DCTAB,ACTAB,QTAB);
mes1=TransfieldUnhid1(P1,QTAB)
mes2=TransfieldUnhid2(P2,QTAB)
mes3=TransfieldUnhid3(P3,QTAB)

comrat1=presize/(length(DCcode1)+length(ACcode1))
comrat2=presize/(length(DCcode2)+length(ACcode2))
comrat3=presize/(length(DCcode3)+length(ACcode3))
PSNR1=myPSNR(hall_gray,P1)
PSNR2=myPSNR(hall_gray,P2)
PSNR3=myPSNR(hall_gray,P3)

figure;
subplot(2,2,1);
imshow(uint8(hall_gray));
title('oringinal image');
subplot(2,2,2);
imshow(uint8(P1));
title('Way 1');
subplot(2,2,3);
imshow(uint8(P2));
title('Way 2');
subplot(2,2,4);
imshow(uint8(P3));
title('Way 3');