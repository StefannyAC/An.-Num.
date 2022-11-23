function val2=splcubic(alfa,td,x)
M=length(x);
N=length(td);
ax = x'*ones(1,N);
at = ones(M,1)*td';
A = abs(ax-at).^3;

val2=A*alfa(1:N)+alfa(N+1)*ones(M,1)+alfa(N+2)*x';