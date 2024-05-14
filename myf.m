# Funcion para calcular las derivadas de las funciones incognita,
# a partir de un estado de las variables y del tiempo

function xdot = myf (x, t)
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
  
endfunction