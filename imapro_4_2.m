clear all, close all, clc
load('TransData3.mat','v3');
load('TransData4.mat','v4');
load('TransData5.mat','v5');
P=imread('Romantic.bmp');
P=double(P);
[M,N,~]=size(P);
Munit=105;
Nunit=90;
limit=0.27;
% limit=0.2;
% limit=0.13;
L=3;
% L=4;
% l=5;
sv=v3;
% sv=v4;
% sv=v5;
Ans=[];
for m=1:25:M-Munit
   for n=1:25:N-Nunit 
       if DupCheck(m,n,Ans,Munit,Nunit)
           continue;
       end
       Ptemp=P(m:m+Munit,n:n+Nunit,:);
       vtemp=DistinguishTrans(Ptemp,L);
       rate=dot(vtemp,sv)/(norm(vtemp)*norm(sv));
       if rate>limit
          [m,n]=AdjustPos(P,m,n,Munit,Nunit,L,sv);
          Ans=[Ans;m,n];
          P=DrawRec(P,m,n,Munit,Nunit); 
          m=m+Munit;
       end
   end
end
image(uint8(P));