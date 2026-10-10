% U3 e)

% === DESCRIPTION ===
% This script calculates the error of FE and RK4 for the end point.

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
n = 100;


% === FUNCTION ===
f = @(t,s) fvel_row_vec(t, s, b, wL, wR, aL, aR);


% === ANALYTICAL VALUES ===
s_an = s_analytic(tspan, x0, y0, B, D, theta0, n);

    % Assigning analytical x-, y- and theta-values
    x_an     = s_an(:,1);
    y_an     = s_an(:,2);
    theta_an = s_an(:,3);


% === x- AND y-VALUES FOR EACH PLOT ===

% EULER FORWARD (FE)
[tFE, sFE] = EulerForward(f, tspan, s0, n);

    % x- and y-values
    xFE = sFE(:,1);
    yFE = sFE(:,2);

    % Error
    error_xFE  = abs(xFE - x_an);
    error_yFE  = abs(yFE - y_an);

% RUNGE-KUTTA 4 (RK4)
[tRK4, sRK4] = RK4(f, tspan, s0, n);

    % x- and y-values
    xRK4 = sRK4(:,1);
    yRK4 = sRK4(:,2);
    
    % Error
    error_xRK4 = abs(xRK4 - x_an);
    error_yRK4 = abs(yRK4 - y_an);


% === PLOT ===

% All plots in the same figure
figure(1)
hold on
axis('equal')
grid on

% Labels
title('Motion of the Robot', 'FontSize', 12)
xlabel('Position (x)')
ylabel('Position (y)')

% Ploting the graphs
plot(xFE, yFE, 'r')
plot(xRK4, yRK4, 'b')
legend('FE','RK4');

% Circle center
text(xbar, ybar, '(0,0)', 'Color', 'b', ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle')

% Direction arrow
direction = '\rightarrow';
text(x0, y0, direction, "FontSize", 20 , 'Color', 'r', ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom')


% === DISPLAY ===

% Display text in the Command Window
disp('STARTING POINT')
disp(['(x0,y0) = (', num2str(x0),   ' , ', num2str(y0),  ')'])
fprintf('\n')
disp('CIRCLE CENTER')
disp(['(xbar,ybar) = (', num2str(xbar),   ' , ', num2str(ybar),  ')'])
fprintf('\n')
disp('RADIUS')
disp(['R = ', num2str(R)])
fprintf('\n')

% Display table in the Command Window
disp(e_TABLE( ...
    xFE, yFE, xRK4, yRK4, x_an, y_an, ...
    error_xFE, error_yFE, error_xRK4, error_yRK4) ...
    )