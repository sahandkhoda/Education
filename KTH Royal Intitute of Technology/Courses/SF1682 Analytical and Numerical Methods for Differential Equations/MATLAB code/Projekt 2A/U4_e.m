%% U4 e)

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
tM = 1;                     % End time

N_vec = [100 200 400 800 1600];         % Iterations for space

dx_vec = zeros(length(N_vec),1);
max_error_vec = zeros(length(N_vec),1);     % Max error for each N
discrete2_vec = zeros(length(N_vec),1);     % Discrete 2-norm for each N

for i=1:length(N_vec)

    N = N_vec(i);
    M = 2 * N;                  % Iterations for time
    D = 1;                      % Heat transfer coefficient
    dx = (xN-x0) / N;           % Step length in space
    dt = (tM-t0) / M;           % Step length in time
    
    dx_vec(i) = dx;
    
    sigma = (D*dt) / (dx^2);    % Constant
    
    x_vec = (x0:dx:xN)';        % All points in space
    x_inner = x_vec(2:end-1);   % Inner points (N-1 in total) in space
    t_vec = (t0:dt:tM)';        % All points in time
    
    
    % === SOLUTION MATRIX ===
    
    % Create the LEFT system matrix;
    L1 = (2+2*sigma) * diag(ones(1,N-1));       % Main  diagonal
    L2 = (-1*sigma) * diag(ones(1,N-2), 1);     % Upper diagonal
    L3 = (-1*sigma) * diag(ones(1,N-2), -1);    % Lower diagonal
    tridiagmat_L = sparse(L1 + L2 + L3);
    AL = (L1 + L2 + L3);
    A = spdiags([-1*sigma*ones(N-1,1) (2+2*sigma)*ones(N-1,1) -1*sigma*ones(N-1,1)], -1:1, N-1, N-1);
    
    % Create the RIGHT system matrix;
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
    
    % Analytical matrix
    u_matrix = zeros(size(SOLMAT));
    for j = 1:M+1
        u_matrix(:,j) = u_fcn(x_vec,(j-1)*dt);
    end
    
    % Analytical vector
    u_vec = u_matrix(:,end);
    solvec = u_fcn(x_vec, 1);   
    
     
    % ABSOLUTE ERROR AND DISCRETE 2-NORM (EUCLIDEAN NORM)
    r_vec = SOLMAT(:,end) - solvec;         % Difference between w and u
    error_vec = abs(r_vec);                 % Absolute error
    max_error_vec(i) = max( abs(r_vec) );   
    discrete2_vec(i) = sqrt( (1/(N+1)) * sum(r_vec.^2) );

end


% === TABLE ===

% Define the columns
N_values = N_vec(1:end-1)';
dx_values = dx_vec(1:end-1);
MAX_ERROR = max_error_vec(1:end-1);
DISCRETE_2_NORM = discrete2_vec(1:end-1);

% Calculation of the order of accuracy (p)
p_values = zeros(length(N_values),1);
for k = 1:length(N_values)
    p_values(k) = log( discrete2_vec(k) ./ discrete2_vec(k+1) ) / log(2);
end

% Create the table
p_table = table(N_values, dx_values, MAX_ERROR, DISCRETE_2_NORM, p_values);

% Display the table
disp(p_table);