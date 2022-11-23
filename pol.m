function W = pol(x,c,t)
N=length(x);
 p=1;
s=c(1);
 
for k=2:N
     p = p*(t-x(k-1));
    s = s + c(k)*p;
end
W = s;
end