function [c,d]=newpol(x,y)
%diferencias divididas
N =length(x);
 d=zeros(N,N);
d(:,1)= y';

for j=2:N
     for k=j:N
        d(k,j)=(d(k,j-1)-d(k-1,j-1))/(x(k)-x(k-j+1));
    end
end
for i=1:N
    c(i)=d(i,i);
end
c  = c';
