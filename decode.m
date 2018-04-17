function Pback=decode(DCcode,ACcode,M,N,DCTAB,ACTAB,QTAB)
DC=[];
len=length(DCcode);
stapos=1;
for flag=2:len
    array=double(DCcode(stapos:flag));
    [jud,bitlen]=isdchuffman(array,DCTAB);
    if jud
        if bitlen==0
            DC=[DC,0];
            stapos=stapos+2;
            flag=flag+2;
            continue;
        end   
        bit=DCcode(flag+1:flag+bitlen);
        stapos=flag+bitlen+1;
        flag=flag+bitlen+2;
        DCnum=getdecnum(bit);
        DC=[DC,DCnum];
    end
end
len=length(DC);
for num=2:len
    DC(num)=DC(num-1)-DC(num);   
end
blocknum=length(DC);

AC=zeros(63,blocknum);
block=1;
stapos=1;
azis=0;
len=length(ACcode);
for flag=2:len
    array=double(ACcode(stapos:flag));
    if length(array)==4
        if array==[1,0,1,0]
            block=block+1;
            azis=0;
            stapos=flag+1;
            flag=flag+2;
            continue;
        end
    end
    if length(array)==11
        if array==[1,1,1,1,1,1,1,1,0,0,1]
           azis=azis+16;
           stapos=flag+1;
           flag=flag+2;
           continue;
        end         
    end
    [jud,run,size]=isachuffman(array,ACTAB);
    if jud
       bit=ACcode(flag+1:flag+size);
       azis=azis+1+run;
       stapos=flag+size+1;
       flag=flag+size+2;
       ACnum=getdecnum(bit);
       AC(azis,block)=ACnum;
       if azis==63
            azis=0;
            block=block+1;
       end
    end
end

Pback=intrans([DC;AC],QTAB,ceil(M/8),ceil(N/8));