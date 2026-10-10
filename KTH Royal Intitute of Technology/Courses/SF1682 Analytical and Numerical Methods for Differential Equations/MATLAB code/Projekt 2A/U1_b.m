%% U1 b)

close all; clear; clc;

% === CONDITIONS ===

% Analytical functions
u = @(x) sin(exp(x));                       % Anonymous function
u_prim = @(x) exp(x) * cos(exp(x));         % Anonymous first derivative

X = 0.75;                                   % Derivation point
u_X = u_prim(X);                            % First derivative of X

% Defining values
k_vec     = (1:1:8);                        % k-vector
h_vec     = (1:length(k_vec))';             % Step
h_inverse = (1:length(k_vec))';             % Inverse step
u_vec     = (1:length(k_vec))';             % Analytical vector

% Preallocate
error_mat = zeros(length(k_vec),3);         % Error matrix


% FINITE DIFFERENCE METHODS

% Approximation with finite difference methods
u_2_prim = (1:1:length(k_vec))';            % Equation (2)
u_6_prim = (1:1:length(k_vec))';            % Equation (6)
u_7_prim = (1:1:length(k_vec))';            % Equation (7)

for i = 1:length(k_vec)
    
    h = 2^-i;
    h_vec(i) = h;
    h_inverse(i) = h^-1;

    u_2_prim(i) = ( u(X+h) - u(X-h) )                   / (2*h) ;
    u_6_prim(i) = ( (-1)*u(X+2*h) + 4*u(X+h) - 3*u(X) ) / (2*h) ;
    u_7_prim(i) = ( 3*u(X) - 4*u(X-h) + u(X-2*h) )      / (2*h) ;

    error_mat(i,1) = abs( u_2_prim(i) - u_X );
    error_mat(i,2) = abs( u_6_prim(i) - u_X );
    error_mat(i,3) = abs( u_7_prim(i) - u_X );

end


% === FIGURE ===

% Reference curve with slope (-p)
% represented as a straight line as a function of 1/h (or h_inverse)
p = 2;
reference = h_inverse.^(-p);

% Plotting the curves
figure(1)
loglog(h_inverse, reference, 'black');
hold on
loglog(h_inverse, error_mat(:,1), 'r')
loglog(h_inverse, error_mat(:,2) ,'g');
loglog(h_inverse, error_mat(:,3) ,'b');
legend('Reference', 'Eq (2)', 'Eq (6)', 'Eq (7)')
hold off
xlabel('h inverse)')
ylabel('Error')
title('Absolute error comparison with reference curve (-p) for different values of "h"');

% Displaying the slope information
slope_text = ['Slope: ' num2str(-p)];
text(h_inverse(1), reference(3), slope_text, 'FontSize', 11);
