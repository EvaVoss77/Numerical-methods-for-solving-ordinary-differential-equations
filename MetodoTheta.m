
# El vector t indica los puntos en los que se calculara la solucion
# func: string con el nombre de la funcion
# u0: vector (fila) con las condiciones iniciales
# t: vector (columna) con los tiempos

function u = MetodoTheta (func, u0, t, theta)
  n = size(t)(2); # Cantidad de puntos en los que se requiere la solucion
  m = size(u0)(2);# Cantidad de funciones incognita
  u=zeros(n,m); # matriz solucion
  u(1,:) = u0; # Primer punto: condicion inicial

  # Recorremos los siguientes puntos 
   for i = 2:n
    # Evaluamos la funcion func, pasandole como argumentos el punto anterior
    # y el tiempo anterior
    delta = feval(func,u(i-1,:)',t(i-1));
    
    # Calculamos el paso de tiempo (Tactual-Tanterior)
    h = t(i)-t(i-1);
    f = 0;
    
    #En caso de ser un metodo implicito se aproxima la funcion dato 
    #en el punto actual mediante Euler explicito 
    if(theta != 0)
      yaux(1,:) = u(i-1,:) + h*delta;
      f = feval(func,yaux(1,:)',t(i-1));
    endif  
    
    u(i,:) = u(i-1,:) + h*(theta*f(1,:) + (1-theta)*delta);
    # Siguiente punto
  endfor
endfunction