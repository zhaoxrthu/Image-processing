clear all, close all, clc
load('hall.mat');
load('jpegcodes.mat');

[x,y]=size(hall_gray);
pre=x*y*8;
len=length(DCcode)+length(ACcode);
comrat=pre/len