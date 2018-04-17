function [DCcodeback,ACcodeback]=code(Ans,DCTAB,ACTAB)
[~,S]=size(Ans);		%having N clocks

%DC
DC=zeros(1,S);
DCcode=[];
for num=1:S
    if num==1
        DC(num)=Ans(1,num);
	else
		DC(num)=Ans(1,num-1)-Ans(1,num);
    end
end
for num=1:S
    if DC(num)==0
        DCcode=[DCcode,0,0];
    else
        category=ceil(log2(abs(DC(num))+1));
        len=DCTAB(category+1,1);
        huff=logical(DCTAB(category+1,2:1+len));
        bit=getbinbit(DC(num));
        DCcode=[DCcode,huff,bit];
    end
end

%AC
AC=zeros(63,1);
ACcode=[];
for blk=1:S
	AC=Ans(2:64,blk);
	last=0;
	for flag=1:63
		if AC(flag)
			last=flag;
		end
	end							%getting the last non zero position
	if last==0
		ACcode=[ACcode,1,0,1,0];	%all 0s, EOB and continue
		% continue;
	else
		run=0;
		for num=1:last
			if AC(num)==0 && run<16
				run=run+1;
			end
			if AC(num)==0 && run==16
				run=0;
				ACcode=[ACcode,1,1,1,1,1,1,1,1,0,0,1];
								%ZRL and run=0	
			end
			if AC(num)
				siz=ceil(log2(abs(AC(num))+1));
                pos=10*run+siz;
                len=ACTAB(10*run+siz,3);
				code=ACTAB(pos,4:len+3);
				bit=getbinbit(AC(num));
				ACcode=[ACcode code bit];
				run=0;
			end
        end
        %if AC factories are not enough, EOB
        if last~=63                        
            ACcode=[ACcode,1,0,1,0];
        end
	end
end
DCcodeback=DCcode;
ACcodeback=ACcode;