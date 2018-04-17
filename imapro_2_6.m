clear all, close all, clc
if c==0
	Category=0;
else
	Category=floor(log2(abs(c)))+1;
end