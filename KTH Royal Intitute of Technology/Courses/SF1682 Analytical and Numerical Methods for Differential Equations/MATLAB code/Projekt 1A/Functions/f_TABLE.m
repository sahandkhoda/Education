% INFO: TABLE

% === DESCRIPTIOn ===
% This function presents the global error and the corresponding degree of 
% accuracy for each method, respectively.

% ____________________________________________

function [table_1 , table_2 , table_4] = f_TABLE( ...
    error_FE_1, error_RK4_1, ...
    error_FE_2, error_RK4_2, ...
    error_FE_4, error_RK4_4, ...
    error_FE_8, error_RK4_8 ...
    )

% Time step : h
n = [100 ; 100];
METHOD = ["FE" ; "RK4"];
x_error = [error_FE_1(end,1) ; error_RK4_1(end,1)];
y_error = [error_FE_1(end,2) ; error_RK4_1(end,2)];
[p_FE, p_RK4] = DegreeOfAccuracy(error_FE_1(end,2), error_RK4_1(end,2), error_FE_2(end,2), error_RK4_2(end,2));
p = [p_FE ; p_RK4];
table_1 = table(n, METHOD, x_error, y_error, p);

% Time step : h / 2
n = [200 ; 200];
METHOD = ["FE" ; "RK4"];
x_error = [error_FE_2(end,1) ; error_RK4_2(end,1)];
y_error = [error_FE_2(end,2) ; error_RK4_2(end,2)];
[p_FE, p_RK4] = DegreeOfAccuracy(error_FE_2(end,2), error_RK4_2(end,2), error_FE_4(end,2), error_RK4_4(end,2));
p = [p_FE ; p_RK4];
table_2 = table(n, METHOD, x_error, y_error, p);

% Time step : h / 4
n = [400 ; 400];
METHOD = ["FE" ; "RK4"];
x_error = [error_FE_4(end,1) ; error_RK4_4(end,1)];
y_error = [error_FE_4(end,2) ; error_RK4_4(end,2)];
[p_FE, p_RK4] = DegreeOfAccuracy(error_FE_4(end,2), error_RK4_4(end,2), error_FE_8(end,2), error_RK4_8(end,2));
p = [p_FE ; p_RK4];
table_4 = table(n, METHOD, x_error, y_error, p);

end