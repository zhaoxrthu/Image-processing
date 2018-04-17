function Pback=TransfieldHidden1(Ans,str)
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
    Ans(M,1+7*(flag-1):7*flag)=bitmes;
end
Pback=Ans;
