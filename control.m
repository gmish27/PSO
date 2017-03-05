clc; 
iter=input('Enter the number of iterations= ');
np=input('\nEnter the number of particles= ');
c1=2; c2=2; w=0.9; 
dim=input('\nEnter the number of dimensions= ');
dmat=zeros(1,dim);
fprintf('\nThe default lower limit of all the dimensions is 0.\nEnter the upper limit for them: \n'); 
for i=1:dim
    fprintf('\nDimension %d=',i);
    dmat(1,i)=input(' ');
end
fprintf('\nDisplay each movement? (y/n):');
reply = input(' ', 's');
if isempty(reply)
    reply = 'y';
end
flag=0;
vnew=zeros(np,dim); phist=zeros(np,2); p=zeros(np,dim); v=zeros(np,dim);


for i=1:np
    a = zeros(1,dim);
    for k=1:dim
        a(1,k) = 0.06 + (dmat(1,k)*rand(1));
    end
        p(i,:) = a;
end

for i=1:np
    a = zeros(1,dim);
    for k=1:dim
        a(1,k) = 0.06 + (dmat(1,k)*rand(1));
    end
        v(i,:) = a;
end

for i=1:np
    for j=1:dim
        if(v(i,j)>=dmat(1,j)/2)
            v(i,j)=dmat(1,j)/2;
        else if(v(i,j)<((-dmat(1,j))/2))
                v(i,j)=((-dmat(1,j))/2);
            end
        end
    end
end    