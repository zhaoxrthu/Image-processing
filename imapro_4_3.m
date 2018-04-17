clear all, close all, clc
load('TransData4.mat','v4');
Ppri=imread('Romantic.bmp');
P=double(imadjust(Ppri,[.2 .3 0; .6 .7 1]));
%P=double(imrotate(Ppri,270));
[M,N,~]=size(Ppri);
% P=double(imresize(Ppri,[M,2*N]));
% [M,N,~]=size(P);
Munit=105;
Nunit=90;
limit=0.2;
L=4;
sv=v4;
Ans=[];
for m=1:25:M-Munit
   for n=1:25:N-Nunit 
       if DupCheck(m,n,Ans,Munit,Nunit)
           continue;
       end
       Ptemp=P(m:m+Munit-1,n:n+Nunit-1,:);
       vtemp=DistinguishTrans(Ptemp,L);
       rate=dot(vtemp,sv)/(norm(vtemp)*norm(sv));
       if rate>limit
          [m,n]=AdjustPos(P,m,n,Munit,Nunit,L,sv);
          Ans=[Ans;m,n]
          P=DrawRec(P,m,n,Munit,Nunit); 
          m=m+Munit;
       end
   end
end
imshow(uint8(P));