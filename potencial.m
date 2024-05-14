function p = potencial(x1, x2, y1, y2, n, M, m)
  
  G = 6.674*10^-11;
  p = zeros(n,1);
  for i = 1 : n
    r = ((x1(i)-x2(i))^2+(y1(i)-y2(i))^2)^(0.5);
    p(i,1)= (-1)*G*M*m/r;
  endfor
