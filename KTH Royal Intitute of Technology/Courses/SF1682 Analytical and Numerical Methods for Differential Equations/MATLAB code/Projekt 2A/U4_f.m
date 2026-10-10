%% U4

% Heat diffusion in one dimensional wire with the Crank-Nicholson method.

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
tM_vec= [1 2 4 8 16];                   % End time

for i = 1:length(tM_vec)

    tM = tM_vec(i);

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
    
    % Create the LEFT system matrix in three steps;
    L1 = (2+2*sigma) * diag(ones(1,N-1));       % Main  diagonal
    L2 = (-1*sigma) * diag(ones(1,N-2), 1);     % Upper diagonal
    L3 = (-1*sigma) * diag(ones(1,N-2), -1);    % Lower diagonal
    tridiagmat_L = sparse(L1 + L2 + L3);
    AL = (L1 + L2 + L3);
    A = spdiags([-1*sigma*ones(N-1,1) (2+2*sigma)*ones(N-1,1) -1*sigma*ones(N-1,1)], -1:1, N-1, N-1);
    
    % Create the RIGHT system matrix in three steps;
    R1 = (2+2*sigma) * diag(ones(1,N-1));       % Main  diagonal
    R2 = (sigma) * diag(ones(1,N-2), 1);        % Upper diagonal
    R3 = (sigma) * diag(ones(1,N-2), -1);       % Lower diagonal
    tridiagmat_R = sparse(R1 + R2 + R3);
    AR = (R1 + R2 + R3);
    B = spdiags([sigma*ones(N-1,1) (2-2*sigma)*ones(N-1,1) sigma*ones(N-1,1)], -1:1, N-1, N-1);
    
    % The solution matrix
    SOLMAT = zeros(N-1 , M+1);
    
    % Initial condition (IV):
    % The initial temperature of the wire at every point in space, 
    % i.e., the temperature for every row in the first column.
    SOLMAT(:,1) = IV_fcn(x_inner);
    
    % Boundary conditions (BV):
    % The temperature of the wire at the boundaries at any time.
    row_upper = TL_fcn(t_vec');
    row_lower = TR_fcn(t_vec');
    s_vec = zeros(N-1,1);
    
    for j = 1:M
    
        s_vec(1) = row_upper(j) + row_upper(j+1);
        s_vec(end) = row_lower(j) + row_lower(j+1);
        SOLMAT(:,j+1) = A \ ( (B*SOLMAT(:,j)) + sigma*s_vec + ( dt*(f_fcn(x_inner,dt*(j-1)) + f_fcn(x_inner,dt*(j)) ) ) );
    
    end
    
    % Extending the matrix by adding the upper and lower rows
    SOLMAT = [row_upper; SOLMAT; row_lower];
    
    solvec = u_fcn(x_vec, tM);
    
    error_vec = abs(solvec - SOLMAT(:,end));
    MAXFEL = max(error_vec);
    
    figure(i)
    plot(x_vec, solvec,'r');
    
    % figure(2)
    % plot(x_vec, SOLMAT(:,end), 'r')
    % hold on
    % plot(x_vec, solvec, 'b')

end