%% U4 b)-d)
% Heat diffusion in one dimensional wire with the Crank-Nicholson method.
% _________________________________________________________________________

close all; clear; clc;
format long g; 

% === ANONYMOUS FUNCTIONS ===

% Analytical function
u_fcn = @(x,t) sin(exp(t)*x);

% Initial value function
IV_fcn = @(x) u_fcn(x,0);

% f(x,t)
f_fcn = @(x,t) exp(t) * x .* cos(exp(t) * x) + exp(2*t) * sin(exp(t)*x);

% Dirichlet boundary values
TL_fcn = @(t) t*0;                  % BV at the first point in space
TR_fcn = @(t) sin(exp(t));          % BV at the last point in space


% === INTERVAL ===

% Define the computational space
x0 = 0;                     % Start point
xN = 1;                     % End point
t0 = 0;                     % Start time
tM = 0.1;                   % End time

N = 100;                    % Iterations for space
M = 100;                    % Iterations for time

D = 1;                      % Heat transfer coefficient
dx = (xN-x0) / N;           % Step length in space
dt = (tM-t0) / M;           % Step length in time
sigma = (D*dt) / (dx^2);    % Constant

x_vec = (x0:dx:xN)';        % All points in space
x_inner = x_vec(2:end-1);   % Inner points (N-1 in total) in space
t_vec = (t0:dt:tM)';        % All points in time


% === SOLUTION MATRIX ===

% Create the LEFT system matrix in three steps (three ways):
L1 = (2+2*sigma) * diag(ones(1,N-1));       % Main  diagonal
L2 = (-1*sigma) * diag(ones(1,N-2), 1);     % Upper diagonal
L3 = (-1*sigma) * diag(ones(1,N-2), -1);    % Lower diagonal
tridiagmat_L = sparse(L1 + L2 + L3);
AL = (L1 + L2 + L3);
A = spdiags([-1*sigma*ones(N-1,1) (2+2*sigma)*ones(N-1,1) -1*sigma*ones(N-1,1)], -1:1, N-1, N-1);

% Create the RIGHT system matrix in three steps (three ways):
R1 = (2+2*sigma) * diag(ones(1,N-1));       % Main  diagonal
R2 = (sigma) * diag(ones(1,N-2), 1);        % Upper diagonal
R3 = (sigma) * diag(ones(1,N-2), -1);       % Lower diagonal
tridiagmat_R = sparse(R1 + R2 + R3);
AR = (R1 + R2 + R3);
B = spdiags([sigma*ones(N-1,1) (2-2*sigma)*ones(N-1,1) sigma*ones(N-1,1)], -1:1, N-1, N-1);

% The solution matrix
w_mat = zeros(N-1 , M+1);

% Initial condition (IV):
% The initial temperature of the wire at every point in space, 
% i.e., the temperature for every row in the first column.
w_mat(:,1) = IV_fcn(x_inner);

% Boundary conditions (BV):
% The temperature of the wire at the boundaries at any time.
row_upper = TL_fcn(t_vec');
row_lower = TR_fcn(t_vec');
s_vec = zeros(N-1,1);

for j = 1:M
    s_vec(1) = row_upper(j) + row_upper(j+1);
    s_vec(end) = row_lower(j) + row_lower(j+1);
    w_mat(:,j+1) = A \ ( (B*w_mat(:,j)) + sigma*s_vec + ( dt*(f_fcn(x_inner,dt*(j-1)) + f_fcn(x_inner,dt*(j)) ) ) );
end

% Extending the matrix by adding the upper and lower rows
solmat = [row_upper; w_mat; row_lower];

% Analytical matrix
u_matrix = zeros(size(solmat));
for j = 1:M+1
    u_matrix(:,j) = u_fcn(x_vec,(j-1)*dt);
end

% Analytical vector
u_vec = u_matrix(:,end);
solvec = u_fcn(x_vec, 0.1);

% Error vector
error_vec = abs(solvec - solmat(:,end));


% === FIGURE ===

figure(1)

% Subplot 1 : Approximate vs. Analytical 
subplot(2,1,1)
plot(x_vec, solmat(:,end), 'r')
hold on
plot(x_vec, solvec, 'b')
xlabel('x-position')
ylabel('Temperature (u)')
title('Approximate solution vs. Analytical solution') 

% Subplot 2 : Absolute error
subplot(2,1,2)
plot(x_vec, error_vec,'r')
xlabel('x-position')
ylabel('Absolute error')
title('Absolute error at position x') 
hold off