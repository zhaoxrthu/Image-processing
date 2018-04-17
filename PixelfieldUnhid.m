function strback=PixelfieldUnhid(P)
P=double(P);
lenbit=zeros(1,7);
for flag=1:7
   bit=dec2bin(P(flag));
   templen=length(bit);
   lenbit(flag)=str2num(bit(templen));
end
len=bin2dec(num2str(lenbit));               %get the length of the message
str=zeros(1,len);
for flag=1:len
    pix=P(1+7*flag:7*(flag+1));
    tempbit=zeros(1,7);
    for tempflag=1:7 
        bit=dec2bin(pix(tempflag));
        templen=length(bit);
        tempbit(tempflag)=str2num(bit(templen));
    end
    a=0;
    for tempflag=1:7
        a=a+tempbit(tempflag)*2^(7-tempflag);
    end
    str(flag)=a;
end
strback=str;