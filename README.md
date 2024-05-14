There are various methods for solving ordinary differential equations of the form $\dot{y}=f(y,t)$. In this work, the theta method  (`MetodoTheta()`) and the lsode (the standard function in Octave `lsode()`) routine of Octave will be implemented for analyzing the orbits and energies of two bodies with masses $M_1$ and $M_2$ subjected to gravitational forces. Four second-order differential equations will be solved by transforming them into a system of first-order equations with eight unknowns, and the computational cost and error resulting from solving the problem using different methods will be analyzed. The theta method consists of calculating the variable $y$ at a time $t_{n}+h$ by the equation
$$y_{n+1} =y_n+h(\theta f_{n+1}+(1-\theta f_n)),$$
where the data function is denoted as $f_j = f(y_j,t_j)$. Different behaviors in the method are observed by varying the parameter $\theta$. In this work, the values of theta $\theta = 0$, $\theta = 1$, and $\theta =0.5$ will be used, corresponding to the explicit Euler method, implicit Euler method, and Crank-Nicolson method, respectively.

The equations governing the motion of two masses subjected to gravitational force are

$$\frac{\mathrm{d}^2 \vec{r}_1(t) }{\mathrm{d} t^2} = \frac{G M_2 (\vec{r}_2(t)-\vec{r}_1(t))}{|\vec{r}_2(t)-\vec{r}_1(t)|^3}$$

$$\frac{\mathrm{d}^2 \vec{r}_2(t) }{\mathrm{d} t^2} = \frac{G M_1 (\vec{r}_1(t)-\vec{r}_2(t))}{|\vec{r}_2(t)-\vec{r}_1(t)|^3}$$
 
Decomposing into Cartesian coordinates:
$$\ddot{x}_1 = \frac{G M_2 (x_2-x_1)}{[(x_2-x_1)^2+(y_2-y_1)^2]^\frac{3}{2}}$$

$$\ddot{x}_2 = \frac{G M_1 (x_1-x_2)}{[(x_2-x_1)^2+(y_2-y_1)^2]^\frac{3}{2}}$$

$$\ddot{y}_1 = \frac{G M_2 (y_2-y_1)}{[(x_2-x_1)^2+(y_2-y_1)^2]^\frac{3}{2}}$$

$$\ddot{y}_2 = \frac{G M_1 (y_1-y_2)}{[(x_2-x_1)^2+(y_2-y_1)^2]^\frac{3}{2}}$$

Bringing it to a system of ordinary differential equations using the variable changes $\dot{x}_1 = v_1$, $\dot{x}_2 = v_2$, $\dot{y}_1 = u_1$, and $\dot{y}_2 = u_2$, we obtain the system of eight equations with eight unknowns

$$\dot{v}_1 = \frac{G M_2 (x_2-x_1)}{[(x_2-x_1)^2+(y_2-y_1)^2]^\frac{3}{2}}$$

$$\dot{v}_2 = \frac{G M_1 (x_1-x_2)}{[(x_2-x_1)^2+(y_2-y_1)^2]^\frac{3}{2}}$$

$$\dot{u}_1 = \frac{G M_2 (y_2-y_1)}{[(x_2-x_1)^2+(y_2-y_1)^2]^\frac{3}{2}}$$

$$\dot{u}_2 = \frac{G M_1 (y_1-y_2)}{[(x_2-x_1)^2+(y_2-y_1)^2]^\frac{3}{2}}$$

$$\dot{x}_1 = v_1$$

$$\dot{x}_2 = v_2$$

$$\dot{y}_1 = u_1$$

$$\dot{y}_2 = u_2$$ 

For this system, we will work with the initial conditions
$$[x_1, x_2, y_1, y_2, v_1, v_2, u_1, u_2] = [1, -1, 0, 0, 0, 0, 1/2, -1/2]$$
$$[x_1, x_2, y_1, y_2, v_1, v_2, u_1, u_2] = [1, -1, 0, 0, 0, 0, 1, -1]$$

We will analyze the conservation of mechanical energy
$$E_M = \frac{1}{2} M_1 (\dot{x}_1^2+\dot{y}_1^2) 
        + \frac{1}{2} M_2 (\dot{x}_2^2+\dot{y}_2^2)
        - \frac{G M_1 M_2}{[(x_2-x_1)^2+(y_2-y_1)^2]^\frac{1}{2}}
        = constant$$
for each condition with each method.

In `error-of-each-method`, the error after one orbit is plotted against the time step for each method.

The computational cost of each method is compared in two ways:
1. In `runtime-of-each-method`, it is done according to the execution time.
2. In `iterations-of-each-method`, it is done based on the number of times the function $\vec{f}$ is evaluated after one orbit.


Lastly, in `mechanical-energy`, the mechanical energy of the system is analyzed with the results obtained for each method with a time step $h = \frac{\pi}{2000}$ and the initial conditions

$$\vec{r}_1(0) = (1,0)$$

$$\dot{\vec{r}}_1(0) = (0,1/2)$$

$$\vec{r}_2(0) = (-1,0)$$

$$\dot{\vec{r}}_2(0) =  (0,-1/2)$$

The mechanical energy is calculated as the sum of the kinetic energy obtained through `cinetica()` and the potential energy obtained through `potencial()`.
