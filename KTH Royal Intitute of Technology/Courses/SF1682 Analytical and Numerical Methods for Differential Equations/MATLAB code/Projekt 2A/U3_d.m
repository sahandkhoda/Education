%% U3 d)
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
u_analytic = @(x,t) sin(5*pi*x) * exp(-25*pi^2*0.01);


% === INTERVAL ===

% Define the computational space
x0 = 0;
xN = 1;
t0 = 0;
tM = 0.01;

N = 100;                        % Iterations for space
M_vec = [150 200 1000];         % Iterations for time


for i=1:3

    dx = (xN-x0) / N;           % Step length in space
    dt = (tM-t0) / M_vec(i);    % Step length in time
    sigma = (D*dt) / (dx^2);
    
    x_vec = (x0:dx:xN)';        % All points in space
    x_inner = x_vec(2:end-1);   % Inner points (N-1 in total) in space
    t_vec = (t0:dt:tM)';        % All points in time
    
    
    % === SOLUTION MATRIX ===
    
    % Define the solution matrix.
    % Note the number of elements: each column (representing a fixed point 
    % in space) corresponds to approximations at a point in time.
    
    % The solution matrix
    SOLMAT = zeros(N-1 , M_vec(i)+1);
    
    % Boundary values for the first column, i.e., the first point in space.
    IV = IV_x_0(x_inner);
    SOLMAT(:,1) = IV;
    
    % Create the system matrix in three steps (xN = 1??);
    m1 = -2 * diag(ones(1,N-1));        % Main  diagonal
    m2 = 1 * diag(ones(1,N-2), 1);      % Upper diagonal
    m3 = 1 * diag(ones(1,N-2), -1);     % Lower diagonal
    %tridiagmat = sparse(m1 + m2 + m3);
    A = (m1 + m2 + m3);
    
    % Step in time - iterate with the matrix formula
    for j = 1:M_vec(i)
        SOLMAT(:,j+1) = SOLMAT(:,j) + sigma.* (A * SOLMAT(:,j));
    end
    
    % Add boundary values to the solution
    w_mat = [zeros(1,M_vec(i)+1); SOLMAT; zeros(1,M_vec(i)+1)];
    
    % Absolute error vector
    u_vec = u_analytic(x_vec);    
    error_vec = abs(u_vec - w_mat(:,M_vec(i)+1));

    % Plot
    figure(1)
    subplot(3,1,i)
    %hold on
    plot(x_vec,error_vec);
    title('Plot for M:', M_vec(i));
    
end



N = 500;                        % Iterations for space
M_vec = [4900 5000 6000];       % Iterations for time


for i=1:3

    dx = (xN-x0) / N;           % Step length in space
    dt = (tM-t0) / M_vec(i);    % Step length in time
    sigma = (D*dt) / (dx^2);
    
    x_vec = (x0:dx:xN)';        % All points in space
    x_inner = x_vec(2:end-1);   % Inner points (N-1 in total) in space
    t_vec = (t0:dt:tM)';        % All points in time
    
    
    % === SOLUTION MATRIX ===
    
    % Define the solution matrix.
    % Note the number of elements: each column (representing a fixed point 
    % in space) corresponds to approximations at a point in time.
    
    % The solution matrix
    SOLMAT = zeros(N-1 , M_vec(i)+1);
    
    % Boundary values for the first column, i.e., the first point in space.
    IV = IV_x_0(x_inner);
    SOLMAT(:,1) = IV;
    
    % Create the system matrix in three steps (xN = 1??);
    m1 = -2 * diag(ones(1,N-1));        % Main  diagonal
    m2 = 1 * diag(ones(1,N-2), 1);      % Upper diagonal
    m3 = 1 * diag(ones(1,N-2), -1);     % Lower diagonal
    %tridiagmat = sparse(m1 + m2 + m3);
    A = (m1 + m2 + m3);
    
    % Step in time - iterate with the matrix formula
    for j = 1:M_vec(i)
        SOLMAT(:,j+1) = SOLMAT(:,j) + sigma.* (A * SOLMAT(:,j));
    end
    
    % Add boundary values to the solution
    w_mat = [zeros(1,M_vec(i)+1); SOLMAT; zeros(1,M_vec(i)+1)];
    u_vec = u_analytic(x_vec);
    
    error_vec = abs(u_vec - w_mat(:,M_vec(i)+1));
    figure(2)
    subplot(3,1,i)
    %hold on
    plot(x_vec,error_vec);
    title('Plot for M:',M_vec(i));
    

end


N = 1000;                       % Iterations for space
M_vec = [19900 20000 23000];    % Iterations for time


for i=1:3

    dx = (xN-x0) / N;           % Step length in space
    dt = (tM-t0) / M_vec(i);    % Step length in time
    sigma = (D*dt) / (dx^2);
    
    x_vec = (x0:dx:xN)';        % All points in space
    x_inner = x_vec(2:end-1);   % Inner points (N-1 in total) in space
    t_vec = (t0:dt:tM)';        % All points in time
    
    
    % === SOLUTION MATRIX ===
    
    % Define the solution matrix.
    % Note the number of elements: each column (representing a fixed point 
    % in space) corresponds to approximations at a point in time.
    
    % The solution matrix
    SOLMAT = zeros(N-1 , M_vec(i)+1);
    
    % Boundary values for the first column, i.e., the first point in space.
    IV = IV_x_0(x_inner);
    SOLMAT(:,1) = IV;
    
    % Create the system matrix in three steps (xN = 1??);
    m1 = -2 * diag(ones(1,N-1));        % Main  diagonal
    m2 = 1 * diag(ones(1,N-2), 1);      % Upper diagonal
    m3 = 1 * diag(ones(1,N-2), -1);     % Lower diagonal
    %tridiagmat = sparse(m1 + m2 + m3);
    A = (m1 + m2 + m3);
    
    % Step in time - iterate with the matrix formula
    for j = 1:M_vec(i)
        SOLMAT(:,j+1) = SOLMAT(:,j) + sigma.* (A * SOLMAT(:,j));
    end
    
    % Add boundary values to the solution
    w_mat = [zeros(1,M_vec(i)+1); SOLMAT; zeros(1,M_vec(i)+1)];
    u_vec = u_analytic(x_vec);
    
    error_vec = abs(u_vec - w_mat(:,M_vec(i)+1));
    figure(3)
    subplot(3,1,i)
    %hold on
    plot(x_vec,error_vec);
    title('Plot for M:',M_vec(i));
    

end
