% ERROR FUNCTION

% === DESCRIPTION ===
% This function calculates the errors of the FE and RK4 methods.
% Note, the time step is indirectly given by the value of "n".
% ____________________________________________

function [error_FE, error_RK4] = FunctionError(n, xFE, yFE, xRK4, yRK4, x_an, y_an)

% Creating the matrices
error_FE  = zeros(n+1,2);
error_RK4 = zeros(n+1,2);

% Calculating the error at every step (approximated value)
for i = 1:n+1

    error_FE(i,1)  = abs( xFE(i)  - x_an(i) );
    error_FE(i,2)  = abs( yFE(i)  - y_an(i) );
    error_RK4(i,1) = abs( xRK4(i) - x_an(i) );
    error_RK4(i,2) = abs( yRK4(i) - y_an(i) );

end

end