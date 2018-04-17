function num=getdecnum(bit)
sysbol=bit(1);
bit=logical(bit);
if sysbol==0
    bit=~bit;
end
tempnum=bin2dec(num2str(bit));
if sysbol==1
    num=tempnum;
else
    num=-1*tempnum;
end