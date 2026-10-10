% U3 f)

% === DESCRIPTION ===
% After calculating the x-, y-, and theta-values using Euler forward (FE) 
% and Runge-Kutta of order 4 (RK4), this script compares the numerical 
% (approximated) values with the analytical (exact) values for time step:
%   h
%   h / 2
%   h / 4
%   h / 8
% Repeated for every time step, the errors of the end-points, in both x 
% and y, are determined, as well as the order of accuracy. The results 
% are presented in a table.

% ____________________________________________

close all; clear; clc;

% === CONSTANTS ===
[b, wL, wR, aL, aR] = StartValues();
[A, B, C, D] = ABCD(b, wL, wR, aL, aR);


% === INITIAL VALUES ===
% Set specifically for circle center at (0,0).
x0 = 0; y0 = 1.5; theta0 = 0;
s0 = [x0, y0, theta0];


% === CENTER OF SHAPE ===
[xbar, ybar, R, Tlap] = robotcircle(b, wL, wR, x0, y0, theta0);


% === TIME INTERVAL ===
t_start = 0;
t_end = 7*pi/8;
tspan = [t_start, t_end];


% === NUMBER OF CALCULATIONS ===
n1 = 100; n2 = 200; n4 = 400; n8 = 800;


% === ANALYTICAL VALUES ===

% Time step: h
s_an_1 = s_analytic(tspan, x0, y0, B, D, theta0, n1);
    x_an_1 = s_an_1(:,1);
    y_an_1 = s_an_1(:,2);

% Time step: h/2
s_an_2 = s_analytic(tspan, x0, y0, B, D, theta0, n2);
    x_an_2 = s_an_2(:,1);
    y_an_2 = s_an_2(:,2);

% Time step: h/4
s_an_4 = s_analytic(tspan, x0, y0, B, D, theta0, n4);
    x_an_4 = s_an_4(:,1);
    y_an_4 = s_an_4(:,2);

% Time step: h/8
s_an_8 = s_analytic(tspan, x0, y0, B, D, theta0, n8);
    x_an_8 = s_an_8(:,1);
    y_an_8 = s_an_8(:,2);


% === FUNCTION ===
f = @(t,s) fvel_row_vec(t, s, b, wL, wR, aL, aR);


% === EULER FORWARD (FE) ===

% Time step: h
[tFE_1, sFE_1] = EulerForward(f, tspan, s0, n1);
    xFE_1 = sFE_1(:,1);
    yFE_1 = sFE_1(:,2);

% Time step: h/2
[tFE_2, sFE_2] = EulerForward(f, tspan, s0, n2);
    xFE_2 = sFE_2(:,1);
    yFE_2 = sFE_2(:,2);

% Time step: h/4
[tFE_4, sFE_4] = EulerForward(f, tspan, s0, n4);
    xFE_4 = sFE_4(:,1);
    yFE_4 = sFE_4(:,2);

% Time step: h/8
[tFE_8, sFE_8] = EulerForward(f, tspan, s0, n8);
    xFE_8 = sFE_8(:,1);
    yFE_8 = sFE_8(:,2);


% === RUNGE-KUTTA 4 (RK4) ===

% Time step: h
[tRK4_1, sRK4_1] = RK4(f, tspan, s0, n1);
    xRK4_1 = sRK4_1(:,1);
    yRK4_1 = sRK4_1(:,2);

% Time step: h/2
[tRK4_2, sRK4_2] = RK4(f, tspan, s0, n2);
    xRK4_2 = sRK4_2(:,1);
    yRK4_2 = sRK4_2(:,2);

% Time step: h/4
[tRK4_4, sRK4_4] = RK4(f, tspan, s0, n4);
    xRK4_4 = sRK4_4(:,1);
    yRK4_4 = sRK4_4(:,2);

% Time step: h/8
[tRK4_8, sRK4_8] = RK4(f, tspan, s0, n8);
    xRK4_8 = sRK4_8(:,1);
    yRK4_8 = sRK4_8(:,2);


% === DISPLAY: Resulting table ===

% Error values
[error_FE_1, error_RK4_1] = FunctionError(n1, xFE_1, yFE_1, xRK4_1, yRK4_1, x_an_1, y_an_1);
[error_FE_2, error_RK4_2] = FunctionError(n2, xFE_2, yFE_2, xRK4_2, yRK4_2, x_an_2, y_an_2);
[error_FE_4, error_RK4_4] = FunctionError(n4, xFE_4, yFE_4, xRK4_4, yRK4_4, x_an_4, y_an_4);
[error_FE_8, error_RK4_8] = FunctionError(n8, xFE_8, yFE_8, xRK4_8, yRK4_8, x_an_8, y_an_8);

% Display the table in Command Window
[T1 , T2 , T4] = f_TABLE( ...
    error_FE_1, error_RK4_1, ...
    error_FE_2, error_RK4_2, ...
    error_FE_4, error_RK4_4, ...
    error_FE_8, error_RK4_8);

disp(T1), fprintf('\n');
disp(T2), fprintf('\n');
disp(T4), fprintf('\n');