function c = cinetica(vx, vy, n, M)
  c = zeros(n,1);
  for i = 1:n
    c(i,1) = M*(vx(i)^2+vy(i)^2)/2; 
  endfor
