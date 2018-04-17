function strback=TransfieldUnhid3(P,QTAB)
P=quant(P,QTAB);
[M,N]=size(P);
len=0;
for flag=1:7
    last=1;
    for pos=1:64
         if P(pos,flag)~=0
            last=pos;
         end
    end
    if P(last,flag)==1
        len=len+P(last,flag)*2^(7-flag);
    end
end
str=zeros(1,len);
for flag=1:len
    strbit=zeros(1,7);
    for tempflag=1:7
       last=1;
       for pos=1:64
           if P(pos,tempflag+7*flag)~=0
               last=pos;
           end
       end
       strbit(tempflag)=P(last,tempflag+7*flag);
    end
    for tempflag=1:7
        if strbit(tempflag)==1
            str(flag)=str(flag)+strbit(tempflag)*2^(7-tempflag);
        end
    end
end
strback=char(str);
