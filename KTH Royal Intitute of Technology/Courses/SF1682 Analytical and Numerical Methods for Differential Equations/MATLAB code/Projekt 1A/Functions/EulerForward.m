% EULER FORWARD METHOD (FE)

% === DESCRIPTION ===
% Every row in the [(n+1) X 3] matrix "s" is of the form:
% [x(t) , y(t) , theta(t)]

% ____________________________________________

function [t_vec, s_vec] = EulerForward(f, tspan, s0, n)

% === TIME ===

% Time interval
a = tspan(1);
b = tspan(2);

% Time step
h = (b - a) / n;

% Time vector with descreet times
t_vec = (a:h:b)';


% === MATRIX ===

% Creating the matrix
s_vec = zeros(n+1, 3);

% Initial value
s_vec(1,:) = s0;


% === FE WITH n STEPS ===

for i = 1:n

    s_vec(i+1,:) = s_vec(i,:) + h*(f(t_vec(i), s_vec(i,:)));

end

end