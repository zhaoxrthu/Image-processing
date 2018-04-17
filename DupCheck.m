function jud=DupCheck(m,n,Ans,Munit,Nunit)
tempjud=false;
[X,~]=size(Ans);
for x=1:X
   if abs(m-Ans(x,1))<Munit && abs(n-Ans(x,2))<Nunit
       tempjud=true;
       break;
   end
end
jud=tempjud;