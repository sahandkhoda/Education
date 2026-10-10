% ==== RUNGE-KUTTA OF ORDER 4 (RK4) ===
% Every row in the [3 X (n+1)] matrix "s" is of the form:
% [x(t) ; y(t) ; theta(t)]
% ____________________________________________

function [t_vec, s_vec] = RK4(f, tspan, s0, n)

% === TIME ===

% Time interval
a = tspan(1);
b = tspan(2);

% Time step
h = (b - a) / n;

% Time vector with descreet times
t_vec = (a:h:b)';


% === MATRIX ====

% Creating the matrix
s_vec = zeros(n+1, 3);

% Initial value
s_vec(1,:) = s0;


% === RK4 WITH n STEPS ===

for i = 1:n
    
    k1 = f(   t_vec(i)        ,   s_vec(i,:)              );
    k2 = f(   t_vec(i) + h/2  ,   s_vec(i,:) + h/2 * k1   );
    k3 = f(   t_vec(i) + h/2  ,   s_vec(i,:) + h/2 * k2   );
    k4 = f(   t_vec(i) + h    ,   s_vec(i,:) + h   * k3   );
 
    s_vec(i+1,:) = s_vec(i,:) + h/6*(k1 + 2*k2 + 2*k3 + k4);

end

end