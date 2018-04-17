function [mback,nback]=AdjustPos(P,m,n,Munit,Nunit,L,Sv)
rate=[];
pos=[];
[Mmax,Nmax,~]=size(P);
for mtemp=m:3:min(m+Munit/2,Mmax-Munit)
    for ntemp=n:3:min(n+Nunit/2,Nmax-Nunit)
        Ptemp=P(mtemp:mtemp+Munit,ntemp:ntemp+Nunit,:);
        vtemp=DistinguishTrans(Ptemp,L);
        rtemp=dot(vtemp,Sv)/(norm(vtemp)*norm(Sv));
        rate=[rate,rtemp];
        pos=[pos;mtemp,ntemp];
    end
end
[~,point]=max(rate);
mback=pos(point,1);
nback=pos(point,2);
