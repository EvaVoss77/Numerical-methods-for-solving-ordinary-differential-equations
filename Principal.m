Tini=0; # Tiempo inicial
Tfin=2*pi; # Tiempo final
n=500; # Instantes de tiempo donde se evaluara la solucion

# Carga la condicion inicial
u0 = [1 -1 0 0 0 0 1 -1];
# Evaluaremos en "n" puntos equiespaciados entre Tini y Tfin
t=linspace(Tini, Tfin, n);
# Llamamos al integrador (ver tambien funcion "lsode" de octave)

u = MetodoTheta("myf", u0, t, 0);     %Euler Explicito
u1 = MetodoTheta("myf", u0, t, 0.5);  %CN
u2 = MetodoTheta("myf", u0, t, 1);    %Euler Implicito
u3 = lsode("myf", u0, t);

figure
plot(u(:,1), u(:,3), '-', u(:,2), u(:,4), '-');
axis([-1.5, 1.5, -1.5, 1.5]);
xlabel("x");
ylabel("y");

figure
plot(u1(:,1), u1(:,3), '-', u1(:,2), u1(:,4), '-');
axis([-1.5, 1.5, -1.5, 1.5]);
xlabel("x");
ylabel("y");

figure
plot(u2(:,1), u2(:,3), '-', u2(:,2), u2(:,4), '-');
axis([-1.5, 1.5, -1.5, 1.5]);
xlabel("x");
ylabel("y");

figure
plot(u3(:,1), u3(:,3), '-', u3(:,2), u3(:,4), '-');
axis([-1.5, 1.5, -1.5, 1.5]);
xlabel("x");
ylabel("y");
