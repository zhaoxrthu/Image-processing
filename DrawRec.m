function Pback=DrawRec(P,m,n,Munit,Nunit)
m=m-1;
n=n-1;
for tempm=(m+1):(m+Munit)
   for tempn=(n+1):(n+3) 
       P(tempm,tempn,:)=[255,0,0];
   end
   for tempn=(n+Nunit-2):(n+Nunit) 
       P(tempm,tempn,:)=[255,0,0];
   end
end
for tempn=(n+1):(n+Nunit)
    for tempm=(m+1):(m+3)
        P(tempm,tempn,:)=[255,0,0];
    end
    for tempm=(m+Munit-2):(m+Munit)
        P(tempm,tempn,:)=[255,0,0];
    end
end
Pback=P;