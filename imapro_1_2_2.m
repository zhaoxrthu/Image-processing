clear all, close all, clc
load('hall.mat');
[M,N,~]=size(hall_color);
munit=fix(M/8);
nunit=fix(N/8);
temp=hall_color;
for m=1:M
	for n=1:N
		if(mod(ceil(m/munit)+ceil(n/nunit),2)==1)
            temp(m,n,1)=0;
            temp(m,n,2)=0;
            temp(m,n,3)=0;	
        end		
	end
end
image(temp);
imwrite(temp,'imapro_1_2_2.bmp','bmp');