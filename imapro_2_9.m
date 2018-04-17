clear all, close all, clc
load('JpegCoeff.mat');
load('hall.mat');
load('quant.mat');
P=double(hall_gray);
[M,N]=size(P);
[DCcode,ACcode]=code(Ans,DCTAB,ACTAB);
save ('jpegcodes.mat','DCcode','ACcode','M','N');