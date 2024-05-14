# Carga la condicion inicial
u0 = [1 -1 0 0 0 0 1 -1];
Tini=0; # Tiempo inicial
Tfin=pi; # Tiempo final

d=1;
h = zeros(100,1);
e = zeros(100,4);
H = zeros(100,1);
E = zeros(100,4);
j = 1;
P = zeros(4,1);
for i = 100 : 100 : 10000
  %Comparo los radios de la circunferencia esperada r = 1 con la circunferencia obtenida (x^2 + y^2)^(0.5)
  t=linspace(Tini, Tfin, i);
  u = zeros(i,8);
  
  u = MetodoTheta("myf", u0, t, 0);
  e(j,1) = abs(1 - (u(i,1)^2+u(i,3)^2)^(0.5));
  
  u = MetodoTheta("myf", u0, t, 0.5);
  e(j,2) = abs(1 - (u(i,1)^2+u(i,3)^2)^(0.5));
  
  u = MetodoTheta("myf", u0, t, 1);
  e(j,3) = abs(1 - (u(i,1)^2+u(i,3)^2)^(0.5));
  
  u = lsode("myf", u0, t);
  e(j,4) = abs(1 - (u(i,1)^2+u(i,3)^2)^(0.5));
  
  h(j,1) = (Tfin-Tini)/i;
  j++;
endfor

E(:,:) = log(e(:,:));
H(:) = log(h(:));

"EE"
polyfit(H(:,1),E(:,1),1)
"CN"
polyfit(H(:,1),E(:,2),1)
"EI"
polyfit(H(:,1),E(:,3),1)
"lsode"
polyfit(H(:,1),E(:,4),1)


# Comparison of the error of each of the methods
figure
loglog(h(:,1), e(:,1), 'r;Euler Explicito;', 
         h(:,1), e(:,2), 'm;Crank-Nicolson;', 
         h(:,1), e(:,3), 'c;Euler Implicito;',
         h(:,1), e(:,4), 'k;lsode;');
         