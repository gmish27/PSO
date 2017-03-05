Initialize_pso
fid=fopen('pso.dat','w');
disp=strcmp(reply,'y');
funct=zeros(1,iter+1);
fun=1;
for j=1:iter
    if(disp && j==iter)
        move;
    end
    j
    for k=1:np
        for i=1:dim
            fprintf(fid,'%d ',p(k,i));
        end
        fprintf(fid,'\n');
    end
    p = p+vnew;
    v = vnew;
    w = 0.9-(0.5/iter)*j;
    for k=1:np
        if(check(dim,dmat,p(k,:)))
            [phist(k,2)] = fitness_function(p(k,:));
            funct(1,fun) = phist(k,2);
            fun = fun + 1;
            if(phist(k,2)>phist(k,1))
                pbest(k,:)=p(k,:);
                phist(k,1)=phist(k,2);
            end
        end
    end
    phist(:,2)=0;
    for i=1:np
        if(max(phist(:,1)) == phist(i,1))
            gbest = pbest(i,:);
            break;
        end
    end
    
    for i=1:np
        vnew(i,:) = (w*v(i,:) + (c1*rand()*(pbest(i,:)-p(i,:))) + ...
                    (c2*rand()*(gbest-p(i,:))));
        for j=1:dim
            if(vnew(i,j)>=dmat(1,j)/2)
                vnew(i,j)=dmat(1,j)/2;
            else if(vnew(i,j)<((-dmat(1,j))/2))
                    vnew(i,j)=((-dmat(1,j))/2);
                end
            end
        end
    end
    %pause
end
fclose(fid);
fprintf('\nThe max value of the fitness function= %f\n',fitness_function(gbest));
graph