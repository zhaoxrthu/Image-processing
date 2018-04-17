function Ans=quant(example,Q)
%get an 8 muliple image
Ppri=double(example);
[Mpri,Npri]=size(Ppri);
M=8*ceil(Mpri/8);
N=8*ceil(Npri/8);
P=zeros(M,N);
P(1:Mpri,1:Npri)=Ppri-128*ones(Mpri,Npri);		

%cutiing and saving 
Ans=zeros(64,M*N/64);
temp=zeros(8,8);
for num=1:M*N/64
	x=ceil(8*num/N);
    y=num-N/8*(x-1);
	temp=round(dct2(P(8*(x-1)+1:8*x,8*(y-1)+1:8*y))./Q);
	for flag=1:64
		Ans(flag,num)=temp(myzigzag(flag));
	end
end
Ansback=Ans;