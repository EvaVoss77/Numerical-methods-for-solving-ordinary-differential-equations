function e = error_paso(func, u0, t, theta)
  
  u = MetodoTheta("myf", u0, t, theta);
  n = size(t)(2);
  
  
  e = abs(1 - (u(n,1)^2+u(n,3)^2)^(0.5));
endfunction
