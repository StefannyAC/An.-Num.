function S = spline2(alfa,xi,x)
M = length(xi);
N = length(x);
unos = ones(M,1);
unos2 = ones(N,1);
A = abs((x'*unos')-unos2*xi).^3;
S = A*alfa(1:M)+alfa(M+1)*unos2+alfa(M+2)*x';
end 