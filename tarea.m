%Vamos a crear la matriz de interpolación y a usarla para interpolar los
%datos de la función de Runge, entre (-2,2)

f = @(x) 1./(1+12*x.^2);
xi = -2:4/10:2; %vector 1fila 11 columnas
x = -2:0.01:2;
yi = f(xi);
y = f(x);
M = length(xi);
N = length(x);
unos = ones(M,1);
unos2 = ones(N,1);
Ai = xi'*unos'; %hay que ponerle el ' para voltear xi
P = [unos xi'];
zeros = [0 0;0 0];
Axi = [abs(Ai - Ai').^3 P; P' zeros]
b = [yi';0;0];
alfa = Axi\b %soluciona el sistema y encuentra los alfai
%En general:
y1 = spline2(alfa,xi,x);


figure
plot(x,y,'b--','LineWidth',1)
hold on
plot(x,y1,'r','LineWidth',2)