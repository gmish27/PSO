function [flag] = check(dim,dmat,p);

flag=0;
for i=1:dim
    if(p(1,i)<=dmat(1,i) && p(1,i)>=0.06)
        flag=1;
    else 
        flag=0;
        break;
    end
end