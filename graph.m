figure
a=load('pso.dat');
t=1:iter;
bee=[];
j=dim;    %dimension
for i=1:np
    m=i;
    b=[];
    for k=1:iter
        b=[b;a(m,j)];
        m=m+np;
    end
    bee=[bee b];
end

mean=[];
for i=1:iter
    x=0;
    for j=1:np
        x=x+bee(i,j);        
    end
    x=x/np;
    mean=[mean;x];
end
plot(t,bee(:,1),'-r*')
title(['\fontsize{20}\color{black}Plot of a Particle''s Position']);
xlabel('No. of Iterations','fontsize',12);
ylabel('1st Dimension Value','fontsize',12);
hold on
plot(t,mean,'-g*')
legend('One particle movement','Mean movement of all Particles');