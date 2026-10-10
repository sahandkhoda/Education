% DEGREE OF ACCURACY

% === DESCRIPTION ===
% After calculating the errors (in y-value) for a given time step AND the 
% next, this method calculates the degree of accuracy of the FE and RK4 
% methods using a known formula:
%   p = log(error_e(k) / error_e(k+1)) / log(2)
% ____________________________________________

function [p_FE, p_RK4] = DegreeOfAccuracy( ...
    error_yFE_a, error_yRK4_a, ...
    error_yFE_b, error_yRK4_b)

% The degree of accuracy for FE
p_FE  = log( error_yFE_a(end)  / error_yFE_b(end)  ) / log(2);

% The degree of accuracy for RK4
p_RK4 = log( error_yRK4_a(end) / error_yRK4_b(end) ) / log(2);

end