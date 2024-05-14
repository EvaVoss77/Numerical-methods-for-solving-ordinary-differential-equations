# Carga la condicion inicial
u0 = [1 -1 0 0 0 0 1 -1];
Tini=0; # Tiempo inicial
Tfin=pi; # Tiempo final
global it;
it = 0;

function xdot = myff (x, t)
  global it;
  G =1;
  M = 4/G;
  d = ((x(1)-x(2))^2+(x(3)-x(4))^2)^(3/2);
  
  xdot(1) = x(5);                 %x1
  xdot(2) = x(6);                 %x2
  xdot(3) = x(7);                 %y1
  xdot(4) = x(8);                 %y2
  xdot(5) = M*G*(x(2)-x(1))/d;    %v1
  xdot(6) = -xdot(5);             %v2
  xdot(7) = M*G*(x(4)-x(3))/d;    %u1
  xdot(8) = -xdot(7);             %u2
  it++;
endfunction

d=1;
h = zeros(10,1);
c = zeros(10,4);
j = 1;


for i = 100 : 100 : 1000
  %Comparo los radios de la circunferencia esperada r = 1 con la circunferencia obtenida (x^2 + y^2)^(0.5)
  t=linspace(Tini, Tfin, i);
  u = zeros(i,8);
  
  u = MetodoTheta("myff", u0, t, 0);
  c(j,1) = it;
  it = 0;
  
  u = MetodoTheta("myff", u0, t, 0.5);
  c(j,2) = it;
  it = 0;
  
  u = MetodoTheta("myff", u0, t, 1);
  c(j,3) = it;
  it = 0;
  
  u = lsode("myff", u0, t);
  c(j,4) = it;
  it = 0;
  
  h(j,1) = (Tfin-Tini)/i;
  j++;
endfor

[C,H] = logspace(c(:,1), h(:,1));

figure
loglog(H, C, 'o-r;Euler Explicito;'
        h(:,1), c(:,1), 'o-r;Euler Explicito;', 
         h(:,1), c(:,2), 'd-m;Crank-Nicolson;', 
         h(:,1), c(:,3), 'x-c;Euler Implicito;',
         h(:,1), c(:,4), 's-b;lsode;');