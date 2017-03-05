% antenna- first try
%Task to be done: see the case presented herein, the problem occurs in
%sidelobe level calculation, if the maxima is on the edge of the domain.

function [F_fxn]= ant(p);
m=3;n=3;
I=zeros(m,n);
z=1;
for i=1:m
    for j=1:n
        I(i,j)=p(1,z);
        z=z+1;
    end
end

dx=p(1,z);
dy=p(1,z+1);

%I=[1,1,1;1,1,1;1,1,1];
Lambda = .16;
k = (2*pi)/Lambda;
Leff = 0.0433;
h = .01* Lambda;
w = .05;
%dx= .4 * Lambda;
%dy= .4 * Lambda;
pr = 0;
x = 0;
x1=0;
phi1 = 0;
[irow, icolumn]=size(I);
kdown=1;
kup=1;
brk=0;
c1=-(1);
c2= -0.1;
c3=1.2;

for theta = 0.01: (pi/180): pi + 0.01;
        
    for phi = 0.01: (pi/180): (pi) + 0.01;
        
            if ((phi > (pi/2)))
                phi = phi + pi;
            end
                                    
                X = (k*h*sin(theta)*cos(phi))/2;
                Z = k*w*cos(theta)/2;
                R = k * (sin(theta)* (sin(X)/X) * (sin(Z)/Z)) * cos(k*Leff*sin(theta)*sin(phi)/2);
                a=0;
        for m = 1:irow;
            for n = 1:icolumn;
                
                a = a + ( I(m,n)* exp(1i*k*sin(theta)*((dx*(n-1)*cos(phi))+(dy*(m-1)*sin(phi)))));
                
            end
        end
        
        e = R * a;
        u = (abs(e)^2)/(2*377);
        pr = pr + (u * sin(theta));
        
        
 
    end
end

prad = ((2 * (pi ^ 2))/ (180^2))*pr;

                
    %for bandwidth            
fid = fopen ('tet.table','w');
fad = fopen ('cet.table','w') ;
  
  theta =  (pi/2) + 0.01;
        
  for phi = 0.01: (pi/180): pi + 0.01;
         
            if ((phi > (pi/2)))
                phi = phi + pi;
                si = phi - (1.5*pi);
            
            else si = phi + (pi/2);
                
            end
                                    
                X = (k*h*sin(theta)*cos(phi))/2;
                Z = k*w*cos(theta)/2;
                R = k * (sin(theta)* (sin(X)/X) * (sin(Z)/Z)) * cos(k*Leff*sin(theta)*sin(phi)/2);
                a=0;
        for m = 1:irow;
            for n = 1:icolumn;
                
                a = a + ( I(m,n)* exp(1i*k*sin(theta)*((dx*(n-1)*cos(phi))+(dy*(m-1)*sin(phi)))));
                
            end
        end
        
        
        e = R * a;
        u = (abs(e)^2)/(2*377);
        D = (4*(pi)*u)/prad;
        Di = 10 * log10(D);
        t = [phi;Di];
        b = [si; Di];
        
fprintf(fid,'%8.4f    %8.4f\n', t);
fprintf(fad,'%8.4f    %8.4f\n', b) ;        
 
  end
 


z=load('cet.table');
A = [z(91:181,:);z(1:90,:)];
plot (A(:,1),A(:,2));
fclose(fad);
fclose(fid);
Dimi_chk = max(A(:,2));
Dimm_chk = min(A(:,2));


for n = 1:181;
if (A(n,2) == Dimi_chk)
    Dimi=n;
    %disp('inside dimi');
end
end
%Dimi
A(Dimi,:);
for n = 1:181;
if (A(n,2) == Dimm_chk)
    Dimm=n;
    %disp('inside dimm');
end
end
%Dimm
A(Dimm,:);

[rows,columns]=size(A);

for n = 0:180;
     
    if ((Dimi+n==rows)||(A(Dimi,2)-A(Dimi+n,2)>=3))
        phi1=Dimi+n;
        break
    end
end
phi1;
A(phi1,:);
for n = 0:180;
    
    if ((Dimi==n+1)||(A(Dimi,2)-A(Dimi-n,2)>=3))
        phi2=Dimi-n;
        break
    end
end
phi2;
A(phi2,:);
        Beamwidth = phi1-phi2;
        
for n=1:181
    
    if (Dimi+n+1>=rows)
        sd(kdown)=A(Dimm,2);
            break
    end
        
    if (A(Dimi+n+1,2)>A(Dimi+n,2))
        
        if (Dimi+n+1==rows)
            sd(kdown) = A(Dimi+n+1,2);
            break
        end
        
        sd(kdown)=A(Dimi+n+1,2);
        kdown=kdown+1;
    end
                     
end
sl1s=sort(sd,'descend');
B=sl1s(1);

for n=1:181
    
    if (Dimi-n-1<=1)
            su(kup)=A(Dimm,2);
            %sl(kup)=A(Dimm,1);
            %24
            break
    end
        
    if (A(Dimi-(n+1),2)>A(Dimi-n,2))
        
        if (Dimi-n-1==1)
            su(kup) = A(Dimi-n-1,2);
            %sl(kup) = A(Dimi-n-1,1);
            %5
            break
        end
        
        su(kup)=A(Dimi-n-1,2);
         %sl(kup)=A(Dimi-n-1,1);
        kup=kup+1;
        %26
    end
    
    
   
end

sl2d=sort(su,'descend');

%sl
C=sl2d(1);

if (B>C)
    sl=B;
    
    else sl=C;

end

sll=sl-A(Dimi,2);



%fitness function
F_fxn= ((c1*Beamwidth + c2*sll + c3*A(Dimi,2)));