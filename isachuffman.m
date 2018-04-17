function [jud,run,size]=isachuffman(array,ACTAB)
tempjud=false;
temprun=0;
tempsize=0;
for flag=1:160
    templen=ACTAB(flag,3);
    if templen==length(array)
        temparray=ACTAB(flag,4:templen+3);
        if array==temparray
            tempjud=true;
            temprun=ACTAB(flag,1);
            tempsize=ACTAB(flag,2);
            break;
        end
    end
end
jud=tempjud;
run=temprun;
size=tempsize;