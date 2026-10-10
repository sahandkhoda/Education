% U3 c)

% === DESCRIPTION ===
% This script uses the function fvel() and Euler Forward (FE) method to
% approximate s(t) = [x(t), y(t), theta((t)] up to a specific end time.

% === INITIAL VALUES ===
%   x0          : initial x-position.
%   y0          : initial y-position.
%   theta0      : initial angle.

% === PLOT: Direction arrow ===
% The arrow marks the starting position of the robot and its direction.

% ____________________________________________

close all
clear
clc


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
t_end = Tlap;
tspan = [t_start, t_end];


% === NUMBER OF CALCULATIONS ===
n = 100;


% === FUNCTION ===
f = @(t,s) fvel_row_vec(t, s, b, wL, wR, aL, aR);


% === EULER FORWARD (FE) ===
[tFE, sFE] = EulerForward(f, tspan, s0, n);
xFE = sFE(:,1);
yFE = sFE(:,2);


% === PLOT ===

% The figure
figure(1)
hold on
axis('equal')
grid on

% Labels
title('Motion of the Robot', 'FontSize', 12)
xlabel('Position (x)')
ylabel('Position (y)')

% Plot
plot(xFE, yFE, 'ro')

% Circle center
text(xbar, ybar, '(0,0)', 'Color', 'b', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle')

% Direction arrow
direction = '\rightarrow';
text(x0, y0, direction, "FontSize", 20 , 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom')


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