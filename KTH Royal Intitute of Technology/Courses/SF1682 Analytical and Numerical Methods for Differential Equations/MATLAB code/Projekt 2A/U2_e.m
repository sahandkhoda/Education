%% U2 e)
% _________________________________________________________________________

close all; clear; clc;

% === CONDITIONS ===

N_vec = [50 100 200 400 800 1600]'; % Iterations
d = 5;                              % Arbitrary constant in f(x)
gamma = 1;                          % Boundary value of first point: u'(0)
delta = 1;                          % Boundary value of last point:  u(2*pi)


% === PREALLOCATE ===

h_vec = zeros(length(N_vec),1);             % Step length for each N
max_error_vec = zeros(length(N_vec),1);     % Max error for each N
discrete2_vec = zeros(length(N_vec),1);     % Discrete 2-norm for each N


% === LOOP ===

figure_number = 0;
for i = 1:length(N_vec)
    
    % DM HELP FUNCTION
    N = N_vec(i);
    [h_vec(i), x_vec, w_vec, u_vec] = DM(N,d,gamma,delta);
    

    % ABSOLUTE ERROR AND DISCRETE 2-NORM (EUCLIDEAN NORM)
    r_vec = w_vec(1:end) - u_vec(1:end);    % Difference between w and u
    error_vec = abs(r_vec);                 % Absolute error
    max_error_vec(i) = max( abs(r_vec) );   
    discrete2_vec(i) = sqrt( (1/(N+1)) * sum(r_vec.^2) );


    % PLOT
    figure_number = i;
    figure(figure_number)

    % Subplot 1 : Approximate vs. Analytical
    subplot(2,1,1);
    plot(x_vec, w_vec, 'ro')
    hold on
    plot(x_vec, u_vec, 'b')
    legend('Approximate', 'Analytical')
    xlabel('x-position')
    ylabel('y-position')
    title('Approximate solution vs. Analytical solution')
   
    % Subplot 2 : Absolute error
    subplot(2,1,2);
    plot(x_vec, error_vec, 'b')
    xlabel('x-position')
    ylabel('Absolute error')
    title('Absolute error at position x')

    sgtitle('COMPARISON OF APPROXIMATE AND ANALYTICAL SOLUTION')
    hold off

end


% === FIGURE ===

% Reference curve with slope (p)
% represented as a straight line as a function of h (or h_VEC)
p = 2;
reference = h_vec.^p;

% Plot
figure(figure_number+1)
loglog(h_vec, reference, 'black');
hold on
loglog(h_vec, max_error_vec, 'r')
loglog(h_vec, discrete2_vec, 'g')
legend('Reference', 'Max error', 'Discrete 2-norm')
xlabel('x-position')
ylabel('y-position')
title('Order of accuracy comparison')


% === TABLE ===

% Define the columns
N_values = N_vec(1:end-1);
h_values = h_vec(1:end-1);
MAX_ERROR = max_error_vec(1:end-1);
DISCRETE_2_NORM = discrete2_vec(1:end-1);

% Calculation of the order of accuracy (p)
p_values = zeros(length(N_values),1);
for k = 1:length(N_values)
    p_values(k) = log( discrete2_vec(k) ./ discrete2_vec(k+1) ) / log(2);
end

% Create the table
p_table = table(N_values, h_values, MAX_ERROR, DISCRETE_2_NORM, p_values);

% Display the table
disp(p_table);