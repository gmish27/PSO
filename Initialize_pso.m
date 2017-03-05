control

for i=1:np
    phist(i,1)=fitness_function(p(i,:));
end
pbest = p;
for i=1:np
    if(max(phist(:,1)) == phist(i,1))
        gbest = pbest(i,:);
        break;
    end
end

for i=1:np
    vnew(i,:) = (w*v(i,:) + c2*rand()*(gbest-p(i,:)));
    for j=1:dim
        if(vnew(i,j)>=dmat(1,j)/2)
            vnew(i,j)=dmat(1,j)/2;
        else if(vnew(i,j)<((-dmat(1,j))/2))
                vnew(i,j)=((-dmat(1,j))/2);
            end
        end
    end
end
