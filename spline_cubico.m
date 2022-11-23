%Método de interpolación Splines Cúbicos

function T=spline_cubico(x,y)
n=length(x);
xx = 1:length(x); %para la tabla
format short
for i=1:n-1
    h(i)=x(i+1)-x(i);
end
 
for i=2:n-1
    alfa(i)=3/h(i)*(y(i+1)-y(i))-3/h(i-1)*(y(i)-y(i-1));
    %esta es la b del sistema Ax=b
end

%Esto es para resolver el sistema tridiagonal que queda Ax=b
%x = [c(i)..], usando el método LU
l(1)=1;
mu(1)=0;
z(1)=0;
 
for i=2:n-1
    l(i)=2*(x(i+1)-x(i-1))-h(i-1)*mu(i-1);
    mu(i)=h(i)/l(i);
    z(i)=(alfa(i)-h(i-1)*z(i-1))/l(i);
end
 
l(n)=1;
z(n)=0;
c(n)=0;
b(n)=0; %sólo para poder mostrar la tabla
d(n)=0; %sólo para poder mostrar la tabla

for i=n-1:-1:1
    c(i)=z(i)-mu(i)*c(i+1); %hasta aquí se resuelve el sistema tridiagonal
    b(i)=(y(i+1)-y(i))/h(i)-h(i)*(c(i+1)+2*c(i))/3; 
    d(i)=(c(i+1)-c(i))/(3*h(i));
end 
 xx=xx';
 x=x';
 y=y';
 b=b';
 c=c';
 d=d'; 
 T = [xx,x,y,b,c,d];
 for i=1:n-1
    xxx=x(i):0.1:x(i+1);
    yy=y(i)+b(i)*(xxx-x(i))+c(i)*(xxx-x(i)).^2+d(i)*(xxx-x(i)).^3;
    %S = [xxx' yy'] %Muestra los valores en los intervalos

    hold on;
    grid on;
    plot(xxx,yy,'b'); %Plotea todos los segmentos [x(k),x(k+1)]
    hold on;
    axis([-0.1 -2 -0.1 2])
    plot (x(i),y(i),'r-*'); %Plotea los puntos dados originalmente
    title('Interpolación por splines cúbicos');
 end
end