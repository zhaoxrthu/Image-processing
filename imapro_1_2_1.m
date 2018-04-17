clear all, close all, clc
load('hall.mat');
[M,N,~]=size(hall_color);
r=round(min(M,N)/2);
temp=hall_color;
for m=1:M
    for n=1:N
        if((round(M/2)-m)^2+(round(N/2)-n)^2<=(r^2))
            temp(m,n,1)=255;
            temp(m,n,2)=0;
            temp(m,n,3)=0;
        end
    end
end
image(temp);
imwrite(temp,'imapro_1_2_1.bmp','bmp');