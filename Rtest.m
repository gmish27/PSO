clc;
arr = zeros(30,50);
z=0;
for x=50:50:2500
    z=z+1
    q=0;
    for y=10:10:300
        q=q+1;
        iter=x;
        np=y;
        pso_core;
        tmp=zeros(1,np);
        for m=1:np
            if(check(dim,ival,lobe,np,p(m,:)))
                [dump,variable]=fitness_function(p(m,:));
                tmp = [tmp variable];
            end
        end           
        arr(q,z) = moment(tmp,2);
    end
end
surf(arr);
%dlmwrite('data.txt',arr,'delimeter','\t','precision','%.6f');