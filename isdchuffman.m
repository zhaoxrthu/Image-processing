function [jud,bitlen]=isdchuffman(array,DCTAB)
tempjud=false;
tempbitlen=0;
for flag=1:12
   len=DCTAB(flag,1); 
   temparray=DCTAB(flag,2:1+len);
   if len==length(array)
       if array==temparray
          tempjud=true;
          tempbitlen=flag-1;
          break;
       end
   end
end
jud=tempjud;
bitlen=tempbitlen;