%% U3 c)
% The heat conduction equation (1D):
%   u_t = D * u_xx + f(x,t)   for t>=0 and x ∈ [0,N]
% 
% Intervals
%   0 <= x <= N
%   0 <= t <= M
% 
% Boundary values
%   u(x,0) = sin(5*pi*x);
%   u(0,t) = 0
%   u(1,t) = 0
% _________________________________________________________________________

close all; clear; clc;
format long;


% === CONDITIONS ===

% Given values
f = @(x,t) 0;               % Function depending on x and t
D = 1;                      % Heat transfer coefficient
T = 0;                      % Dirichlet boundary value at the first point
IV_x_0 = @(x) sin(5*pi*x);  % Initial value (anonymous function)

% Analytic solution at point x and time t=0.01
u_analytic = @(x) sin(5*pi*x) * exp(-25*pi^2*0.01);


% === INTERVAL ===

% Define the computational space
x0 = 0;
xN = 1;
t0 = 0;
tM = 0.01;

N = 100;                        % Iterations for space
M = 1000;                       % Iterations for time

dx = (xN-x0) / N;               % Step length in space
dt = (tM-t0) / M;               % Step length in time
sigma = (D*dt) / (dx^2);

x_vec = (x0:dx:xN)';            % All points in space
x_inner = x_vec(2:end-1);       % Inner points (N-1 in total) in space
t_vec = (t0:dt:tM)';            % All points in time


% === SOLUTION MATRIX ===

% Define the solution matrix.
% Note the number of elements: each column (representing a fixed point 
% in space) corresponds to approximations at a point in time.

% The solution matrix
SOLMAT = zeros(N-1 , M+1);

% Boundary values for the first column, i.e., the first point in space.
IV = IV_x_0(x_inner);
SOLMAT(:,1) = IV;

% Create the system matrix in three steps (xN = 1??);
m1 = -2 * diag(ones(1,N-1));            % Main  diagonal
m2 = 1 * diag(ones(1,N-2), 1);          % Upper diagonal
m3 = 1 * diag(ones(1,N-2), -1);         % Lower diagonal
%tridiagmat = sparse(m1 + m2 + m3);
A = (m1 + m2 + m3);
%spy(A)

% Step in time - iterate with the matrix formula
for j = 1:M
    SOLMAT(:,j+1) = SOLMAT(:,j) + sigma.* (A * SOLMAT(:,j));
end

% Add boundary values to the solution
w_mat = [zeros(1,M+1); SOLMAT; zeros(1,M+1)];

% Absolute error vector
u_vec = u_analytic(x_vec);
error_vec = abs( w_mat(:,end) - u_vec );

% Plot
figure(1)

% Subplot 1 : Approximate vs. Analytical
subplot(2,1,1)
plot(x_vec, w_mat(:,end), 'ro')
hold on
plot(x_vec, u_vec, 'b')
legend('Approximate', 'Analytical')
xlabel('x-position')
ylabel('Temperature (u)')
title('Approximate solution vs. Analytical solution')

% Subplot 2 : Absolute error
subplot(2,1,2)
plot(x_vec, error_vec, 'r');
xlabel('x-position')
ylabel('Absolute error')
title('Absolute error')

sgtitle('COMPARISON OF APPROXIMATE AND ANALYTICAL SOLUTION')
hold off