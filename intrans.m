function Pback=intrans(Ans,QTAB,M,N)
%   M*N blocks
[~,blocknum]=size(Ans);
temp=zeros(8,8);
P=zeros(8*M,8*N);
for block=1:blocknum
   for flag=1:64
       pos=myzigzag(flag);
       temp(pos)=Ans(flag,block);
   end
   temp=idct2(temp.*QTAB);
   m=ceil(block/N);
   n=block-(m-1)*N;
   P((8*m-7):8*m,(8*n-7):8*n)=temp;
end
Pback=P+128*ones(8*M,8*N);