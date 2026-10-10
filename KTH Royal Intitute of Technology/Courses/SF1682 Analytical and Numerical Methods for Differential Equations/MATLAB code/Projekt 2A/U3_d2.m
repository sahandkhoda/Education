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

% delta_t <= (1/2) * (delta_x)^2;
% delta x = (xN - x0) / N;
% delta t = (tN - t0) / M;

N_vec = [100 500 1000];                                         % Iterations for space
M_mat = [150 200 1000; 4900 5000 6000 ; 19900 20000 23000];     % Iterations for time

figure_number = 0;
for n = 1:length(N_vec)

    figure_number = figure_number + 1;
    figure(figure_number)

    for m = 1:length(M_mat)

        % Iteration index
        N = N_vec(n);
        M = M_mat(n,m);

        % Values
        dx = (xN-x0) / N;           % Step length in space
        dt = (tM-t0) / M;           % Step length in time
        sigma = (D*dt) / (dx^2);

        % Intervals
        x_vec = (x0:dx:xN)';        % All points in space
        x_inner = x_vec(2:end-1);   % Inner points (N-1 in total) in space
        t_vec = (t0:dt:tM)';        % All points in time


        % === SOLUTION MATRIX ===
    
        % Define the solution matrix.
        % Note the number of elements: each column (representing a fixed point 
        % in space) corresponds to approximations at a point in time.
        
        % The solution matrix
        w_mat = zeros(N-1,M+1);
        
        % Boundary values for the first column, i.e., the first point in space.
        IV = IV_x_0(x_inner);
        w_mat(:,1) = IV;

        % Create the system matrix in three steps (xN = 1??);
        d1 = -2 * diag(ones(1,N-1));        % Main  diagonal
        d2 = 1 * diag(ones(1,N-2), 1);      % Upper diagonal
        d3 = 1 * diag(ones(1,N-2), -1);     % Lower diagonal
        %tridiagmat = sparse(m1 + m2 + m3);
        A = (d1 + d2 + d3);
        
        % Step in time - iterate with the matrix formula
        for j = 1:M
            w_mat(:,j+1) = w_mat(:,j) + sigma.* (A * w_mat(:,j));
        end
        
        % Add boundary values to the solution
        solmat = [zeros(1,M+1); w_mat; zeros(1,M+1)];

        % Absolute error vector
        u_vec = u_analytic(x_vec);    
        error_vec = abs(u_vec - solmat(:,end));
    
        % Plot
        
        subplot(3,1,m)
        plot(x_vec,error_vec);
        xlabel('x-position')
        ylabel('Temperature (u)')
        txt_subplot = ['M = ', num2str(M)];
        title(txt_subplot);

    end
    txt_sgtitle = ['Comparison for N = ', num2str(N)]; 
    sgtitle(txt_sgtitle)

end