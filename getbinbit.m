function y=getbinbit(x)
bin=dec2bin(abs(x));
len=length(bin);
y=zeros(1,len);
for n=1:len
    y(n)=logical(str2num(bin(n)));
end
if x<0
    y=~y;
end
