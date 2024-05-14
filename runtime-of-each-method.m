# Carga la condicion inicial
u0 = [1 -1 0 0 0 0 1 -1];
Tini=0; # Tiempo inicial
Tfin=pi; # Tiempo final

d=1;
h = zeros(10,1);
c = zeros(10,4);
j = 1;
for i = 100 : 100 : 1000
  %Comparo los radios de la circunferencia esperada r = 1 con la circunferencia obtenida (x^2 + y^2)^(0.5)
  t=linspace(Tini, Tfin, i);
  u = zeros(i,8);
  
  tic;
  u = MetodoTheta("myf", u0, t, 0);
  c(j,1) = toc;
  
  tic;
  u = MetodoTheta("myf", u0, t, 0.5);
  c(j,2) = toc;
  
  tic;
  u = MetodoTheta("myf", u0, t, 1);
  c(j,3) = toc;
  
  tic;
  u = lsode("myf", u0, t);
  c(j,4) = toc;
  
  h(j,1) = (Tfin-Tini)/i;
  j++;
endfor

# Comparison of the routine of each of the methods
figure
plot(h(:,1), c(:,1), 'r;Euler Explicito;', 
         h(:,1), c(:,2), 'm;Crank-Nicolson;', 
         h(:,1), c(:,3), 'c;Euler Implicito;',
         h(:,1), c(:,4), 'b;lsode;');
         