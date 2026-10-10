% ANALYTICAL CALCULATION FUNCTION

% === DESCRIPTION ===
% This function analyticaly calculates the exact x- and y-values
% at a given time t using given formulas.
% ____________________________________________

function s_an = s_analytic(tspan, x0, y0, B, D, theta0, n)

% === TIME ===

% Time interval
a = tspan(1);
b = tspan(2);

% Time step
h = (b - a) / n;

% Time vector with descreet times
t_vec = (a:h:b)';


% ==== ANALYTICAL VECTORS ====

% Creating the matrix
s_an = zeros(size(t_vec,1),3);

for i = 1:n+1

    % Calculating the analytical values
    theta_an = D*t_vec(i) + theta0;
    x_an = x0 + B/D * (sin(theta_an)-sin(theta0));
    y_an = y0 - B/D * (cos(theta_an)-cos(theta0));

    % Setting the values in the matrix
    s_an(i,1) = x_an;
    s_an(i,2) = y_an;
    s_an(i,3) = theta_an;

end

end