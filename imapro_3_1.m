clear all, close all, clc
load('hall.mat');
load('JpegCoeff.mat');
[M,N]=size(hall_gray);

string='White Album';           %the information that should be hidden
P1=PixelfieldHidden(hall_gray,string);

figure;
subplot(1,2,1);
imshow(uint8(hall_gray));
title('original image');
subplot(1,2,2);
imshow(uint8(P1));
title('after encryption');

str1=PixelfieldUnhid(P1);
mes1=char(str1)

Ans=quant(P1,QTAB);
[DCcode,ACcode]=code(Ans,DCTAB,ACTAB);
P2=decode(DCcode,ACcode,M,N,DCTAB,ACTAB,QTAB);

str2=PixelfieldUnhid(P2);
mes2=char(str2)

