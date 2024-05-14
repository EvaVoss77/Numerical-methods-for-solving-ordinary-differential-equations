function v = velocity(vx, vy, n, M)
  v = zeros(n,1);
  for i = 1:n
    v(i,1) = M*(vx(i)^2+vy(i)^2)/2; 
  endfor
