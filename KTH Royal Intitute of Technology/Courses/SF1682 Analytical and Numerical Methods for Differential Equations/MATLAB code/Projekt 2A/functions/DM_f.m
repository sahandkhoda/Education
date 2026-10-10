%% DM FUNCTION
% This help function is given four values (N,d,delta,gamma) and returns the
% x-vector (x_vec), the approximated solution (w_vec), and the analytical 
% solution (u_vec).

function [h, x_vec, w_vec] = DM_f(N,delta,gamma)

% === CONDITIONS ===

% Anonymous functions
f = @(x) exp( (-1)*((x-pi).^2) );

% Interval
x0 = 0;                         % Start point
xN = 2*pi;                      % End point
h = (xN-x0)/N;                  % Step
x_vec = (x0:h:xN)';             % x-vector (the length of the rod)
x_inner = x_vec(2:end-1);       % Inner points

% Boundary value at the last point
wN = delta;


% === APPROXIMATE SOLUTION ===

% Matrix (A)
d0 = (16*(h^2)-2) * ones(N-1,1);            % Main diagonal
d1 = ones(N-2, 1);
A = diag(d0,0) + diag(d1,1) + diag (d1,-1);
A(1,:) = [(16*(h^2)-(2/3)) , 2/3 , zeros(1,length(A)-2)];

% Right-hand side (b)
b = (h^2) * f(x_inner);
b(1) = b(1) + ((2/3)*h*gamma);
b(end) = b(end) - wN;

% Solution vector (w_vec)
w_inre = A\b;
w0 = (-1/3) * (-4*w_inre(1) + w_inre(2) + ( 2*h*gamma) );
w_vec = [w0 ; w_inre ; wN];

