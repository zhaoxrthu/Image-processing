clear all, close all, clc
load('JpegCoeff.mat');
load('hall.mat');
Ans=quant(hall_gray,QTAB);
save('quant.mat','Ans');