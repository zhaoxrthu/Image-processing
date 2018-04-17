function strback=TransfieldUnhid1(P,QTAB)
P=quant(P,QTAB);
[M,N]=size(P);
len=0;
for flag=1:7
    len=len+P(M,flag)*2^(7-flag);
end
str=zeros(1,len);
for flag=1:len
    strbit=P(M,1+7*flag:7+7*flag);
    for tempflag=1:7
       str(flag)=str(flag)+strbit(tempflag)*2^(7-tempflag);
    end
end
strback=char(str);
