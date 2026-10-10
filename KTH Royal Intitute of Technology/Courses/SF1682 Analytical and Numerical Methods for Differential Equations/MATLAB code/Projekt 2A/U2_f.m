%% U2 f)
% _________________________________________________________________________

close all; clear; clc;

% === CONDITIONS ===
                             % Arbitrary constant in f(x)
N_vec = [50 100 200 400 800]'; % Iterations
gamma_vec = [0 1]';                 % Boundary value of first point: u'(0)
delta_vec = [0 0]';                 % Boundary value of last point:  u(2*pi)

counter = length(gamma_vec);        % # of elements in gamma & delta vector
figure_number = 0;                  % Figure number


% === LOOP ===

for i = 1:length(N_vec)

    % Preallocate
    h_vec = zeros(length(N_vec),1);             % Step length
    max_error_vec = zeros(length(N_vec),1);     % Max error
    discrete2_vec = zeros(length(N_vec),1);     % Discrete 2-norm

    figure_number = figure_number + 1;
    figure(figure_number)

    for j = 1:counter

        % DM HELP FUNCTION
        N = N_vec(i);
        gamma = gamma_vec(j);
        delta = delta_vec(j);
        [h, x_vec, w_vec] = DM_f(N,gamma,delta);
        h_vec(i) = h;
    

        % PLOT
        
        plot(x_vec,w_vec)
        hold on
        
    end

    
end
