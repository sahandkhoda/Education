%% Komplettering

d = 5;
delta = 1; 
gamma = 1;

% ANONYMOUS FUNCTIONS
f = @(x) d*cos(2*x);
u = @(x) (delta - (d/12)) * cos(4*x) + (gamma/4) * sin(4*x) + (d/12) * cos(2*x);


% INTERVAL
x_0 = 0;                            % Start
x_N = 2*pi;                         % End
h = (x_N-x_0)/N;                    % Step
x_vec = (x_0:h:x_N)';               % x-vector (the interval)
x_inner = x_vec(2:end-1);           % Inner points

x_circle = (0:pi/4:2*pi)';

% ANALYTICAL SOLUTION

u_aaa = u(x_circle);
f_aaa = f(x_circle);

u_vec = zeros(N+1,1);
for i=1:length(x_vec)
    u_vec(i) = u((i-1)*h);
end