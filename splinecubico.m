function alfa=splinecubico(td,y)
A = matrizcubica(td); %matriz con los datos a interpolar
b = [y;0;0]; %y = f(xi) 
alfa = A\b %esta línea resuelve la matriz dada por las interpolaciones 
%y encuentra los alfa_i y los beta_i de la fórmula general