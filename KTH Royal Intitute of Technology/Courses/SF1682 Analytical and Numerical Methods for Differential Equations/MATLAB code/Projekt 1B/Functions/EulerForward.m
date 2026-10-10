% EULER FORWARD METHOD (FE)

% === DESCRIPTION ===
% This function approximately integrates with respect to time using the 
% Euler foward (FE) method. % Every row in the [(N+1) X 4] matrix "z_vec" 
% is of the form: [z1(t) , z2(t) , z1prim(t) , z2prim(t)].

% === PARAMETERS ===
%   qc          : "quartercar" function
%   tspan       : time vector (start and end values)
%   z0          : initial values
%   h           : time step
%   t_vec       : time vector with descreet times
%   z_mat       : the solution matrix

% ____________________________________________

function [t_vec, z_mat] = EulerForward(qc, tspan, z0, h)

% === TIME INTERVAL ===

t_start = tspan(1);
t_end   = tspan(2);
t_vec = (t_start:h:t_end)';


% === CALCULATIONS ===

N = floor( (t_end - t_start) / h );     % KOLLA ALTERNATIVT SKRIVSÄTT!!!


% === MATRIX ===

z_mat = zeros(N+1,4);       % Creating the matrix
z_mat(1,:) = z0;            % Initialization

for i = 1:N
    z_mat(i+1,:) = z_mat(i,:) + h*(qc(t_vec(i), z_mat(i,:)))';
end