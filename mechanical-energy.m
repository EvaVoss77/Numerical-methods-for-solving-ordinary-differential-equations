Tini=0; # Tiempo inicial
Tfin=pi; # Tiempo final
n=2000; # Instantes de tiempo donde se evaluara la solucion

G = 6.674*10^-11;

M = 4/G;
m = 4/G;

# Carga la condicion inicial
u0 = [1 -1 0 0 0 0 1/2 -1/2];
# Evaluaremos en "n" puntos equiespaciados entre Tini y Tfin
t=linspace(Tini, Tfin, n);
v = zeros(n,4);
p = zeros(n,4);
EM = zeros(n,4);
# Llamamos al integrador (ver tambien funcion "lsode" de octave)

u1 = MetodoTheta("myf", u0, t, 0);     %Euler Explicito
v(:,1) = cinetica(u1(:,5),u1(:,7),n ,m) + cinetica(u1(:,5),u1(:,7),n, M);
p(:,1) = potencial(u1(:,1),u1(:,2),u1(:,3),u1(:,4),n, m, M);

u2 = MetodoTheta("myf", u0, t, 0.5);  %CN
v(:,2) = cinetica(u2(:,5),u2(:,7),n ,m) + cinetica(u2(:,5),u2(:,7),n ,M);
p(:,2) = potencial(u2(:,1),u2(:,2),u2(:,3),u2(:,4),n, m, M);

u3 = MetodoTheta("myf", u0, t, 1);    %Euler Implicito
v(:,3) = cinetica(u3(:,5),u3(:,7),n ,m) + cinetica(u3(:,5),u3(:,7),n ,M);
p(:,3) = potencial(u3(:,1),u3(:,2),u3(:,3),u3(:,4),n ,m ,M);

u4 = lsode("myf", u0, t);             %lsode
v(:,4) = cinetica(u4(:,5),u4(:,7),n ,m) + cinetica(u4(:,5),u4(:,7),n,M);
p(:,4) = potencial(u4(:,1),u4(:,2),u4(:,3),u4(:,4),n,m,M);

EM = v + p;

# Graphs of mechanical, potential, and kinetic energies as functions of time with each of the methods
figure
plot(t, EM(:,1), '-;Euler Explicito;',
     t, EM(:,2), ';Crank-Nicolson;', 
     t, EM(:,3), '-;Euler Implicito;',
     t, EM(:,4), '-;lsode;');
title("Energia Mecanica");
     
figure
plot(t, p(:,1), '-;Euler Explicito;',
     t, p(:,2), ';Crank-Nicolson;', 
     t, p(:,3), '-;Euler Implicito;',
     t, p(:,4), '-;lsode;');
title("Energia Potencial"); 
 
figure
plot(t, v(:,1), '-;Euler Explicito;',
     t, v(:,2), ';Crank-Nicolson;', 
     t, v(:,3), '-;Euler Implicito;',
     t, v(:,4), '-;lsode;');
title("Energia Cinetica");