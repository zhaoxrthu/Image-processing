function vback=DistinguishTrans(P,L)
v=zeros(1,2^(3*L));
[M,N,~]=size(P);
rate=2^(8-L);
for m=1:M
   for n=1:N
       colour=double(P(m,n,:));
       pos=1;
       for c=1:3
           coL=fix(colour(c)/rate);
           pos=pos+coL*2^(L*(3-c));
       end
       v(pos)=v(pos)+1;
   end
end
vback=v/(M*N);