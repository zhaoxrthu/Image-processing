function Pback=TransfieldHidden3(Ans,str)
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
    for tempflag=1:7
       last=1;
       for pos=1:64
           if Ans(pos,tempflag+7*flag-7)~=0
               last=pos;
           end
       end
       last=min(last+1,64);
       if bitmes(tempflag)
            Ans(last,tempflag+7*flag-7)=1;
       else
            Ans(last,tempflag+7*flag-7)=-1;
       end
    end
end
Pback=Ans;