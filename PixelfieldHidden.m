function Pback=PixelfieldHidden(P,str)
mes=abs(str);
len=length(mes);
inf=[len,mes];  
P=double(P);
for flag=1:(len+1)
    tempbitmes=dec2bin(inf(flag));
    bitmes=zeros(1,7);
    for tempflag=1:length(tempbitmes)
        pos=7-length(tempbitmes)+tempflag;
        bitmes(pos)=logical(str2num(tempbitmes(tempflag)));
    end
    encpix=P(1+7*(flag-1):7*flag);
    for tempflag=1:7
        temppixbit=dec2bin(encpix(tempflag));
        templen=length(temppixbit);
        temppixbit=[temppixbit(1:templen-1),num2str(bitmes(tempflag))];
        encpix(tempflag)=bin2dec(temppixbit);
    end
    P(1+7*(flag-1):7*flag)=encpix;
end
Pback=P;