%% U2 c)-d)
% _________________________________________________________________________

close all; clear; clc;

% === CONDITIONS ===

N = 400;                    % Iterations
d = 5;                      % Arbitrary constant in f(x)
gamma = 1;                  % Boundary value of first point: u(0)_prim
delta = 1;                  % Boundary value of last point:  u(2*pi)


% === DM HELP FUNCTION ===
[h, x_vec, w_vec, u_an] = DM(N,d,delta,gamma);


% === ERROR VECTOR ===
error_vec = abs( u_an(1:end) - w_vec(1:end) );


% === FIGURES ===
figure(1)

% Subplot 1 : Approximate vs. Analytical
subplot(2,1,1)
plot(x_vec, w_vec, 'ro')
hold on
plot(x_vec, u_an, 'b')
legend('Approximate', 'Analytical')
xlabel('x-position')
ylabel('y-position')
title('Approximate solution vs. Analytical solution')

% Subplot 1 : Absolute error
subplot(2,1,2)
plot(x_vec, error_vec,'r');
xlabel('x-position')
ylabel('Absolute error')
title('Absolute error at position x')

sgtitle('COMPARISON OF APPROXIMATE AND ANALYTICAL SOLUTION')
