%% DM FUNCTION
% This help function is given four values (N,d,delta,gamma) and returns the
% x-vector (x_vec), the approximated solution (w_vec), and the analytical 
% solution (u_vec).

function [h, x_vec, w_vec, u_vec] = DM(N,d,delta,gamma)

% BOUNDARY VALUE
wN = delta;


% ANONYMOUS FUNCTIONS
f = @(x) d*cos(2*x);
u = @(x) (delta-(d/12))*cos(4*x) + (gamma/4)*sin(4*x) + (d/12)*cos(2*x);


% INTERVAL
x_0 = 0;                            % Start
x_N = 2*pi;                         % End
h = (x_N-x_0)/N;                    % Step
x_vec = (x_0:h:x_N)';               % x-vector (the interval)
x_inner = x_vec(2:end-1);           % Inner points


% ANALYTICAL SOLUTION
u_vec = zeros(N+1,1);
for i=1:length(x_vec)
    u_vec(i) = u((i-1)*h);
end


% APPROXIMATED SOLUTION

% Matrix (A)
d0 = (16*(h^2)-2) * ones(N-1,1); %huvuddiagonal
d1 = ones(N-2, 1);
A = diag(d0,0) + diag(d1,1) + diag(d1,-1);
A(1,:) = [(16*(h^2)-(2/3)) , 2/3 , zeros(1,length(A)-2)];

% Right-hand side (b)
b = (h^2) * f(x_inner);
b(1) = b(1) + ((2/3)*h*gamma);
b(end) = b(end) - wN;

% Solution vector (w_vec)
w_inre = A\b;
w0 = (-1/3) * (-4*w_inre(1) + w_inre(2) + ( 2*h*gamma) );
w_vec = [w0 ; w_inre ; wN];
