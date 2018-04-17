clear all, close all, clc
% L=3;
% L=4;
L=5;
v=zeros(1,2^(3*L));
for n=1:33
   filename=['Faces\',num2str(n),'.bmp'];
   P=imread(filename);
   v=v+DistinguishTrans(P,L);
end
% v3=v/33;
% v4=v/33;
v5=v/33;
% save('TransData3.mat','v3');
% save('TransData4.mat','v4');
save('TransData5.mat','v5');