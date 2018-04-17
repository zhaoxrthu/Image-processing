function C=mydct2(P)
[N,~]=size(P);
D=zeros(N,N);
for x=1:N
	for y=1:N
		if x==1
			D(x,y)=sqrt(1/2);
		else
			D(x,y)=cos((x-1)*(2*y-1)*pi/(2*N));
		end
	end
end

C=2/N.*D*P*D';