function Pback=TransfieldHidden2(Ans,str)
mes=abs(str);
len=length(mes);
inf=[len,mes];  
Ans=double(Ans);
[M,N]=size(Ans);
for flag=1:(len+1)
    tempbitmes=dec2bin(inf(flag));
    bitmes=zeros(1,7);
    for tempflag=1:length(tempbitmes)
        pos=7-length(tempbitmes)+tempflag;
        bitmes(pos)=logical(str2num(tempbitmes(tempflag)));
    end
    Ans(M,2+14*(flag-1):2:14*flag)=bitmes;
end
Pback=Ans;